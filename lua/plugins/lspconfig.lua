return {
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", cond = not vim.g.vscode },
      { "antosha417/nvim-lsp-file-operations", config = true, cond = not vim.g.vscode },
    },
    setup = {
      rust_analyzer = function()
        return true
      end,
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      require("neodev").setup({
        override = function(_, library)
          library.enabled = true
          library.plugins = true
        end,
      })

      local on_attach = function(_, _) end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- -- Typescript/Javascript
      -- lspconfig["tsserver"].setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- JSON
      lspconfig["jsonls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["gopls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure python server
      lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      --   -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })

      -- Inlay Hints if LSP offers it
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })

      lspconfig["taplo"].setup({
        keys = {
          {
            "K",
            function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end,
            desc = "Show Crate Documentation",
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local wk = require("which-key")
          wk.add({ "<leader>L", group = "LSP", icon = " " })

          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          vim.keymap.set("n", "<leader>Lr", ":LspRestart<CR>", { desc = "Restart LSP" })
          vim.keymap.set(
            "n",
            "gR",
            "<cmd>lua vim.lsp.buf.references()<CR>",
            { desc = "Show references", buffer = ev.buf }
          )
          vim.keymap.set(
            "n",
            "<leader>Ld",
            "<cmd>Telescope lsp_definitions<CR>",
            { desc = "Show LSP definitions", buffer = ev.buf }
          )
          vim.keymap.set("n", "<leader>Ll", "<cmd>LspLog<CR>", { desc = "LSP logs" })
          vim.keymap.set(
            "n",
            "<leader>LI",
            "<cmd>Telescope lsp_implementations<CR>",
            { desc = "Show LSP implementations", buffer = ev.buf }
          )
          vim.keymap.set(
            "n",
            "<leader>Lt",
            "<cmd>Telescope lsp_type_definitions<CR>",
            { desc = "Show LSP type definitions", buffer = ev.buf }
          )
          vim.keymap.set("n", "<leader>cA", function()
            vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
          end, { desc = "Code action (source)", buffer = ev.buf })
          vim.keymap.set("n", "<leader>ca", function()
            vim.lsp.buf.code_action()
          end, { desc = "Code action", buffer = ev.buf })
          vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename", buffer = ev.buf })
          vim.keymap.set(
            "n",
            "<leader>D",
            "<cmd>Telescope diagnostics bufnr=0<cr>",
            { desc = "Show buffer diagnostics", buffer = ev.buf }
          )
          vim.keymap.set(
            "n",
            "<leader>d",
            vim.diagnostic.open_float,
            { desc = "Show line diagnostics", buffer = ev.buf }
          )
          -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Peek implementation", buffer = ev.buf })
          -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
          vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = ev.buf })
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", buffer = ev.buf })
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = ev.buf })
          vim.keymap.set("n", "<leader>Li", "<cmd>LspInfo<cr>", { desc = "LSP Info", buffer = ev.buf })
          -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation", buffer = ev.buf })
        end,
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enabled = false,
          sign = false,
          virtual_text = false,
          enable_in_insert = false,
        },
        symbols_in_winbar = {
          hide_keyword = true,
          folder_level = 0,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    keys = {
      { "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "gD", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      -- Currently busted, using default nvim-lsp instead
      -- { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      -- { "<leader>cA", "<cmd>Lspsaga code_action({context = {only='source'}})<cr>", desc = "Code action" },
      -- { "<leader>Lli", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming calls" },
      -- { "<leader>Llo", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing calls" },
      -- { "<leader>Lld", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Diagnostic jump next" },
      -- { "<leader>Llf", "<cmd>Lspsaga finder<cr>", desc = "Finder" },
      { "gt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
      { "gT", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Go to type definition" },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        expose_as_code_action = { "all" },
      },
    },
  },
}
