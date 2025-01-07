return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        -- selection = "manual",
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<Up>"] = { "scroll_documentation_up", "fallback" },
      ["<Down>"] = { "scroll_documentation_down", "fallback" },
      ["<S-Tab>"] = { "snippet_forward", "fallback" },
      ["<C-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    },
  },
}
