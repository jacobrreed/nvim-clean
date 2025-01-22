return {
  "chrisgrieser/nvim-scissors",
  opts = {
    snippetDir = vim.fn.stdpath("config") .. "/snippets",
  },
  keys = {
    {
      "<leader>Sa",
      function()
        local start_line, end_line =
          math.min(vim.fn.line("."), vim.fn.line("v")), math.max(vim.fn.line("."), vim.fn.line("v"))
        vim.cmd(string.format("%d,%d ScissorsAddNewSnippet", start_line, end_line))
      end,
      desc = "✀  Add Snippet",
      mode = "v",
    },
    {
      "<leader>Se",
      function()
        local start_line, end_line =
          math.min(vim.fn.line("."), vim.fn.line("v")), math.max(vim.fn.line("."), vim.fn.line("v"))
        vim.cmd(string.format("%d,%d ScissorsEditSnippet", start_line, end_line))
      end,
      desc = "✀  Edit Snippet",
      mode = "v",
    },
  },
}
