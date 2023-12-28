return {
  "nvim-neotest/neotest",
  cond = not vim.g.vscode,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "yarn test --",
          jestConfig = "jest.config.js",
          env = { CI = true },
          cwd = function(_)
            return vim.fn.getcwd()
          end,
        }),
        require("rustaceanvim.neotest"),
      },
    })
  end,
  keys = {
    {
      "<leader>r",
      "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      desc = "Run tests in current file",
    },
  },
}
