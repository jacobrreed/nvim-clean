return {
  "ptdewey/yankbank-nvim",
  config = function()
    require("yankbank").setup()
  end,
  keys = {
    { "<leader>y", "<cmd>YankBank<cr>", desc = "YankBank" },
  },
}
