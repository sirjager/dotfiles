local M = {
  "shellRaining/hlchunk.nvim",
  event = "VeryLazy",
}

local exclude_filetypes = {
  aerial = true,
  dashboard = true,
  help = true,
  checkhealth = true,
  man = true,
  mason = true,
  lspinfo = true,
}

M.opts = {
  chunk = {
    enable = false,
    style = "#FFBE98",
    exclude_filetypes = exclude_filetypes,
  },
  indent = {
    enable = false,
    style = "#423c46",
    exclude_filetypes = exclude_filetypes,
  },
  line_num = {
    enable = true,
    style = "#FFBE98",
    exclude_filetypes = exclude_filetypes,
  },
  blank = {
    enable = true,
    exclude_filetypes = exclude_filetypes,
  },
}

return M
