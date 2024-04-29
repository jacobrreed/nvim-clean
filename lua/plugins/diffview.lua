return {
  "sindrets/diffview.nvim",
  cond = not vim.g.vscode,
  keys = {
    {
      "<leader>gd",
      function()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()
        if view then
          vim.cmd.DiffviewClose()
        else
          vim.cmd.DiffviewOpen()
        end
      end,
      desc = "Diffview",
    },
  },
}
