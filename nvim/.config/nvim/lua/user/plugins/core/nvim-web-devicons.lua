local ok, pkg = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

pkg.setup {
  strict = true,
  override_by_extension = {
    astro = {
      icon = "",
      color = "#EF8547",
      name = "astro",
    },
  },
}
