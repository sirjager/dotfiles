LAZY_PLUGIN_SPEC = {}

---@diagnostic disable-next-line: lowercase-global
function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
