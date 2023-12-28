return {
  "akinsho/bufferline.nvim",
  cond = not vim.g.vscode,
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
  opts = {
    options = {
      mode = "buffers",
      show_buffer_close_icons = true,
      show_tab_indicators = false,
      max_name_length = 26,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  keys = function()
    local wk = require("which-key")
    wk.register({ ["<leader>b"] = { name = "Buffer" } })
    return {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<S-Right>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
      { "<S-Left>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
      { "[b", "<cmd>bprevious<cr>", desc = "Prev buffer" },
      { "]b", "<cmd>bnext<cr>", desc = "Next buffer" },
      { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete current buffer" },
    }
  end,
}
