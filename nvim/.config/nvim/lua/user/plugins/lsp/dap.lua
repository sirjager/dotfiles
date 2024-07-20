local ok1, dap = pcall(require, "dap")
if not ok1 then
  return
end

local ok2, dapui = pcall(require, "dapui")
if not ok2 then
  return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint',
  { text = '🚩', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
  { text = '❌', texthl = 'DapBreakpointRejected', linehl = 'DapBreakpointRejected', numhl = 'DapBreakpointRejected' })
vim.fn.sign_define('DapStopped', { text = '⭕', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
