return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("hugo_template_highlighting", { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.name == "gopls" and vim.bo[event.buf].filetype == "gotmpl" then
            -- gopls marks entire template actions as macros, hiding Tree-sitter colors.
            vim.lsp.semantic_tokens.enable(false, { bufnr = event.buf })
          end
        end,
      })
      vim.filetype.add({
        pattern = {
          -- Hugo keeps template HTML in layouts, including theme layouts.
          [".*/layouts/.*%.html"] = function(path)
            if
              vim.fs.root(path, {
                "hugo.toml",
                "hugo.yaml",
                "hugo.yml",
                "hugo.json",
                "config/_default/hugo.toml",
                "config/_default/hugo.yaml",
                "config/_default/hugo.yml",
                "config/_default/hugo.json",
              })
            then
              return "gotmpl",
                function(buf)
                  -- Protect the first file opened, before VeryLazy autocmds load.
                  vim.b[buf].autoformat = false
                end
            end
          end,
        },
      })
    end,
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = { templateExtensions = { "html", "gohtml", "gotmpl", "tmpl" } },
          },
        },
        html = {
          filetypes = { "html", "gotmpl" },
          init_options = { provideFormatter = false },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "gotmpl", "html" } },
  },
}
