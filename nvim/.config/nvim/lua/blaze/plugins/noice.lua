local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
}

function M.config()
  require("noice").setup {}
end

return M
