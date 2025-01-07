return {
  {
    "zbirenbaum/copilot.lua",
    enabled = not vim.g.vscode,
    opts = {
      filetypes = { markdown = false, help = false },
      copilot_node_command = vim.fn.expand("$FNM_DIR") .. "/node-versions/v18.18.0/installation/bin/node",
    },
  },
  {
    "AndreM222/copilot-lualine",
    enabled = not vim.g.vscode,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      auto_insert_mode = false,
      model = "claude-3.5-sonnet",
      highlight_headers = false,
    },
  },
}
