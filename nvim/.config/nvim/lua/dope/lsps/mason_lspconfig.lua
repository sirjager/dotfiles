local M = {
  "williamboman/mason-lspconfig.nvim",
}

M.servers = {
  -- "astro",
  "lua_ls",
  "bashls",
  -- "clangd",
  "cssls",
  "emmet_ls",
  "gopls", -- go
  "golangci_lint_ls",
  "html", -- html
  "jsonls", -- json
  -- "marksman", -- md
  "tsserver", -- ts
  "tailwindcss",
  "cssmodules_ls",
  "yamlls", -- yml
  -- "sqlls",
  -- "prismals",
}

function M.config()
  require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = M.servers,
  }
end

return M
