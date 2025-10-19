-- Save original function
local original_add = vim.pack.add

local function patched_pack_add(packages, opts)
  opts = opts or {}
  if opts.confirm == nil then
    opts.confirm = false
  end

  -- Normalize package list
  local normalized = {}
  for _, item in ipairs(packages) do
    local pkg = vim.deepcopy(item)
    -- If user passed a string instead of a table
    if type(pkg) == 'string' then
      pkg = { src = pkg }
    end
    -- If src exists but doesn't start with full URL, fix it
    if pkg.src and not pkg.src:match '^https://github.com/' then
      pkg.src = 'https://github.com/' .. pkg.src
    end
    table.insert(normalized, pkg)
  end
  return original_add(normalized, opts)
end

-- Override vim.pack.add
vim.pack.add = patched_pack_add

-- lua/plugins/init.lua
local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'

-- Helper to source all Lua files in this directory (except init.lua itself)
for _, file in ipairs(vim.fn.readdir(plugin_dir, [[v:val =~ '\.lua$']])) do
  if file ~= 'init.lua' then
    local filename = file:gsub('%.lua$', '')

    local ok, err = pcall(require, 'plugins.' .. filename)
    if not ok then
      vim.notify('Error loading file: ' .. filename .. '\n' .. err, vim.log.levels.ERROR)
    end
  end
end
