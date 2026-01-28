#!/bin/bash
# Test skill triggering with Gemini CLI
# Usage: ./run-test.sh <skill-name> <prompt-file>

set -e

SKILL_NAME="$1"
PROMPT_FILE="$2"

if [ -z "$SKILL_NAME" ] || [ -z "$PROMPT_FILE" ]; then
    echo "Usage: $0 <skill-name> <prompt-file>"
    echo "Example: $0 systematic-debugging ./test-prompts/debugging.txt"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

TIMESTAMP=$(date +%s)
OUTPUT_DIR="/tmp/superpowers-tests/${TIMESTAMP}/gemini/${SKILL_NAME}"
mkdir -p "$OUTPUT_DIR"

PROMPT=$(cat "$PROMPT_FILE")

echo "=== Gemini Skill Triggering Test ==="
echo "Skill: $SKILL_NAME"
echo "Prompt file: $PROMPT_FILE"
echo "Output dir: $OUTPUT_DIR"
echo ""

cp "$PROMPT_FILE" "$OUTPUT_DIR/prompt.txt"

LOG_FILE="$OUTPUT_DIR/gemini-output.json"
cd "$OUTPUT_DIR"

echo "Running gemini -p with naive prompt..."
# Note: We use --approval-mode yolo to avoid interactive prompts in tests
gemini -p "$PROMPT" \
    --approval-mode yolo \
    --output-format stream-json \
    > "$LOG_FILE" 2>&1 || true

echo ""
echo "=== Results ==="

# Check if skill was triggered (look for activate_skill tool invocation)
if grep -q '"name":"activate_skill"' "$LOG_FILE" && grep -q """name""":"${SKILL_NAME}"" "$LOG_FILE"; then
    echo "✅ PASS: Skill '$SKILL_NAME' was triggered"
    TRIGGERED=true
else
    echo "❌ FAIL: Skill '$SKILL_NAME' was NOT triggered"
    TRIGGERED=false
fi

echo ""
echo "Full log: $LOG_FILE"

if [ "$TRIGGERED" = "true" ]; then
    exit 0
else
    exit 1
fi
