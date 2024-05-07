return {
  -- dir = "~/dev/eldritch-workspace/eldritch.nvim",
  "eldritch-theme/eldritch.nvim",
  priority = 1000,
  opts = {
    transparent = true,
    -- on_highlights = function(highlights, colors)
    --   highlights.String = {
    --     fg = colors.fg,
    --   }
    -- end,
  },
  config = function(_, opts)
    local eldritch = require("eldritch")
    eldritch.setup(opts)
    vim.cmd([[colorscheme eldritch]])
  end,
}
