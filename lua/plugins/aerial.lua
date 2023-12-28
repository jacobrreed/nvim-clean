return {
  "stevearc/aerial.nvim",
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = function()
    local icons = vim.deepcopy(require("util").ui.icons.kinds)

    -- HACK: fix lua's weird choice for `Package` for control
    -- structures like if/else/for/etc.
    icons.lua = { Package = icons.Control }

    ---@type table<string, string[]>|false
    local filter_kind = false
    local kind_filter = require("util").ui.kind_filter
    if kind_filter then
      filter_kind = assert(vim.deepcopy(kind_filter))
      filter_kind._ = filter_kind.default
      filter_kind.default = nil
    end

    local opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      layout = {
        max_width = { 50, 0.2 },
        resize_to_content = true,
        win_opts = {
          winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
          signcolumn = "yes",
          statuscolumn = " ",
        },
      },
      icons = icons,
      filter_kind = filter_kind,
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
    }
    return opts
  end,
  keys = {
    { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
  },
}
