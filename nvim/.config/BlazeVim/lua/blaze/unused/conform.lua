local M = {
  "stevearc/conform.nvim",
}

M.opts = {
  -- Map of filetype to formatters
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    go = { "goimports", "gofmt" },
    rust = { "rustfmt", lsp_format = "fallback" },
    mark = { "rustfmt", lsp_format = "fallback" },
    svelte = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    golang = { "golines" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    python = { "isort", "black" },
    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },
}

return M
