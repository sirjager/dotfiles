local M = {
  "mikavilpas/yazi.nvim",
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("yazi").setup {}
end

return M
