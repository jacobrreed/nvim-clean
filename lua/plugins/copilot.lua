return {
  {
    "zbirenbaum/copilot.lua",
    cond = not vim.g.vscode,
    cmd = "Copilot",
    build = ":Copilot auth",
    event = {
      "BufEnter",
      "BufReadPre",
      "InsertEnter",
    },
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
      copilot_node_command = os.getenv("FNM_DIR") and vim.fn.expand("$FNM_DIR") .. "/aliases/default/bin/node"
        or "node",
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    cond = not vim.g.vscode,
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  { "AndreM222/copilot-lualine", cond = not vim.g.vscode },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = not vim.g.vscode,
    branch = "canary",
    event = {
      "BufEnter",
      "BufReadPre",
      "InsertEnter",
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({})
    end,
    keys = {
      { "<leader>Ct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      {
        "<leader>Cc",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          vim.cmd("CopilotChat " .. input .. "?")
        end,
        desc = "CopilotChat - Chat",
      },
      { "<leader>Ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>Cr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>Cf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix diagnostic" },
      { "<leader>CF", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix code", mode = "v" },
      { "<leader>Ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>CT", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>Ct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      {
        "<leader>Cf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
    },
  },
}
