-- Use the development checkout until it is moved out of this config.
local checkout = vim.fn.stdpath("config") .. "/lua/flexoki-paper"
if vim.fn.isdirectory(checkout .. "/.git") == 1 then
  return {
    {
      "scossar/flexoki-paper",
      dir = checkout,
    },
  }
end

return {}
