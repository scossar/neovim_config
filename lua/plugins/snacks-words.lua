return {
  "folke/snacks.nvim",
  opts = {
    -- snacks.words is what was causing the annoying highlighting of the current word in insert mode
    -- customizing it here to remove insert mode
    words = {
      modes = { "n", "c" },
    },
  },
}
