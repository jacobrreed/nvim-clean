return {
  "neovim/nvim-lspconfig",
  vscode = false,
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-k>", false, mode = { "i" } }
    -- keys[#keys + 1] = {
    --   "<c-???>",
    --   function()
    --     return vim.lsp.buf.signature_help()
    --   end,
    --   mode = "i",
    --   desc = "Signature Help",
    --   has = "signatureHelp",
    -- }
    keys[#keys + 1] = {
      "<leader>cr",
      function()
        local inc_rename = require("inc_rename")
        -- Overrides default and erases name for inc rename instead of keeping same name
        -- so we dont have to backspace
        return ":" .. inc_rename.config.cmd_name .. " "
      end,
      expr = true,
      desc = "Rename (inc-rename.nvim)",
      has = "rename",
    }

    opts.servers.eslint.settings.workingDirectory = { mode = "auto" }
    opts.inlay_hints = { enabled = false }
    opts.setup.eslint = function()
      require("lazyvim.util").lsp.on_attach(function(client)
        if client.name == "eslint" then
          client.server_capabilities.documentFormattingProvider = true
        elseif client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end)
      vim.cmd([[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]])
    end
    return opts
  end,
}
