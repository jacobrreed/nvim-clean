return {
  "vyfor/cord.nvim",
  build = "./build || .\\build",
  event = "VeryLazy",
  opts = {
    editor = {
      tooltip = "Neovim btw...",
    },
    display = {
      show_cursor_position = true,
    },
    lsp = {
      show_problem_count = true,
      severity = 1,
      scope = "buffer",
    },
  },
  config = function(_, opts)
    require("cord").setup(opts)
  end,
}
