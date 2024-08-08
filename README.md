# Gylfirst NeoVim config

This repository contains all my configuration files for my NeoVim. You are free to use the config and modify it.

> You need sudo and git and fd installed on your computer.

## Config details

### Plugin manager

- Lazy

### Plugin list

- alpha
- cmp-luasnip
- cmp-nvim-lsp
- friendly-snippets
- ident-blankline
- lualine
- LuaSnip
- mason
- mason-lspconfig
- mason-null-ls
- neo-tree
- null_ls
- nvim-cmp
- nvim-dap
- nvim-dap-ui
- nvim-lspconfig
- telescope
- treesitter
- venv-selector
- wakatime

---

#### LSP (language Server Protocol)

You can add more lsp using `mason-lspconfig` plugin. Check [here](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers) for the list. To configure them, use the `nvim-lspconfig` plugin.

#### Formatter

This config uses ruff, so you need to have installed.

```bash
# On Arch Linux based distribution
sudo pacman -S ruff
```

#### Debugger

##### Python

In order to get it work, you need to install debugpy in a python virtual env (`pip install debugpy`) and change the path in the config file `plugins/debugging.lua`.

#### Keybindings

You can modify keybindings as you want.
You can find them in `vim-options.lua` or other .lua files in plugins folder.

## Installation

Get the configuration to your computer.

```bash
git clone https://github.com/gylfirst/GylNVim.git
cd GylNVim
```

Execute script to install NeoVim and the config. Follow the steps.

```bash
chmod +x ./install.sh
./install.sh
```

You can now launch NeoVim using `nvim` command in your terminal.  
It will install lazy and all plugins at first launch. You can restart it after in order to get the main menu (alpha).

#### Wakatime

The configuration comes with Wakatime, so you need to give the API key for this. To do it, type `:WakaTimeApiKey` and enter your API Key. More information [here](https://wakatime.com/neovim#lazyvim-install).

# Author

[Gylfirst](https://github.com/gylfirst)

# License

This project is under MIT License.
