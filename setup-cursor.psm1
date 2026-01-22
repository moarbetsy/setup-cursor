# setup-cursor.psm1
# PowerShell module for setup-cursor
# Import the profile script to make setup-cursor function available

# Get the module directory
$moduleDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Import the profile script
$profileScriptPath = Join-Path $moduleDir "setup-cursor-profile.ps1"
if (Test-Path $profileScriptPath) {
    . $profileScriptPath
} else {
    Write-Warning "setup-cursor-profile.ps1 not found in module directory: $moduleDir"
}

# Export the function and alias
Export-ModuleMember -Function setup-cursor -Alias sc