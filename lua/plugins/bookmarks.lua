return {
  "tomasky/bookmarks.nvim",
  cond = not vim.g.vscode,
  event = "VimEnter",
  config = function()
    local bookmarks = require("bookmarks")
    bookmarks.setup({
      keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function(_) end,
    })
    local map = vim.keymap.set
    map("n", "mt", bookmarks.bookmark_toggle, { desc = "Bookmark Toggle" }) -- add or remove bookmark at current line
    map("n", "ma", bookmarks.bookmark_ann, { desc = "Bookmark Annotate" }) -- add or edit mark annotation at current line
    map("n", "mc", bookmarks.bookmark_clean, { desc = "Remove all bookmarks" }) -- clean all marks in local buffer
    map("n", "mn", bookmarks.bookmark_next, { desc = "Go to next bookmark" }) -- jump to next mark in local buffer
    map("n", "mN", bookmarks.bookmark_prev, { desc = "Go to previous bookmark" }) -- jump to previous mark in local buffer
    map("n", "ml", "<cmd>Telescope bookmarks list<cr>", { desc = "Bookmark List" }) -- show marked file list in quickfix window
  end,
}
