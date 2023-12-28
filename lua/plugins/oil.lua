return {
  "stevearc/oil.nvim",
  cond = not vim.g.vscode,
  opts = {
    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    default_file_explorer = true,
    delete_to_trash = false,
    prompt_save_on_select_new_entry = false,
    skip_confirm_for_simple_edits = true,
    cleanup_delay_ms = 500,
    enabled = false,
    lsp_file_methods = {
      timeout_ms = 1000,
      autosave_changes = true,
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        local ignored = { ".git", ".hg", ".svn", ".DS_Store", "node_modules" }
        if vim.tbl_contains(ignored, name) then
          return true
        else
          return false
        end
      end,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["q"] = "actions.close",
      ["<backspace>"] = "actions.parent",
      ["gv"] = "actions.select_vsplit",
      ["gh"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["gr"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["<C-o>"] = "actions.open_external",
      ["H"] = "actions.toggle_hidden",
      ["T"] = "actions.toggle_trash",
    },
    float = {
      win_options = {
        winblend = 0,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("oil").toggle_float()
      end,
      desc = "Toggle oil (file explorer)",
    },
    {
      "<leader>E",
      function()
        require("oil").toggle_float(vim.cmd("pwd"))
      end,
      desc = "Toggle oil (file explorer)",
    },
    {
      "<C-s>",
      function()
        require("oil").save()
      end,
      desc = "Save oil changes",
      ft = "oil",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
