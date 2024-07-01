return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/dev/vault/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/dev/vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/dev/vault/",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    mappings = {
      ["gd"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    picker = {
      name = "telescope.nvim",
      mappings = {
        new = "<C-n>",
        insert_link = "<C-l>",
      },
    },
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(suffix)
    end,
    image_name_func = function()
      return string.format("%s")
    end,
  },
  config = function(opts)
    require("obsidian").setup(opts)
    -- Keymaps
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New..." })
    vim.keymap.set("n", "<leader><leader>", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Find..." })
    vim.keymap.set("n", "<leader>/", function()
      local input = vim.fn.input("Search/Create: ")
      vim.cmd("ObsidianSearch " .. input)
    end, { desc = "Search/Create" })
    vim.keymap.set("n", "<leader>ov", "<cmd>ObsidianFollowLink vsplit<cr>", { desc = "Open link in vsplit" })
    vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "Tags" })
    vim.keymap.set("v", "<leader>ol", "<cmd>ObsidianLinkNew<cr>", { desc = "Visual: Link new" })
    vim.keymap.set("n", "<leader>oL", "<cmd>ObsidianLinks<cr>", { desc = "Links..." })
    vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks..." })
    vim.keymap.set("n", "<leader>op", function()
      local input = vim.fn.input("Image Name: ")
      vim.cmd("ObsidianPasteImg " .. input)
    end, { desc = "Paste Image..." })
    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Open in Obsidian App..." })
    vim.keymap.set("v", "<leader>on", "<cmd>ObsidianExtractNote<cr>", { desc = "Visual: Extract to new note" })
    vim.keymap.set("n", "<leader>or", function()
      local input = vim.fn.input("Rename to: ")
      vim.cmd("ObsidianRename " .. input)
    end, { desc = "Rename note id: " })
  end,
}
