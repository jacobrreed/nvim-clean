return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    build = "rustup component add rust-analyzer",
    ft = { "rust" },
    -- Install rust-analyzer separately not via Mason
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>ca", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    tag = "stable",
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      local wk = require("which-key")
      wk.register({
        ["<leader>cc"] = {
          name = "Crates",
        },
      })

      vim.keymap.set("n", "<leader>cct", crates.toggle, { silent = true, desc = "Toggle" })
      vim.keymap.set("n", "<leader>ccr", crates.reload, { silent = true, desc = "Reload" })

      vim.keymap.set("n", "<leader>ccv", crates.show_versions_popup, { silent = true, desc = "Show versions" })
      vim.keymap.set("n", "<leader>ccf", crates.show_features_popup, { silent = true, desc = "Show features" })
      vim.keymap.set("n", "<leader>ccd", crates.show_dependencies_popup, { silent = true, desc = "Show dependencies" })

      vim.keymap.set("n", "<leader>ccu", crates.update_crate, { silent = true, desc = "Update crate" })
      vim.keymap.set("v", "<leader>ccu", crates.update_crates, { silent = true, desc = "Update crates" })
      vim.keymap.set("n", "<leader>cca", crates.update_all_crates, { silent = true, desc = "Update all crates" })
      vim.keymap.set("n", "<leader>ccU", crates.upgrade_crate, { silent = true, desc = "Upgrade crate" })
      vim.keymap.set("v", "<leader>ccU", crates.upgrade_crates, { silent = true, desc = "Upgrade crates" })
      vim.keymap.set("n", "<leader>ccA", crates.upgrade_all_crates, { silent = true, desc = "Upgrade all crates" })

      vim.keymap.set(
        "n",
        "<leader>ccx",
        crates.expand_plain_crate_to_inline_table,
        { silent = true, desc = "Convert plain crate to table" }
      )
      vim.keymap.set(
        "n",
        "<leader>ccX",
        crates.extract_crate_into_table,
        { silent = true, desc = "Extract crate into table" }
      )

      vim.keymap.set("n", "<leader>ccH", crates.open_homepage, { silent = true, desc = "Open homepage" })
      vim.keymap.set("n", "<leader>ccR", crates.open_repository, { silent = true, desc = "Open repository" })
      vim.keymap.set("n", "<leader>ccD", crates.open_documentation, { silent = true, desc = "Open documentation" })
      vim.keymap.set("n", "<leader>ccC", crates.open_crates_io, { silent = true, desc = "Open crates.io" })
    end,
  },
}
