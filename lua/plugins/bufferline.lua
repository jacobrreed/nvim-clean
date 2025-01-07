return {
  "akinsho/bufferline.nvim",
  vscode = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      themable = true,
      mode = "buffers",
      color_icons = true,
      separator_style = { " ", " " },
      show_tab_indicators = false,
      show_buffer_icons = true,
      max_name_length = 26,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_update_on_event = true, -- use nvim's diagnostic handler
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
    wk.add({ { "<leader>b", group = "Buffer" } })
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
    }
  end,
}
