local M = {
  "shellRaining/hlchunk.nvim",
  event = "BufReadPost",
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
    enable = true,
    style = "#FFBE98",
    priority = 100,
    exclude_filetypes = exclude_filetypes,
  },
  indent = {
    enable = true,
    -- style = "#30304A",
    style = "#423c46",
    exclude_filetypes = exclude_filetypes,
  },
  line_num = {
    enable = true,
    style = "#FFBE98",
    priority = 10,
    exclude_filetypes = exclude_filetypes,
  },
  blank = {
    enable = true,
    exclude_filetypes = exclude_filetypes,
  },
}

return M
