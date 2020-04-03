# User Profile
Write-Host "$($env:USERPROFILE)"
# VS Code Directory
Write-Host "$($env:APPDATA)\Code\User"
# Cmder Config Directory
Write-Host "$($env:CMDER_ROOT)\config"

$cmder_user_aliases_cmd_path = "$($env:CMDER_ROOT)\config\user_aliases.cmd"
if (-not (Test-Path -Path $cmder_user_aliases_cmd_path)) {
    
} else {
    Write-Host "Cmder User Aliases Exists"
}

$cmder_user_profile_cmd_path = "$($env:CMDER_ROOT)\config\user_profile.cmd"
if (-not (Test-Path -Path $cmder_user_profile_cmd_path)) {

} else {
    Write-Host "Cmder User Profile Exists"
}

$cmder_user_profile_ps_path = "$($env:CMDER_ROOT)\config\user_profile.ps1"
if (-not (Test-Path -Path $cmder_user_profile_ps_path)) {

} else {
    Write-Host "Cmder Powershell Profile Exists"
}

$vscode_user_settings_path = "$($env:APPDATA)\Code\User"
if (-not (Test-Path -Path $vscode_user_settings_path)) {

} else {
    Write-Host "VS Code User Settings Exists"
}