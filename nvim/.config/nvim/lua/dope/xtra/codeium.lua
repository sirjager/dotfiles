local M = {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("codeium").setup {}
end

return M
