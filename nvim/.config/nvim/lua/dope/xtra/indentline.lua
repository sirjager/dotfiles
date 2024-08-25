local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("ibl").setup()
end

return M
