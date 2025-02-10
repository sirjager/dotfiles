local M = {
  "karb94/neoscroll.nvim",
  event = "BufReadPost",
}

M.config = function()
  require("neoscroll").setup()
end

return M
