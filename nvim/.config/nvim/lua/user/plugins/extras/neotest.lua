local ok, pkg = pcall(require, "neotest")
if ok then
  return
end

pkg.setup({
  adapters = {
    require("neotest-go")({
      recursive_run = true,
      test_table = true,
      experimental = { test_table = true },
      args = { "-count=1", "-timeout=30s" },
    }),
  },
})
