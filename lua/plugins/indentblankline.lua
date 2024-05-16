return {
  "lukas-reineke/indent-blankline.nvim",
  event = require("util.event").LazyFile,
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = true,
      char = "│",
      highlight = "NonText",
      show_start = true,
      show_end = true,
      injected_languages = true,
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  -- config = function(_, opts)
  --   require("ibl").setup(opts)
  --   vim.cmd.highlight("clear @ibl.scope.underline.1")
  --   vim.cmd.highlight("link @ibl.scope.underline.1 IndentBlankLineScopeParent")
  -- end,
  main = "ibl",
}
