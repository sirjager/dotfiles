local M = {
  "shellRaining/hlchunk.nvim",
}

function M.config()
  require("hlchunk").setup {
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
      style = "#30304A",
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
end

return M
