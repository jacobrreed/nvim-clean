return {
  "pavanbhat1999/figlet.nvim",
  dependencies = {
    "numToStr/Comment.nvim",
  },
  keys = {
    {
      "<leader>A",
      function()
        local word = vim.ui.input({ prompt = "Banner text: " }, function(input)
          vim.cmd("FigComment " .. input)
        end)
      end,
      mode = { "n" },
      desc = "ASCII banner",
    },
  },
}
