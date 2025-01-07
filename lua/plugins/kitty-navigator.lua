return {
  "knubie/vim-kitty-navigator",
  vscode = false,
  cond = function()
    if os.getenv("TERM") == "xterm-kitty" then
      return true
    end
    return false
  end,
  build = {
    "cp ./*.py ~/.config/kitty/",
  },
}
