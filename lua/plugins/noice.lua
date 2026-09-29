return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        -- turn off the (very annoying) LSP progress messages
        -- they appear on each keystroke with pyright
        progress = { enabled = false },
        -- message = { enabled = false }, -- optional, probably don't
      },
    },
  },
}
