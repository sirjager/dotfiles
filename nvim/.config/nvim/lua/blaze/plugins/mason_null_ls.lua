local M = {
  "jayp0521/mason-null-ls.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
}

M.opts = {
  automatic_installation = true,
  ensure_installed = {
    "astro-language-server", -- astro
    "buf",
    "buf-language-server",
    -- "shellharden", -- sh
    -- "shellcheck",
    "jq",
    "eslint_d",
    "prettierd",
    "shfmt",
    "sqlfmt",
    "sql-formatter",
    "fixjson",
    -- go
    "protolint",
    "golangci-lint",
    "gospel",
    "gofumpt",
    "golines",
    "goimports_reviser",
    -- lua
    "lua-language-server", -- lua
    "stylua", -- lua
    -- ts/js
    "typescript-languange-server", -- ts,js
  },
}

return M
