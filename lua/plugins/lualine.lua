return {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local icons = require("util").ui.icons
    local fg = require("util").ui.fg

    local conformStatus = function()
      local status, _ = pcall(require, "conform")
      if status then
        return "󰬍 "
      else
        return ""
      end
    end

    local conformColor = function()
      if vim.g.disable_autoformat then
        return fg("Error")
      else
        if vim.b.disable_autoformat then
          return fg("Error")
        else
          return fg("Special")
        end
      end
    end

    local opts = {
      options = {
        theme = "eldritch",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard" } },
      },
      extensions = { "neo-tree", "lazy" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1 },
        },
        lualine_x = {
          { conformStatus, color = conformColor },
          {
            "copilot",
            show_loading = true,
            show_colors = true,
            padding = { right = 1, left = 1 },
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  sleep = " ", -- auto-trigger disabled
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  sleep = "#50FA7B",
                },
              },
            },
          },
          -- {
          --   function()
          --     return require("noice").api.status.command.get()
          --   end,
          --   cond = function()
          --     return package.loaded["noice"] and require("noice").api.status.command.has()
          --   end,
          --   color = fg("Statement"),
          -- },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = fg("Constant"),
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = fg("Debug"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
          },
        },
      },
    }

    return opts
  end,
  dependencies = { "nvim-tree/nvim-web-devicons", "eldritch-theme/eldritch.nvim" },
}
