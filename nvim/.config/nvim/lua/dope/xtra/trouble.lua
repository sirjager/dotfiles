local M = {
  "folke/trouble.nvim",
  cmd = "Trouble",
  lazy = true,
  event = "VeryLazy",
}

M.opts = {}

function M.config()
  require("trouble").setup(M.opts)
end

return M
