LAZY_PLUGIN_SPEC = {}

---@diagnostic disable-next-line: lowercase-global, missing-global-doc
function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
