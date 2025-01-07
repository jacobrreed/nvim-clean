return {
  "mrjones2014/smart-splits.nvim",
  enabled = function()
    if os.getenv("TERM_PROGRAM") == "WezTerm" then
      return true
    end
  end,
  config = function()
    -- moving between splits
    vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
    vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
    vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
    vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
  end,
}
