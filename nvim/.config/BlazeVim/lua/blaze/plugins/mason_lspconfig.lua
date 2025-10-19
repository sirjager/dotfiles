local M = {
  "williamboman/mason-lspconfig.nvim",
}

M.opts = {
  automatic_installation = true,
  ensure_installed = {
    "taplo",
    "lua_ls",
    "bashls",
    "taplo",
    "bash-language-server",
    "jsonls", -- json
    "yamlls", -- yml
    "clangd",
    -- "sqlls",
    "marksman", -- md
    ----------------------- html,css, javascript, typescript
    "emmet_ls",
    "cssls",
    "html",
    "astro",
    "ts_ls",
    "tailwindcss",
    "cssmodules_ls",
    ------------------------go
    "gopls",
    "golangci_lint_ls",
  },
}

return M
