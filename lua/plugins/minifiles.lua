return {
  "echasnovski/mini.files",
  version = "*",
  config = function()
    local minifiles = require("mini.files")
    minifiles.setup({
      windows = {
        preview = true,
        width_focus = 50,
        width_nofocus = 25,
        width_preview = 80,
      },
    })
    vim.keymap.set("n", "<leader>e", minifiles.open, { noremap = true })
  end,
}
