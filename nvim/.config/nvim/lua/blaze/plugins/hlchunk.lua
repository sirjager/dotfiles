local M = {
  "shellRaining/hlchunk.nvim",
  event = "BufReadPost",
}

M.opts = {
  chunk = {
    enable = false,
    style = "#FFBE98",
    exclude_filetypes = {
      aerial = true,
      dashboard = true,
    },
  },
  indent = {
    enable = true,
    -- style = "#30304A",
    style = "#423c46",
    exclude_filetypes = {
      aerial = true,
      dashboard = true,
    },
  },
  line_num = {
    enable = true,
    style = "#FFBE98",
    exclude_filetypes = {
      aerial = true,
      dashboard = true,
    },
  },
}

return M
