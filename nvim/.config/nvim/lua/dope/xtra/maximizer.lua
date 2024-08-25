local M = {
  "declancm/maximize.nvim",
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("maximize").setup()
end

return M
