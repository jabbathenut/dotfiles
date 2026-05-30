## Neovim 0.11+ C++/Python Development Environment Setup (MacOS and Windows)

_NOTE: These dotfiles are designed to be managed by Chezmoi._

This is my personal repository of configuration files for a Neovim 0.11+ C++/Python development environment. While it
works well for me and my workflow, it may not be what you expect or prefer. Please use this configuration with that in
mind.

### Environment Setup Instructions

[MacOS](docs/setup_macos.md)

[Windows](docs/setup_windows.md)

### Neovim Configuration Description

#### LSPs

The LSP configurations are stored in the ~/.config/nvim/lsp directory. Configurations located in this directory are
loaded automatically by Neovim. This feature was implemented in Neovim 0.11. These loaded configurations are then
enabled and enhanced in the ~/.config/nvim/lua/config/lspconfig.lua file.

- basedpyright
- clangd
- lua-language-server (aka luals)
- neocmakelsp
- marksman

#### Formatters/Linters

- clang-format
- gersemi
- markdownlint-cli2
- prettierd
- ruff
- stylua

#### Debuggers

- codelldb (C/C++)
- debugpy (Python)

#### LSP-Related Plugins

- mason.nvim
- mason-tool-installer.nvim
- blink.cmp (completion)
- conform.nvim (formatting)
- nvim-lint (linting)
- nvim-dap (debugging)

#### Quality of Life Plugins

There are several QOL plugins that are not listed here, as they will likely change frequently. They can, however, be
easily identified in the ~/.config/nvim/lua/plugins directory.
