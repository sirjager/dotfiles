local M = {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    { "folke/neodev.nvim", lazy = true, event = "VeryLazy" },
    { "ray-x/guihua.lua", lazy = true, event = "VeryLazy" },
    { "mfussenegger/nvim-dap", lazy = true, event = "VeryLazy" },
    { "theHamsta/nvim-dap-virtual-text", lazy = true, event = "VeryLazy" },
  },
}

function M.config()
  local dap = require "dap"
  local dapui = require "dapui"
  local neodev = require "neodev"
  dapui.setup()

  neodev.setup { library = { plugins = { "nvim-dap-ui" }, types = true } }

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dap.adapters.dart = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" },
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch Dart Program",
      program = "${file}",
      cwd = "${workspaceFolder}",
      args = {},
    },
  }
end

return M
