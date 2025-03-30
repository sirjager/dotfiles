vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.cmd "checktime"
--   end,
-- })

-- text highlight when yanking
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 120 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage", "ledger" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- close Lazy and re-open when the dashboard is ready
if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "DashboardLoaded",
    callback = function()
      require("lazy").show()
      vim.opt.showtabline = 2
    end,
  })
end

vim.api.nvim_create_user_command("MasonInstallAll", function()
  local servers = require("blaze.plugins.mason").servers or {}
  local servers_str = table.concat(servers, " ")
  vim.cmd("MasonInstall " .. servers_str)
end, {})

vim.api.nvim_create_user_command("ToggleSpellChecker", function()
  vim.opt.spell = not vim.opt.spell:get()
  local status = vim.opt.spell:get() and "enabled" or "disabled"
  vim.notify("Spell Checker " .. status, vim.log.levels.INFO)
end, {})

-- vim.api.nvim_create_autocmd("InsertLeave", {
--   callback = function()
--     if
--       require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--       and not require("luasnip").session.jump_active
--     then
--       require("luasnip").unlink_current()
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("RecordingEnter", {
--   callback = function()
--     vim.notify("Recording Macro: " .. vim.fn.reg_recording(), vim.log.levels.INFO)
--   end,
-- })

-- vim.api.nvim_create_autocmd("RecordingLeave", {
--   callback = function()
--     vim.defer_fn(function()
--       local last_macro = vim.fn.reg_recorded()
--       vim.notify("Macro Recorded: @" .. last_macro .. " = " .. vim.fn.getreg(last_macro), vim.log.levels.INFO)
--     end, 100)
--   end,
-- })
