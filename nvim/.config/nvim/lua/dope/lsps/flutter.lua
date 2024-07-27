local M = {
  "akinsho/flutter-tools.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "akinsho/pubspec-assist.nvim",
  },
}

M.opts = {}

function M.config()
  require("flutter-tools").setup(M.opts)
  require("pubspec-assist").setup()
end

return M
