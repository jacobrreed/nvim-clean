return {
  "echasnovski/mini.hipatterns",
  event = require("util.event").LazyFile,
  opts = function()
    local hi = require("mini.hipatterns")
    return {
      highlighters = {
        hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
      },
    }
  end,
  config = function(_, opts)
    require("mini.hipatterns").setup(opts)
  end,
}
