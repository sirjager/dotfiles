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

M.mark_cmd = function(cmd)
  -- delete ALL marks (no input needed)
  if cmd == 'delmarks!' then
    vim.cmd 'delmarks A-Z0-9'
    vim.notify 'Deleted all marks'
    return
  end

  -- read one character (silent, no dialog)
  local char = vim.fn.getcharstr()

  -- validate input
  if not char or #char ~= 1 then
    vim.notify('Invalid mark key', vim.log.levels.WARN)
    return
  end

  -- delmarks <char> (delete single mark)
  if cmd == 'delmarks' then
    vim.cmd('delmarks ' .. char)
    vim.notify('Deleted mark: ' .. char)
    return
  end

  -- normal mark operations: set mark or jump to mark
  vim.cmd('normal! ' .. cmd .. char)
end

return M
