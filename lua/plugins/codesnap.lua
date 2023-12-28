return {
  "mistricky/codesnap.nvim",
  build = "make",
  opts = {
    bg_color = "#212337",
    code_font_family = "JetBrains Mono",
    watermark = "",
    save_path = "~/codesnap/",
    has_breadcrumbs = true,
    breadcrumb_separator = "⇝",
  },
  keys = {
    {
      "<leader>ss",
      ":CodeSnap<cr>",
      desc = "CodeSnap",
      mode = "x",
      silent = true,
    },
    {
      "<leader>sS",
      ":CodeSnapSave<cr>",
      desc = "CodeSnap save to ~/codesnap",
      mode = "x",
      silent = true,
    },
  },
}
