local M = {
  "williamboman/mason.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.servers = {
  "luacheck",
  "stylua",
  "prismals",
  "shellcheck",
  "shfmt",
  "html-lsp",
  "prettierd",
  "css-lsp",
  "typescript-language-server",
  "tailwindcss-language-server",
  "markdownlint",
  "marksman",
  "hadolint",
  -- python
  "pyright",
  "ruff-lsp",
  "mypy",
  "black",
  -- astro
  -- "astro-language-server@2.10.0" -- working fine
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
