local M = {
  'stevearc/conform.nvim',
  lazy = false,
}

M.opts = {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd', lsp_format = 'fallback' },
    typescript = { 'prettierd', lsp_format = 'fallback' },
    javascriptreact = { 'prettierd', lsp_format = 'fallback' },
    typescriptreact = { 'prettierd', lsp_format = 'fallback' },
    go = { 'goimports', 'gofmt' },
    rust = { 'rustfmt', lsp_format = 'fallback' },
    mark = { 'rustfmt', lsp_format = 'fallback' },
    svelte = { 'prettierd' },
    css = { 'prettierd' },
    html = { 'prettierd' },
    json = { 'prettierd' },
    golang = { 'golines' },
    yaml = { 'prettierd' },
    markdown = { 'prettierd' },
    graphql = { 'prettierd' },
    toml = { 'taplo' },
    python = { 'isort', 'black' },
    ['*'] = { 'codespell' },
    ['_'] = { 'trim_whitespace' },
  },
}

M.config = function(_, opts)
  require('conform').setup(opts)
end

return M
