local M = {
  "folke/trouble.nvim",
  cmd = "Trouble",
}

M.opts = {}

function M.config()
  require("trouble").setup(M.opts)
end

return M
