return {
  dir = "~/projects/lua/hermes.nvim", -- serving from local while in development
  config = function()
    require("hermes").setup({
      transcript_directories = {
        "~/obsidian_vault/",
        "~/obsidian_hermes/",
      },
    })
  end,
}
