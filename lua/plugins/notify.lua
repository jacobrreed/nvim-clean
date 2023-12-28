return {
  "rcarriga/nvim-notify",
  cond = not vim.g.vscode,
  opts = {
    render = "wrapped-compact",
    timeout = 3000,
    background_colour = "#FFFFFF",
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
}
