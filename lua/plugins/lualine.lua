return {
  "nvim-lualine/lualine.nvim",
  vscode = false,
  opts = function()
    local opts = {
      options = {
        theme = "eldritch",
        component_separators = "",
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
        refresh = { statusline = 1000, tabline = 1000 },
        disabled_filetypes = { statusline = { "dashboard" }, tabline = { "dashboard" } },
      },
      extensions = { "neo-tree", "lazy" },
      sections = {
        lualine_a = { { "mode", separator = { left = "", right = "" } } },
        lualine_b = { "branch" },
        lualine_c = {
          "filename",
          { "diff", symbols = { added = " ", modified = "󰣕 ", removed = " " } },
          "diagnostics",
        },
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            "copilot",
            show_loading = true,
            show_colors = true,
            padding = { right = 1, left = 1 },
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  sleep = " 󰒲",
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  sleep = "#04d1f9",
                },
              },
            },
          },
        },
        lualine_y = {
          "filetype",
        },
        lualine_z = {
          {
            function()
              local lazyStatus = require("lazy.status")
              local has_updates = lazyStatus.has_updates
              local packages = require("lazy.status").updates
              if has_updates() then
                return "󱧕 " .. packages
              else
                return "󰏗 󰄵"
              end
            end,
          },
        },
      },
    }

    return opts
  end,
  dependencies = { "nvim-tree/nvim-web-devicons", "eldritch-theme/eldritch.nvim" },
}
