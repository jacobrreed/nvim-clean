return {
  "stevearc/conform.nvim",
  cond = not vim.g.vscode,
  lazy = true,
  event = { "BufWritePre" },
  config = function()
    local conform = require("conform")

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        -- FormatToggle! will disable formatting just for this buffer
        if vim.b.disable_autoformat then
          vim.b.disable_autoformat = false
          require("notify")("Formatting enabled for buffer")
        else
          vim.b.disable_autoformat = true
          require("notify")("Formatting disabled for buffer")
        end
      else
        if vim.g.disable_autoformat then
          vim.g.disable_autoformat = false
          vim.b.disable_autoformat = false
          require("notify")("Formatting enabled")
        else
          vim.g.disable_autoformat = true
          vim.b.disable_autoformat = true
          require("notify")("Formatting disabled")
        end
      end
    end, {
      desc = "Toggle autoformat",
      bang = true,
    })

    local function augroup(name)
      return vim.api.nvim_create_augroup("autocmd_" .. name, { clear = true })
    end
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup("conform_disable"),
      pattern = { "markdown" },
      callback = function()
        vim.b.disable_autoformat = true
      end,
    })

    local slow_format_filetypes = {}
    conform.setup({
      quiet = true,
      formatters_by_ft = {
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        javascriptreact = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = false } },
      },
      format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        local function on_format(err)
          if err and err:match("timeout$") then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end
        return {
          lsp_fallback = true,
          timeout = 1000,
        }
      end,
      format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { lsp_fallback = true }
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>cfv", function()
      conform.format({
        lsp_fallback = true,
        async = true,
      })
    end, { desc = "Format file or range (in visual mode)" })

    vim.keymap.set({ "n" }, "<leader>cft", "<cmd>FormatToggle<cr>", { desc = "Toggle autoformat" })
    vim.keymap.set({ "n" }, "<leader>cfT", "<cmd>FormatToggle!<cr>", { desc = "Toggle autoformat for buffer" })
  end,
}
