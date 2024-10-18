local M = {
  "Exafunction/codeium.nvim",
  lazy = true,
  event = "BufReadPost",
}

function M.config()
  require("codeium").setup {}
end

return M
