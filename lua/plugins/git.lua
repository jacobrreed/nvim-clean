return {
  {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "" },
        untracked = { text = "" },
      },
      current_line_blame = true,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle blame Line")
      end,
    },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  },
  {
    "kdheepak/lazygit.nvim",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  }
}
