return {
  "folke/trouble.nvim",
  cond = not vim.g.vscode,
  opts = { use_diagnostic_signs = true },
  branch = "dev",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics (Trouble)" },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "<leader>cS",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP references/definitions/... (Trouble)",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous Trouble/Quickfix Item",
    },
  },
}
