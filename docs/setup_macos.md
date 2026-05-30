## Environment Setup Instructions

### MacOS

#### Homebrew

- Install Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Execute the following commands

```zsh
echo >> /Users/jabba/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jabba/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### Git

- Install Git with Homebrew

```zsh
brew install git
```

- Configure Git settings

```zsh
git config --global user.name "jabbathenut"
git config --global user.email grimesje@protonmail.com
git config --global core.editor nvim
git config --global init.defaultBranch main
git config --global core.excludesfile ~/.gitignore_global
```

#### CMake

- Install CMake with Homebrew

```zsh
brew install cmake
```

#### Ninja

- Install Ninja with Homebrew

```zsh
brew install ninja
```

#### Chezmoi

- Install Chezmoi with Homebrew

```zsh
brew install chezmoi
```

- Initialize Chezmoi with the dotfiles repository

```zsh
chezmoi init https://github.com/jabbathenut/dotfiles.git
```

- Install dotfiles to their target locations

```zsh
chezmoi apply
```

#### Python

- Install standard build tools (may be required by some python versions)

```zsh
brew install openssl readline sqlite3 xz zlib
```

- Install pyenv and pyenv-virtualenv

```zsh
brew install pyenv
brew install pyenv-virtualenv
```

- Add the following to .zshrc (should be in repository)

```zsh
# pyenv and pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv" >> ~/.zshrc
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH" >> ~/.zshrc
eval "$(pyenv init -)" >> ~/.zshrc
eval "$(pyenv virtualenv-init -)" >> ~/.zshrc
```

- Install Python (version 3.x.x)

```zsh
pyenv install 3.x.x
```

- Set it to the global version

```zsh
pyenv global 3.x.x
```

- Exit terminal and re-open to capture the new installed python information

#### Nerd Font

- Install Nerd Font with Homebrew

```zsh
brew install --cask font-jetbrains-mono-nerd-font
```

#### Starship

- Install Starship with Homebrew

```zsh
brew install starship
```

- Add the following to .zshrc (should be in repository)

```zsh
# Starship (custom terminal prompt)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
```

#### Ghostty

- Install Ghostty with Homebrew

```zsh
brew install --cask ghostty
```

#### Eza

- Install Eza with Homebrew

```zsh
brew install eza
```

- Add the following to .zshrc (should be in repository)

```zsh
# Eza (better ls)
alias ls="eza --icons=always"
```

#### Zoxide

- Install Zoxide with Homebrew

```zsh
brew install zoxide
```

- Add the following to .zshrc (should be in repository)

```zsh
# Zoxide (better cd)
eval "$(zoxide init zsh)" alias cd="z"
```

#### Yazi

- Install Yazi with Homebrew

```zsh
brew install yazi
```

- Install Yazi dependencies with Homebrew

```zsh
brew install ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick
```

- Add the following to .zshrc (should be in repository)

```zsh
### YAZI START ###
# Set Yazi default editor
export EDITOR="nvim"

# Shell wrapper function that provides the ability to change the
# current working directory when exiting Yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
### YAZI END ###
```

#### Neovim

- Install Python virtual environment for Neovim

```zsh
pyenv virtualenv 3.x.x neovim-env
pyenv activate neovim-env
pip install pynvim
pyenv deactivate
```

- Install Neovim with Homebrew

```zsh
brew install neovim
```

- Install Neovim configuration dependencies with Homebrew

```zsh
brew install node yarn ripgrep tree-sitter-cli universal-ctags lazygit rust
```
