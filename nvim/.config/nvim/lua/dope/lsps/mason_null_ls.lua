local M = {
  "jayp0521/mason-null-ls.nvim",
}

M.servers = {
  -- "astro-language-server", -- astro
  "buf",
  "buf-language-server",
  "eslint_d",
  "gofumpt", -- go
  -- "shellharden", -- sh
  -- "shellcheck",
  -- "jq",
  -- "shfmt",
  -- "sqlfmt",
  -- "sql-formatter",
  "fixjson",
  "golangci-lint",
  "gospel",
  "prettierd",
  "gofumpt",
  "goimports_reviser", -- go
  -- "golines",                         -- go
  "lua-language-server", -- lua
  "stylua", -- lua
  "typescript-languange-server", -- ts,js
  -- "protolint",
}

function M.config()
  require("mason-null-ls").setup {
    automatic_installation = true,
    ensure_installed = M.servers,
  }
end

return M
