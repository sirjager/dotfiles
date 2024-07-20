local ok, pkg = pcall(require, "cmp-graphql")
if not ok then
  return
end

pkg.setup {
  schema_path = "graphql.schema.json",
}
