local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

M.opts = {
  git = { enabled = true },
  bigfile = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}

M.opts.dashboard = {
  enabled = true,
  width = 30,
  preset = {
    header = require("dope.core.banners").sharp,
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

return M
