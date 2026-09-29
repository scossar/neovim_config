return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      doc = {
        enabled = true,
        inline = true,
        float = false, -- Snacks uses floating previews as a fallback (causes an issue in the foot terminal)
      },
    },
  },
}
