local M = {}

M.ui = require("util.ui")
M.event = require("util.event")
local xdg_config = vim.env.XDG_CONFIG_HOME or vim.env.HOME .. "/.config"
function M.have(path)
  return vim.loop.fs_stat(xdg_config .. "/" .. path) ~= nil
end
return M
