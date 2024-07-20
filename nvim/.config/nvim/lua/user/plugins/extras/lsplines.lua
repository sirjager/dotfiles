local ok, pkg = pcall(require, "lsp_lines")
if not ok then
  return vim.notify("lsp_lines not installed", vim.log.levels.ERROR)
end

-- https://git.sr.ht/~whynothugo/lsp_lines.nvim
pkg.setup {}
