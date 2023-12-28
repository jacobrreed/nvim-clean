return {
  "natecraddock/workspaces.nvim",
  cond = not vim.g.vscode,
  opts = {
    hooks = {
      open_pre = {
        "SessionsStop",
        "silent %bdelete!",
      },
      open = {
        function()
          require("sessions").load(nil, { silent = true })
        end,
      },
    },
  },
}
