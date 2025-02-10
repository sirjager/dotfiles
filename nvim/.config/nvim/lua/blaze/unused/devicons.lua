local M = {
  "nvim-tree/nvim-web-devicons",
}

M.opts = {
  strict = true,
  override_by_extension = {
    astro = {
      icon = "",
      color = "#EF8547",
      name = "astro",
    },
  },
}

return M
