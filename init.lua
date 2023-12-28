require("config.keymap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  concurrency = jit.os:find("Windows") and (vim.loop.available_parallelism() * 2) or nil,
  install = {
    colorscheme = { "eldritch" },
    missing = true,
  },
  checker = {
    enabled = true,
    concurrency = 1,
    frequency = 3600,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
    backdrop = 100,
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})

require("config")
