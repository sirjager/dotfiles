---@diagnostic disable: no-unknown
local M = {
  "OXY2DEV/markview.nvim",
  ft = { "markdown", "mdx", "mdoc" },
}

-- :TSInstall markdown markdown_inline html latex typst yaml
M.config = function()
  local presets = require("markview.presets")
  require("markview").setup({
    headings = presets.headings.glow_labels,
    checkboxes = { enable = false }, -- using obsidian plugin
    links = { enable = false }, -- better managed by obsidian plugin
    preview = {
      icon_provider = "mini", -- "mini" or "devicons"
    },
    markdown = {
      list_items = { enable = false }, -- managed by obsidian plugin
    },
  })
end

return M
