return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx)
              if result and result.diagnostics then
                result.diagnostics = vim.tbl_filter(function(diagnostic)
                  return tostring(diagnostic.code) ~= "2"
                end, result.diagnostics)
              end

              vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
            end,
          },
        },
      },
    },
  },
}
