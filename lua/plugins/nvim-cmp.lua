return {
  {
    "hrsh7th/nvim-cmp",
    cond = not vim.g.vscode,
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local opts = {
        enabled = function()
          local disabled = false
          disabled = disabled or (vim.api.nvim_buf_get_option(0, "buftype") == "prompt")
          return not disabled
        end,
        experimental = {
          ghost_text = true,
        },
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<tab>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<S-CR>"] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "crates" },
          { name = "copilot" },
          { name = "luasnip" },
          { name = "rg", keyword_length = 3 },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            max_width = 100,
            symbol_map = {
              Copilot = require("util").ui.icons.kinds.Copilot,
              crates = require("util").ui.icons.kinds.Package,
            },
          }),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      }

      require("cmp").setup(opts)
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
      "lukas-reineke/cmp-rg",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
    },
  },
}
