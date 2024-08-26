local M = {
  "declancm/maximize.nvim",
  lazy = true,
  event = "BufReadPost",
}

function M.config()
  require("maximize").setup()
end

return M
