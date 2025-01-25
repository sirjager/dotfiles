local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPost",
  dependencies = {
    { "nvimtools/none-ls-extras.nvim" },
    { "gbprod/none-ls-shellcheck.nvim" },
  },
}

M.opts = {
  debug = false,
  sources = {
    require("null-ls").builtins.formatting.stylua, -- lua
    require("null-ls").builtins.formatting.shfmt, -- sh/bash

    require("null-ls").builtins.diagnostics.buf, -- proto
    require("null-ls").builtins.formatting.buf, -- proto

    require("null-ls").builtins.formatting.yamlfix,
    require("null-ls").builtins.formatting.sqlfmt,

    -- ts/js
    require("null-ls").builtins.formatting.prettierd, -- ts/js,json
    -- require "none-ls.diagnostics.eslint_d",
    -- require "none-ls.formatting.eslint_d",
    -- require "none-ls.code_actions.eslint_d",
    -- require("null-ls").builtins.formatting.biome.with { extra_filtypes = { "astro", "svelte", "vue" } },

    -- go
    require("null-ls").builtins.diagnostics.golangci_lint, -- go
    require("null-ls").builtins.formatting.gofumpt, -- go
    require("null-ls").builtins.formatting.goimports_reviser, -- go imports

    -- python
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.diagnostics.mypy,
    -- require("null-ls").builtins.diagnostics.ruff,
  },
}

return M
