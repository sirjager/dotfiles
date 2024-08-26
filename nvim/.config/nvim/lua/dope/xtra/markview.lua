---@diagnostic disable: no-unknown
local M = {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  -- ft = "markdown", -- If you decide to lazy-load anyway
}

function M.config()
  local markview = require "markview"
  local presets = require "markview.presets"
  markview.setup {
    headings = presets.headings.glow_labels,
    checkboxes = { enable = false }, -- using obsidian plugin
    links = { enable = false }, -- better managed by obsidian plugin
    list_items = { enable = false }, -- managed by obsidian plugin
  }
end

return M
