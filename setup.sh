#!/bin/bash
# Superpowers for Gemini - Linux/macOS Setup Script

REPO_URL="https://github.com/woleks/superpowers-gemini.git"
TARGET_DIR="$HOME/projects/superpowers"
SKILLS_DIR="$HOME/.gemini/skills"

echo "--- Superpowers Setup Starting ---"

# 1. Clone or Update
if [ ! -d "$TARGET_DIR" ]; then
    echo "Cloning repository to $TARGET_DIR..."
    git clone "$REPO_URL" "$TARGET_DIR"
else
    echo "Repository already exists. Updating..."
    cd "$TARGET_DIR" && git pull
fi

# 2. Ensure Skills Dir
mkdir -p "$SKILLS_DIR"

# 3. Symlink
echo "Setting up symbolic links..."
for d in "$TARGET_DIR"/skills/*/ ; do
    skill_name=$(basename "$d")
    # -n handles symlinks to directories correctly, -f forces replacement
    ln -snf "$d" "$SKILLS_DIR/$skill_name"
    echo "  [OK] $skill_name"
done

echo "--- Setup Complete! ---"
echo "You can now use 'activate_skill(name: \"using-superpowers\")' in any project."
