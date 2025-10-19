local M = {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
}

M.config = function()
  local mc = require "multicursor-nvim"
  mc.setup()
end

return M
