--- disable markdownlint MD013 (line length) warning by pulling in
--- ~/.config/markdownlint/.markdownlint-cli2.yaml
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            vim.fn.expand("~/.config/markdownlint/.markdownlint-cli2.yaml"),
            "--",
            "-",
          },
        },
      },
    },
  },
}
