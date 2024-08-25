local M = {
  "williamboman/mason.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.servers = {
  "luacheck",
  "shellcheck",
  "shfmt",
  "eslint-lsp",
  "typescript-language-server",
  "tailwindcss-language-server",
  "css-lsp",
}

function M.config()
  require("mason").setup {
    opts = {
      automatic_installation = true,
      ensure_installed = M.servers,
    },
    ui = {
      border = "rounded",
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌 ",
      },
    },
  }
end

return M

-- NOTE: astro-ls stopped working, neovim gets crashed
-- This is temporary fix, clone the following repo somewhere and install parser
-- https://github.com/virchau13/tree-sitter-astro
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.astro.install_info.url = "~/.local/share/nvim/mason/packages/tree-sitter-astro"
