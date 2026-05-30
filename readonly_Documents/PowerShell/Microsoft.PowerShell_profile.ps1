# Starship (custom terminal prompt)
$env:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
Invoke-Expression (&starship init powershell)

# Eza (better ls)
Set-Alias -Name ls -Value eza

# Zoxide (better cd)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

### YAZI START ###
# Set file.exe location for mime-type file detection (using Git's file)
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# Set custom config location
$env:YAZI_CONFIG_HOME = "$HOME\.config\yazi"

# Set shell wrapper to change working directory upon Yazi exit
function y {
	$tmp = (New-TemporaryFile).FullName
	yazi.exe @args --cwd-file="$tmp"
	$cwd = Get-Content -Path $tmp -Encoding UTF8
	if ($cwd -and $cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container)) {
		Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
	}
	Remove-Item -Path $tmp
}
### YAZI END ###

# Neovim
$env:XDG_CONFIG_HOME = "$HOME\.config"