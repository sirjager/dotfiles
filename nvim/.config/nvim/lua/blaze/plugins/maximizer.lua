local M = {
  "declancm/maximize.nvim",
  cmd = { "Maximize" },
}

function M.config()
  require("maximize").setup()
end

return M
