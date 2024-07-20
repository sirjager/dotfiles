local ok, pkg = pcall(require, "lint")
if not ok then
  return
end

pkg.linters_by_ft = {
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  markdown = { { "vale", "markdownlint" } },
  mdx = { { "vale", "markdownlint" } },
  sql = { "sqlfluff" },
  python = { "pylint" },
  -- rust = { "rstlint", "rstcheck" },
  lua = { "luacheck" },
  go = { "golangcilint" },
}
