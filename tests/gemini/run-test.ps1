# Test skill triggering with Gemini CLI (PowerShell)
# Usage: .\run-test.ps1 <skill-name> <prompt-file>

param(
    [Parameter(Mandatory=$true)]
    [string]$SkillName,
    [Parameter(Mandatory=$true)]
    [string]$PromptFile
)

$Timestamp = [DateTimeOffset]::Now.ToUnixTimeSeconds()
$OutputDir = Join-Path $env:TEMP "superpowers-tests\$Timestamp\gemini\$SkillName"
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$Prompt = Get-Content -Raw $PromptFile
$LogFile = Join-Path $OutputDir "gemini-output.json"

Write-Host "=== Gemini Skill Triggering Test ==="
Write-Host "Skill: $SkillName"
Write-Host "Prompt file: $PromptFile"
Write-Host "Output dir: $OutputDir"
Write-Host ""

Copy-Item $PromptFile (Join-Path $OutputDir "prompt.txt")

Write-Host "Running gemini -p with naive prompt..."
# Use Start-Process to capture output properly or just run it directly
& gemini -p "$Prompt" --approval-mode yolo --output-format stream-json | Out-File -FilePath $LogFile -Encoding utf8

Write-Host ""
Write-Host "=== Results ==="

$LogContent = Get-Content -Raw $LogFile

if ($LogContent -match '"name":"activate_skill"' -and $LogContent -match '"name":"$SkillName"') {
    Write-Host "✅ PASS: Skill '$SkillName' was triggered" -ForegroundColor Green
    $Triggered = $true
} else {
    Write-Host "❌ FAIL: Skill '$SkillName' was NOT triggered" -ForegroundColor Red
    $Triggered = $false
}

Write-Host ""
Write-Host "Full log: $LogFile"

if ($Triggered) {
    exit 0
} else {
    exit 1
}
