return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx)
              if result and result.diagnostics then
                result.diagnostics = vim.tbl_filter(function(diagnostic)
                  return not diagnostic.message:find(
                    "Using Phoenix.LiveView.TagEngine as an EEx.Engine is deprecated!",
                    1,
                    true
                  )
                end, result.diagnostics)
              end

              return vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
            end,
          },
        },
      },
    },
  },
}
