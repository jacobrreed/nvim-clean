return {
  "ptdewey/yankbank-nvim",
  config = function()
    require("yankbank").setup()
    require("which-key").add({ "<leader>y", icon = "󰆒 ", desc = "YankBank" })
  end,
}
