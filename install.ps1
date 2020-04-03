# # Self-elevate the script if required
# if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
#     if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
#         $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
#         Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
#         Exit
#     }
# }


# User Profile
Write-Host "User Profile Directory: $($env:USERPROFILE)"

# VS Code Directory
$app_data = $env:APPDATA
Write-Host "VS Code User Directory: $($app_data)\Code\User"
$vscode_user_settings_path = "$($app_data)\Code\User\settings.json"
Write-Host "VS Code User Settings Path: $($vscode_user_settings_path)"

# Cmder Config Directory
$cmder_root = $env:CMDER_ROOT
Write-Host "Cmder Config Directory: $($cmder_root)\config"
$cmder_user_profile_cmd_path = "$($cmder_root)\config\user_profile.cmd"
Write-Host "Cmder CMD User Profile Path: $($cmder_user_profile_cmd_path)"
$cmder_user_aliases_cmd_path = "$($cmder_root)\config\user_aliases.cmd"
Write-Host "Cmder CMD Aliases Path: $($cmder_user_aliases_cmd_path)"
$cmder_user_profile_ps_path = "$($cmder_root)\config\user_profile.ps1"
Write-Host "Cmder PowerShell Profile Path: $($cmder_user_profile_ps_path)"

# Neovim Config Directory
$local_app_data = $env:LOCALAPPDATA
Write-Host "Neovim Init Directory: $($local_app_data)\nvim"
$neovim_init_path = "$($local_app_data)\nvim\init.vim"
Write-Host "Neovim Init Path: $($neovim_init_path)"

if (-not (Test-Path -Path $cmder_user_aliases_cmd_path)) {
    
} else {
    Write-Host "Cmder User Aliases Exists"
}


if (-not (Test-Path -Path $cmder_user_profile_cmd_path)) {

} else {
    Write-Host "Cmder User Profile Exists"
}


if (-not (Test-Path -Path $cmder_user_profile_ps_path)) {

} else {
    Write-Host "Cmder Powershell Profile Exists"
}


if (-not (Test-Path -Path $vscode_user_settings_path)) {

} else {
    Write-Host "VS Code User Settings Exists"
}

if (-not (Test-Path -Path $neovim_init_path)) {
    Write-Host "Repo init.vim: $($PWD)\vim\init.vim"
    New-Item -Path $neovim_init_path -ItemType SymbolicLink -Value "$($PWD)\vim\init.vim"
    Get-Item -Path $neovim_init_path
} else {
    Write-Host "Neovim Init Path Exists"
}

Write-Host -NoNewline "Press any key to continue.."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")