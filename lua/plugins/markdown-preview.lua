return {
  "iamcco/markdown-preview.nvim",
  cond = not vim.g.vscode,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  config = function()
    if vim.bo.filetype == "markdown" then
      require("which-key").register({
        ["<leader>"] = {
          m = { name = "Markdown", p = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown preview" } },
        },
      })
    else
      return {}
    end
  end,
}
