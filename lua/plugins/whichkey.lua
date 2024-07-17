return {
  "folke/which-key.nvim",
  dependencies = {
    -- {
    --   "echasnovski/mini.icons",
    --   version = false,
    -- },
    {
      "nvim-tree/nvim-web-devicons",
    },
  },
  cond = not vim.g.vscode,
  opts = function()
    local wrap_toggle = function()
      return { "<cmd>set wrap!<cr>", "Toggle line wrapping" }
    end
    return {
      preset = "helix",
      plugins = { spelling = true },
    }
  end,
  config = function(_, opts)
    local wk = require("which-key")
    local get_icon = require("nvim-web-devicons").get_icon
    wk.setup(opts)
    wk.add({
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>C", group = "Copilot", icon = " " },
        { "<leader>Ca", "<cmd>Copilot panel accept<cr>", desc = "Accept current highlighted panel suggestion" },
        { "<leader>Cp", "<cmd>Copilot panel open<cr>", desc = "Open panel" },
        { "<leader>Cs", "<cmd>Copilot status<cr>", desc = "Status" },
        { "<leader>Ll", group = "Lspsaga" },
        { "<leader>Q", group = "Quit/Session/Save" },
        { "<leader>Ql", "<cmd>SessionsLoad<cr>", desc = "Load Session" },
        { "<leader>Qq", "<cmd>xa!<cr>", desc = "Save all and quit" },
        { "<leader>Qs", "<cmd>SessionsSave<cr>", desc = "Save Session" },
        { "<leader>W", group = "Workspaces", icon = " " },
        { "<leader>Wa", "<cmd>WorkspacesAdd<cr>", desc = "Add Workspace" },
        { "<leader>Wd", "<cmd>WorkspacesRemove<cr>", desc = "Delete Workspace" },
        { "<leader>Wl", "<cmd>Telescope workspaces<cr>", desc = "List Workspaces" },
        { "<leader>c", group = "Code" },
        { "<leader>cf", group = "Format" },
        { "<leader>cn", group = "Neotest" },
        { "<leader>g", group = "Git" },
        { "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy" },
        { "<leader>r", group = "Regroup" },
        { "<leader>s", group = "CodeSnap" },
        { "<leader>t", group = "Telescope" },
        { "<leader>u", group = "UI" },
        { "<leader>un", group = "Noice" },
        { "<leader>uw", "<cmd>set wrap!<cr>", desc = "Toggle line wrapping" },
        { "<leader>w", group = "Windows" },
        { "<leader>x", group = "Diagnostics/Quickfix" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
      },
    })
  end,
  event = { "VeryLazy" },
}
