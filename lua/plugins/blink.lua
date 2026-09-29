return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    local function completion_enabled()
      if vim.b.completion ~= nil then
        return vim.b.completion
      end

      return vim.bo.filetype ~= "markdown"
    end

    local completion_toggle = Snacks.toggle({
      name = "Completion",
      get = completion_enabled,
      set = function(state)
        vim.b.completion = state
      end,
    })

    local function toggle_completion()
      require("blink.cmp").hide()
      completion_toggle:toggle()
    end

    vim.keymap.set({ "i", "n" }, "<C-q>", toggle_completion, {
      desc = "Toggle Completion",
    })

    opts.enabled = function()
      if not completion_enabled() then
        return false
      end

      local cursor = vim.api.nvim_win_get_cursor(0)
      -- Check the previous byte so typing at the end of a comment stays disabled.
      -- Reuse Tree-sitter's existing tree without forcing a parse.
      local ok, node = pcall(vim.treesitter.get_node, {
        pos = { cursor[1] - 1, math.max(cursor[2] - 1, 0) },
        ignore_injections = true,
      })
      if ok then
        while node do
          if node:type():find("comment", 1, true) then
            return false
          end
          node = node:parent()
        end
      end

      return true
    end

    return opts
  end,
}
