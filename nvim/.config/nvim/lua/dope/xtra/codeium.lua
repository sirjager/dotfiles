local M = {
  "Exafunction/codeium.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("codeium").setup {}
end

return M
