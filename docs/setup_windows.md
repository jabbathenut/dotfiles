## Environment Setup Instructions

### Windows

#### Powershell

- Install Powershell 7

```bash
winget install --id Microsoft.Powershell --source winget
```

#### Scoop

- Install Scoop

```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

#### Git

- Install Git

```bash
winget install --id Git.Git -e --source winget
```

- Configure Git settings

```bash
git config --global user.name "jabbathenut"
git config --global user.email grimesje@protonmail.com
git config --global core.editor nvim
git config --global init.defaultBranch main
git config --global core.excludesfile ~/.gitignore_global
git config --global core.autocrlf true
git config --global core.safecrlf false
```

#### CMake

- Install CMake

```bash
winget install --id Kitware.CMake -e --source winget
```

#### Ninja

- Install Ninja

```bash
winget install --id Ninja-build.Ninja -e --source winget
```

#### Chezmoi

- Install Chezmoi with Scoop

```bash
scoop install chezmoi
```

- Initialize Chezmoi with the dotfiles repository

```bash
chezmoi init https://github.com/jabbathenut/dotfiles.git
```

- Install dotfiles to their target locations

```bash
chezmoi apply
```

#### Python

- Install pyenv-win and pyenv-win-venv

```bash
git clone https://github.com/pyenv-win/pyenv-win.git "$HOME\.pyenv"
git clone https://github.com/pyenv-win/pyenv-win-venv "$HOME\.pyenv-win-venv"
```

- Add pyenv-win user environment variables

```bash
PYENV: %USERPROFILE%\.pyenv\pyenv-win
PYENV_ROOT: %USERPROFILE%\.pyenv\pyenv-win
PYENV_HOME: %USERPROFILE%\.pyenv\pyenv-win
```

- Add pyenv-win and pyenv-win-venv to USER PATH variable

```bash
%USERPROFILE%\.pyenv\pyenv-win\bin
%USERPROFILE%\.pyenv\pyenv-win\shims
%USERPROFILE%\.pyenv-win-venv\bin
```

- Exit terminal and re-open to utilize the new pyenv environment variables

- Install Python (version 3.x.x)

```bash
pyenv install 3.x.x
```

- Set it to the global version

```bash
pyenv global 3.x.x
```

- Disable Windows 11 default Python app execution aliases
  - Go to Settings >> Apps >> Advanced app settings >> App execution aliases
  - Turn off the following items, if they exist
    - App Installer: python.exe
    - App Installer: python3.exe

#### Nerd Font

- Install Nerd Font with Scoop

```bash
scoop bucket add nerd-fonts
scoop install nerd-fonts/JetBrainsMono-NF
```

#### Starship

- Install Starship with Scoop

```bash
scoop install starship
```

- Add the following to Powershell $PROFILE (should be in repository)

```bash
# Starship (custom terminal prompt)
$env:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
Invoke-Expression (&starship init powershell)
```

#### WezTerm

```bash
scoop bucket add extras
scoop install wezterm
```

#### Eza

- Install Eza with Scoop

```bash
scoop install eza
```

- Add the following to Powershell $PROFILE (should be in repository)

```bash
# Eza (better ls)
Set-Alias -Name ls -Value eza
```

#### Zoxide

- Install Zoxide with Scoop

```bash
scoop install zoxide
```

- Add the following to Powershell $PROFILE (should be in repository)

```bash
# Zoxide (better cd)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
```

#### Yazi

- Install Yazi with Scoop

```bash
scoop install yazi
```

- Install Yazi dependencies with Scoop

```bash
scoop bucket add extras
scoop install ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
scoop install ghostscript jid extras/vcredist2022
```

- Add the following to Powershell $PROFILE (should be in repository)

```bash
### YAZI START
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
### YAZI END
```

#### Neovim

- Install Python virtual environment for Neovim

```bash
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
pyenv-win-venv install 3.x.x neovim-env
pyenv-win-venv activate neovim-env
pip install pynvim
pyenv-win-venv deactivate
```

- Close Powershell and reopen
- Install Neovim with Scoop

```bash
scoop install neovim
```

- Install Neovim configuration dependencies with Scoop

```bash
scoop install nodejs yarn ripgrep tree-sitter rust zig make
scoop install extras/universal-ctags extras/lazygit
```

- Add the following to Powershell $PROFILE (should be in repository)

```bash
# Neovim
$env:XDG_CONFIG_HOME = "$HOME\.config"
```

#### Adjust Powershell Appearance

- Add Catppuccin Mocha color scheme to Windows Terminal
  - Download Catppuccin Mocha color scheme json file from the following location
    - https://github.com/catppuccin/windows-terminal/blob/main/mocha.json
  - In Windows Terminal, go to Settings and select "Open JSON File" at the bottom
  - Copy the Cappuccin Mocha color scheme into the section entitled "schemes"
  - Go to Settings >> Profiles >> Defaults >> Appearance and make the following adjustments:
    - "Color scheme" = Catppuccin Mocha
    - "Font face" = JetBrainsMono Nerd Font
    - "Background opacity" = 95%
