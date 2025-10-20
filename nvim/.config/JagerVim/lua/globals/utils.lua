local M = {}

-- Utility: flatten multiple tables into one flat list
M.flattable = function(...)
  local result = {}
  local function flatten(tbl)
    for _, v in ipairs(tbl) do
      if type(v) == 'table' then
        flatten(v)
      else
        table.insert(result, v)
      end
    end
  end
  for i = 1, select('#', ...) do
    local tbl = select(i, ...)
    if type(tbl) == 'table' then
      flatten(tbl)
    end
  end
  return result
end

return M
