return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "nvim-neotest/neotest-jest",
      },
    },
    vscode = false,
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "yarn test --",
          env = { CI = true },
        },
      },
    },
    keys = {
      -- { "<leader>T", "", desc = "+test" },
      -- {
      --   "<leader>Tt",
      --   function()
      --     require("neotest").run.run(vim.fn.expand("%"))
      --   end,
      --   desc = "Run File",
      -- },
      -- {
      --   "<leader>TT",
      --   function()
      --     require("neotest").run.run(vim.uv.cwd())
      --   end,
      --   desc = "Run All Test Files",
      -- },
      -- {
      --   "<leader>Tr",
      --   function()
      --     require("neotest").run.run()
      --   end,
      --   desc = "Run Nearest",
      -- },
      -- {
      --   "<leader>Tl",
      --   function()
      --     require("neotest").run.run_last()
      --   end,
      --   desc = "Run Last",
      -- },
      -- {
      --   "<leader>Ts",
      --   function()
      --     require("neotest").summary.toggle()
      --   end,
      --   desc = "Toggle Summary",
      -- },
      -- {
      --   "<leader>To",
      --   function()
      --     require("neotest").output.open({ enter = true, auto_close = true })
      --   end,
      --   desc = "Show Output",
      -- },
      -- {
      --   "<leader>TO",
      --   function()
      --     require("neotest").output_panel.toggle()
      --   end,
      --   desc = "Toggle Output Panel",
      -- },
      -- {
      --   "<leader>TS",
      --   function()
      --     require("neotest").run.stop()
      --   end,
      --   desc = "Stop",
      -- },
      -- {
      --   "<leader>Tw",
      --   function()
      --     require("neotest").watch.toggle(vim.fn.expand("%"))
      --   end,
      --   desc = "Toggle Watch",
      -- },
      -- -- Disable lazyvim default maps
      -- { "<leader>t", "", false },
      -- {
      --   "<leader>tt",
      --   false,
      -- },
      -- {
      --   "<leader>tT",
      --   false,
      -- },
      -- {
      --   "<leader>tr",
      --   false,
      -- },
      -- {
      --   "<leader>tl",
      --   false,
      -- },
      -- {
      --   "<leader>ts",
      --   false,
      -- },
      -- {
      --   "<leader>to",
      --   false,
      -- },
      -- {
      --   "<leader>tO",
      --   false,
      -- },
      -- {
      --   "<leader>tS",
      --   false,
      -- },
      -- {
      --   "<leader>tw",
      --   false,
      -- },
    },
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   keys = {
  --     {
  --     --   "<leader>Td",
  --     --   function()
  --     --     require("neotest").run.run({ strategy = "dap" })
  --     --   end,
  --     --   desc = "Debug Nearest",
  --     -- },
  --     -- { "<leader>td", false },
  --   },
  -- },
}
