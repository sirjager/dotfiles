local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost" },
}

function M.config()
  require("gitsigns").setup {}
end

return M
