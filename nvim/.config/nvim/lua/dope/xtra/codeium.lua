local M = {
  "Exafunction/codeium.nvim",
  lazy = true,
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("codeium").setup {}
end

return M
