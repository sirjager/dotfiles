local M = {
  "echasnovski/mini.icons",
  version = "*",
  event = "VeryLazy",
}

M.opts = {
  style = "glyph",
  default = {},
  directory = {},
  extension = {},
  file = {},
  filetype = {},
  lsp = {},
  os = {},
  use_file_extension = function(ext, file)
    return true
  end,
}

M.config = function()
  require("mini.icons").setup(M.opts)
end

return M
