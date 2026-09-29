return {
  "sophieforrest/processing.nvim",
  lazy = false,
  version = "^1",
  init = function()
    vim.g.processing_nvim = {
      highlight = {
        enable = true,
      },
      lsp = {
        cmd = {
          vim.fn.expand("~/processing4/app/build/compose/binaries/main/app/Processing/bin/Processing"),
          "lsp",
        },
      },
    }

    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = vim.api.nvim_create_augroup("ProcessingLspCleanup", { clear = true }),
      desc = "Stop Processing language servers when Neovim exits",
      callback = function()
        for _, client in ipairs(vim.lsp.get_clients({ name = "processing-lsp" })) do
          client:stop(true)
        end
      end,
    })
  end,
}
