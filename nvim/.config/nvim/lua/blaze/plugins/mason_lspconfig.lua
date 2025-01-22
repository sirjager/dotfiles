local M = {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPost",
}

M.servers = {
  "lua_ls",
  "bashls",
  "jsonls", -- json
  "yamlls", -- yml
  "clangd",
  -- "sqlls",
  -- "marksman", -- md
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
}

function M.config()
  require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = M.servers,
  }
end

return M
