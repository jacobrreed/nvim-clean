return {
  {
    "itchyny/vim-qfedit",
    vscode = false,
  },
  {
    "kevinhwang91/nvim-bqf",
    vscode = false,
    setup = function()
      vim.fn["fzf#install"]()
    end,
    opts = {
      preview = {
        winblend = 0,
      },
    },
    keys = {
      {
        "<leader>q",
        function()
          if vim.g.qf_is_open then
            vim.cmd("cclose")
            vim.g.qf_is_open = false
          else
            vim.cmd("copen")
            vim.g.qf_is_open = true
          end
        end,
        desc = "Quickfix Toggle",
      },
    },
  },
}
