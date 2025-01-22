local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

M.opts = {
  git = { enabled = true },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  dashboard = { enabled = true },
  notifier = { enabled = true, timeout = 2000 },
  styles = { notification = { wo = { wrap = true } } },
}

M.opts.dashboard = {
  enabled = true,
  width = 30,
  preset = {
    header = nil,
    keys = {
      { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
  },
}

local banned_messages = {
  "No information available",
  "LSP[gopls] Invalid settings: setting option hints: invalid type []interface {} (want JSON object)", -- comes when disabling lsp_inlay_hints. go.lsp_inlay_hints.enable = false
  "completion request failed",
}

---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if msg == banned then
      return
    end
  end
  return require "notify"(msg, ...)
end

M.init = function()
  Snacks = require "snacks"
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      -- Setup some globals for debugging (lazy-loaded)
      _G.dd = function(...)
        Snacks.debug.inspect(...)
      end
      _G.bt = function()
        Snacks.debug.backtrace()
      end
      vim.print = _G.dd -- Override print to use snacks for `:=` command
      -- Create some toggle mappings
      Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
      Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
      Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
      Snacks.toggle.diagnostics():map "<leader>ud"
      Snacks.toggle.line_number():map "<leader>ul"
      Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map "<leader>uc"
      Snacks.toggle.treesitter():map "<leader>uT"
      Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map "<leader>ub"
      Snacks.toggle.inlay_hints():map "<leader>uh"
    end,
  })
end

return M
