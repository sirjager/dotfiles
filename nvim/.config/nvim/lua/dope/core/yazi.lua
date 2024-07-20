local M = {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
}

function M.config()
  require("yazi").setup {}
end

return M
