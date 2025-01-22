local M = {
  "nvim-tree/nvim-web-devicons",
  -- dependencies = {
  --   { "echasnovski/mini.icons", version = false },
  -- },
}

function M.config()
  require("nvim-web-devicons").setup {
    strict = true,
    override_by_extension = {
      astro = {
        icon = "",
        color = "#EF8547",
        name = "astro",
      },
    },
  }
end

return M
