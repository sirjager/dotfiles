local M = {
  "Exafunction/codeium.nvim",
  event = "BufReadPost",
}

function M.config()
  require("codeium").setup {}
end

return M
