local M = {
  "windwp/nvim-ts-autotag",
  event = "BufReadPost",
  per_filetype = {
    html = {
      enable_close = true,
    },
    astro = {
      enable_close = true,
    },
    javascriptreact = {
      enable_close = true,
    },
    typescriptreact = {
      enable_close = true,
    },
  },
}

return M
