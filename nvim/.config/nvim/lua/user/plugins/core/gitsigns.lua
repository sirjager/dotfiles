local ok, pkg = pcall(require, "gitsigns")
if not ok then
  return
end

pkg.setup {
}
