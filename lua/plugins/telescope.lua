return {
  "nvim-telescope/telescope.nvim",
  cond = not vim.g.vscode,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })

    local select_one_or_multi = function(prompt_bufnr)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require("telescope.actions").close(prompt_bufnr)
        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format("%s %s", "edit", j.path))
          end
        end
      else
        require("telescope.actions").select_default(prompt_bufnr)
      end
    end

    local smart_send_and_open_qflist = function(prompt_bufnr)
      require("telescope.actions").smart_send_to_qflist(prompt_bufnr)
      require("telescope.actions").open_qflist(prompt_bufnr)
      vim.g.qf_is_open = true
    end

    telescope.setup({
      defaults = {
        history = {
          path = vim.fn.stdpath("data") .. "/telescope_history.sqlite",
          limit = 100,
        },
        layout_config = { horizontal = { height = 0.90, width = 0.90, preview_width = 0.4 } },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        path_display = function(_, path)
          local tail = vim.fs.basename(path)
          local parent = vim.fs.dirname(path)
          if parent == "." then
            return tail
          end
          return string.format("%s\t\t%s", tail, parent)
        end,
        winblend = 0,
        color_devicons = true,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = smart_send_and_open_qflist,
            ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<RightMouse>"] = actions.close,
            ["<LeftMouse>"] = actions.select_default,
            ["<ScrollWheelDown>"] = actions.move_selection_next,
            ["<ScrollWheelUp>"] = actions.move_selection_previous,
            ["<CR>"] = select_one_or_multi,
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            case_mode = "smart_case",
          },
          undo = {
            mappings = {
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
          },
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    require("telescope").load_extension("noice")
    telescope.load_extension("undo")
    telescope.load_extension("aerial")
  end,
  keys = function()
    local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
    return {
      {
        "<leader>tf",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
      {
        "<leader><leader>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
      {
        "<leader>tF",
        "<cmd>Telescope find_files find_command=rg,--files,--hidden,--no-ignore-vcs,-g,!**/.git/*,-g,!**/node_modules/*<cr>",
        desc = "Find files (ALL)",
      },
      {
        "<leader>tH",
        ":lua require('telescope.builtin').highlights()<cr>",
        desc = "Highlights",
      },
      {
        "<leader>th",
        ":lua require('telescope.builtin').help_tags()<cr>",
        desc = "Help",
      },
      { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>t/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep" },
      { "<leader>/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep" },
      {
        "<leader>/",
        live_grep_args_shortcuts.grep_visual_selection,
        mode = "v",
        desc = "Live grep (visual)",
      },
      { "<leader>tg", "<cmd>Telescope git_files<cr>", desc = "Git file list" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>t:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>?", "<cmd>Telescope search_history<cr>", desc = "Search history" },
      { "<leader>t?", "<cmd>Telescope search_history<cr>", desc = "Search history" },
      { "<leader>tC", ":lua require('telescope.builtin').colorscheme()<cr>", desc = "Color schemes" },
      { "<leader>tq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
      { "<leader>tR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>to", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>tu", "<cmd>Telescope undo<cr>", desc = "Undo history" },
      { "<leader>tr", "<cmd>Telescope resume<cr>", desc = "Telescope resume" },
      { "<leader>ta", "<cmd>Telescope aerial<cr>", desc = "Telescope Aerial (code outline)" },
    }
  end,
}
