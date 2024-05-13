### Neovim config

- Inspired mostly by my LazyVim config, but removed the dependency on LazyVim and all the plugins I wasn't using and options/configurations I didn't like or use either. Then added some other plugins of my own.

![Screenshot](https://github.com/jacobrreed/nvim/blob/master/image.png?raw=true)
![Screenshot](https://github.com/jacobrreed/nvim/blob/master/image2.png?raw=true)

# nvim/

<a href="https://dotfyle.com/jacobrreed/nvim"><img src="https://dotfyle.com/jacobrreed/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/jacobrreed/nvim"><img src="https://dotfyle.com/jacobrreed/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/jacobrreed/nvim"><img src="https://dotfyle.com/jacobrreed/nvim/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:jacobrreed/nvim ~/.config/jacobrreed/nvim
```

Open Neovim with this config:

```sh
NVIM_APPNAME=jacobrreed/nvim/ nvim
```

## Plugins

### ai

- [CopilotC-Nvim/CopilotChat.nvim](https://dotfyle.com/plugins/CopilotC-Nvim/CopilotChat.nvim)

### color

- [echasnovski/mini.hipatterns](https://dotfyle.com/plugins/echasnovski/mini.hipatterns)

### colorscheme

- [eldritch-theme/eldritch.nvim](https://dotfyle.com/plugins/eldritch-theme/eldritch.nvim)

### comment

- [echasnovski/mini.comment](https://dotfyle.com/plugins/echasnovski/mini.comment)
- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
- [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
- [lukas-reineke/cmp-rg](https://dotfyle.com/plugins/lukas-reineke/cmp-rg)
- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)

### cursorline

- [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)

### debugging

- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
- [echasnovski/mini.ai](https://dotfyle.com/plugins/echasnovski/mini.ai)
- [echasnovski/mini.pairs](https://dotfyle.com/plugins/echasnovski/mini.pairs)
- [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
- [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)

### formatting

- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
- [NeogitOrg/neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)
- [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
- [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)

### golang

- [ray-x/go.nvim](https://dotfyle.com/plugins/ray-x/go.nvim)

### indent

- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

- [max397574/better-escape.nvim](https://dotfyle.com/plugins/max397574/better-escape.nvim)
- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)
- [mrcjkb/rustaceanvim](https://dotfyle.com/plugins/mrcjkb/rustaceanvim)
- [nvimdev/lspsaga.nvim](https://dotfyle.com/plugins/nvimdev/lspsaga.nvim)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)

### media

- [3rd/image.nvim](https://dotfyle.com/plugins/3rd/image.nvim)

### motion

- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### note-taking

- [epwalsh/obsidian.nvim](https://dotfyle.com/plugins/epwalsh/obsidian.nvim)

### nvim-dev

- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
- [ray-x/guihua.lua](https://dotfyle.com/plugins/ray-x/guihua.lua)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### project

- [natecraddock/workspaces.nvim](https://dotfyle.com/plugins/natecraddock/workspaces.nvim)

### quickfix

- [kevinhwang91/nvim-bqf](https://dotfyle.com/plugins/kevinhwang91/nvim-bqf)

### snippet

- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### split-and-window

- [famiu/bufdelete.nvim](https://dotfyle.com/plugins/famiu/bufdelete.nvim)

### startup

- [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
- [echasnovski/mini.surround](https://dotfyle.com/plugins/echasnovski/mini.surround)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### test

- [nvim-neotest/neotest](https://dotfyle.com/plugins/nvim-neotest/neotest)

### utility

- [echasnovski/mini.animate](https://dotfyle.com/plugins/echasnovski/mini.animate)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)

## Language Servers

- cssls
- emmet_ls
- eslint_d
- gopls
- html
- jsonls
- lua_ls
- pyright
- svelte
- tsserver

This readme was generated by [Dotfyle](https://dotfyle.com)
