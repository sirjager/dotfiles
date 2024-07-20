local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
}

function M.config()
  require("ibl").setup()
end

return M
