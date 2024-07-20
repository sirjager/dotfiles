local name = "conform"
local ok1, pkg = pcall(require, name)
if not ok1 then
  return vim.notify(name .. " not installed", vim.log.levels.ERROR)
end


pkg.setup {
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    golang = { "golines" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  -- format_on_save = {
  -- 	lsp_fallback = true,
  -- 	async = false,
  -- 	timeout_ms = 1000,
  -- },
}
