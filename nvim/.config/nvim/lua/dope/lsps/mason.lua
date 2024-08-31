local M = {
  "williamboman/mason.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.servers = {
  "luacheck",
  "stylua",
  "shellcheck",
  "shfmt",
  -- frontend
  "html-lsp",
  "css-lsp",
  "eslint-lsp",
  "prettierd",
  "typescript-language-server",
  "tailwindcss-language-server",
  -- markdown
  "markdownlint",
  "marksman",
  -- docker
  "hadolint",
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
