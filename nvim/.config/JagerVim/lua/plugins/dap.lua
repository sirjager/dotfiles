vim.pack.add {
  { src = 'rcarriga/nvim-dap-ui' },
  { src = 'ray-x/guihua.lua' }, -- gui lib
  -- {src= "folke/neodev.nvim" },
  { src = 'nvim-neotest/nvim-nio' },
  { src = 'mfussenegger/nvim-dap' },
  { src = 'theHamsta/nvim-dap-virtual-text' },
  { src = 'leoluz/nvim-dap-go' },
  -- {src="mfussenegger/nvim-dap-python" },
}

local dap = require 'dap'
local dapui = require 'dapui'

local sign = vim.fn.sign_define

sign('DapStopped', { text = '󰜴', texthl = 'DiagnosticSignWarn', linehl = 'Visual', numhl = 'DiagnosticSignWarn' })
sign('DapBreakpoint', { text = '󰻃 ', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
sign('DapBreakpointRejected', { text = '󰜺 ', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

dapui.setup()
require('nvim-dap-virtual-text').setup {
  commented = true, -- show virtual text alongside comment
}

-- language debug_adapters
require('dap-go').setup()
-- require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
