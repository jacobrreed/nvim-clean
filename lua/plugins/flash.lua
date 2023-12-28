return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      multi_window = false,
    },
    modes = {
      search = {
        enabled = false,
      },
      char = {
        jump_labels = false,
      },
    },
    label = {
      rainbow = {
        enabled = true,
        shades = 9,
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}
