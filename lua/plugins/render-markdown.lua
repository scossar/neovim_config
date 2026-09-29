return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require("render-markdown").setup({
      latex = {
        enabled = false, -- snacks.image is handling latex rendering
        -- render_modes = true,
        -- converter = "latex2text",
        -- highlight = "RenderMarkdownMath",
        -- position = "above",
        -- top_pad = 0,
        -- bottom_pad = 0,
      },
    })
  end,
}
