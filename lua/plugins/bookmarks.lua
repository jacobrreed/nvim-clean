return {
  "crusj/bookmarks.nvim",
  branch = "main",
  dependencies = { "nvim-web-devicons" },
  opts = {
    keymap = {
      toggle = "ml",
      close = "q",
      add = "ma",
      delete = "dd",
      delete_on_virt = "mt",
    },
    border_style = "rounded",
    width = 0.9,
    height = 0.9,
    preview_ratio = 0.3,
    tags_ratio = 0.08,
  },
}
