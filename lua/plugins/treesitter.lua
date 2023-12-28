-- https://github.com/nvim-treesitter/nvim-treesitter#available-modules
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    config = function(_, opts)
      local have = require("util").have

      -- Hyprlang
      require("nvim-treesitter.parsers").get_parser_configs().hyprlang = {
        install_info = {
          url = "https://github.com/luckasRanarison/tree-sitter-hyprlang",
          files = { "src/parser.c" },
          branch = "master",
        },
        filetype = "hyprlang",
      }
      local function add(lang)
        if type(opts.ensure_installed) == "table" then
          table.insert(opts.ensure_installed, lang)
        end
      end
      vim.filetype.add({
        extension = { rasi = "rasi" },
        pattern = {
          [".*/waybar/config"] = "jsonc",
          [".*/mako/config"] = "dosini",
          [".*/kitty/*.conf"] = "bash",
        },
      })
      -- Git config
      add("git_config")
      -- Rofi / Wofi
      if have("rofi") or have("wofi") then
        add("rasi")
      end

      -- Rust
      add("ron")
      add("rust")
      add("toml")

      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      opts.disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_getName(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
          -- When in diff mode, we want to use the default
          -- vim text objects c & C instead of the treesitter ones.
          local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
          local configs = require("nvim-treesitter.configs")
          for name, fn in pairs(move) do
            if name:find("goto") == 1 then
              move[name] = function(q, ...)
                if vim.wo.diff then
                  local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                  for key, query in pairs(config or {}) do
                    if q == query and key:find("[%]%[][cC]") then
                      vim.cmd("normal! " .. key)
                      return
                    end
                  end
                end
                return fn(q, ...)
              end
            end
          end
        end,
      },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      auto_install = true,
      autotag = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "hyprlang",
        "java",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = require("util.event").LazyFile,
    opts = {},
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      separator = "",
      max_lines = 0,
    },
  },
  {
    "luckasRanarison/tree-sitter-hyprlang",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        require("nvim-treesitter.parsers").get_parser_configs().hyprlang = {
          install_info = {
            url = "https://github.com/luckasRanarison/tree-sitter-hyprlang",
            files = { "src/parser.c" },
            branch = "master",
          },
          filetype = "hyprlang",
        }

        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "hyprlang" })
      end,
    },
    enabled = function()
      return require("util").have("hypr")
    end,
    event = "BufRead */hypr/*.conf",
  },
}
