-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("v", "<leader>z", ":HermesSendSelection<CR>", {
--   desc = "Send selection to Hermes",
--   silent = true,
-- })

vim.keymap.set("n", "<leader>hc", "<cmd>HermesCompose<CR>", {
  desc = "Hermes compose",
  silent = true,
})

vim.keymap.set("x", "<leader>hs", ":HermesSendSelection<CR>", {
  desc = "Hermes send selection",
  silent = true,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "hermes://compose",
  callback = function(event)
    vim.keymap.set("n", "<leader>hs", "<cmd>HermesSubmit<CR>", {
      buffer = event.buf,
      desc = "Hermes submit",
      silent = true,
    })
  end,
})
