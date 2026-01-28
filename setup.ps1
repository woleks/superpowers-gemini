# Superpowers for Gemini - Windows Setup Script
# This script clones the repo and sets up symlinks for Gemini CLI

$RepoUrl = "https://github.com/woleks/superpowers-gemini.git"
$TargetDir = "$HOME\projects\superpowers"
$SkillsDir = "$HOME\.gemini\skills"

Write-Host "--- Superpowers Setup Starting ---" -ForegroundColor Cyan

# 1. Clone or Update Repo
if (!(Test-Path $TargetDir)) {
    Write-Host "Cloning repository to $TargetDir..."
    git clone $RepoUrl $TargetDir
} else {
    Write-Host "Repository already exists at $TargetDir. Updating..."
    cd $TargetDir
    git pull
}

# 2. Ensure Skills Directory exists
if (!(Test-Path $SkillsDir)) {
    Write-Host "Creating $SkillsDir..."
    New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null
}

# 3. Create Symlinks
Write-Host "Setting up symbolic links for skills..."
Get-ChildItem -Path "$TargetDir\skills\*" -Directory | ForEach-Object {
    $linkPath = Join-Path $SkillsDir $_.Name
    # Ensure fresh and correct link by removing existing item first
    if (Test-Path $linkPath) {
        Remove-Item $linkPath -Recurse -Force
    }
    New-Item -ItemType SymbolicLink -Path $linkPath -Target $_.FullName | Out-Null
    Write-Host "  [OK] $($_.Name)"
}

Write-Host "--- Setup Complete! ---" -ForegroundColor Green
Write-Host "You can now use 'activate_skill(name: ""using-superpowers"")' in any project."
