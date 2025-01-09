local M = {
  "vhyrro/luarocks.nvim",
  -- this plugin needs to run before anything else
  priority = 1001,
}

function M.config()
  require("luarocks-nvim").setup({
    rocks = { "magick", "luacheck" },
  })
end

return M
