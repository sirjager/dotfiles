local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    { "folke/neodev.nvim" },
    { "ray-x/guihua.lua" },
    { "mfussenegger/nvim-dap" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "leoluz/nvim-dap-go" },
  },
}

function M.config()
  -- require("dap-go").setup {}
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
