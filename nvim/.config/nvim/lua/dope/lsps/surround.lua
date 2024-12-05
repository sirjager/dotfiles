local M = {
  "kylechui/nvim-surround",
}

-- https://github.com/kylechui/nvim-surround/blob/main/doc/nvim-surround.txt
function M.config()
  require("nvim-surround").setup {}
end

return M
