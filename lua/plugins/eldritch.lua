return {
  -- dir = "~/dev/eldritch-workspace/eldritch.nvim",
  "eldritch-theme/eldritch.nvim",
  priority = 1000,
  opts = {
    transparent = false,
  },
  config = function(_, opts)
    local eldritch = require("eldritch")
    eldritch.setup(opts)
    vim.cmd([[colorscheme eldritch]])
  end,
}
