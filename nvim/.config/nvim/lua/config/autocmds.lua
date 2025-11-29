local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

autocmd({ 'BufEnter' }, {
  callback = function()
    vim.cmd 'set formatoptions-=cro'
  end,
})

-- text highlight when yanking
autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 120 }
  end,
})

autocmd({ 'FileType' }, {
  pattern = { 'gitcommit', 'markdown', 'NeogitCommitMessage', 'ledger' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- close Lazy and re-open when the dashboard is ready
if vim.o.filetype == 'lazy' then
  vim.cmd.close()
  autocmd('User', {
    pattern = 'DashboardLoaded',
    callback = function()
      require('lazy').show()
      vim.opt.showtabline = 2
    end,
  })
end

usercmd('ToggleSpellChecker', function()
  vim.opt.spell = not vim.opt.spell:get()
  local status = vim.opt.spell:get() and 'enabled' or 'disabled'
  vim.notify('Spell Checker ' .. status, vim.log.levels.INFO)
end, {})

autocmd('InsertEnter', {
  callback = function()
    vim.g.snacks_scroll = false
  end,
})

autocmd('InsertLeave', {
  callback = function()
    vim.g.snacks_scroll = true
  end,
})
