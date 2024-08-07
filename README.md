# Gylfirst NeoVim config

This repository contains all my configuration files for my NeoVim. You are free to use the config and modify it.

> You need sudo and git installed on your computer.

## Config details

### Plugin manager
- Lazy

### Plugin list
- alpha
- lualine
- mason
- mason-lspconfig
- neo-tree
- nvim-lspconfig
- telescope
- treesitter

---

#### LSP (language Server Protocol)

You can add more lsp using `mason-lspconfig` plugin. Check [here](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers) for the list. To configure them, use the `nvim-lspconfig` plugin.

#### Keybindings

You can modify keybindings as you want.

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

You can now launch NeoVim using `nvim` command in  your terminal.  
It will install lazy and all plugins at first launch. You can restart it after in order to get the main menu (alpha).

# Author
[Gylfirst](https://github.com/gylfirst)

# License
This project is under MIT License.
