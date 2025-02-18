M = {
  {
    "folke/tokyonight.nvim",
    opts = {},
  },
  {
    "Mofiqul/dracula.nvim",
    opts = {
      transparent_bg = true,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "wnkz/monoglow.nvim",
    opts = { transparent = true },
  },
  {
    "maxmx03/fluoromachine.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "oxfist/night-owl.nvim",
    opts = {
      transparent_background = true,
    },
  },
}

for i in ipairs(M) do
  M[i].lazy = true
  M[i].priority = 1000
end
return M
