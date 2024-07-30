local M = {
  "akinsho/flutter-tools.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "akinsho/pubspec-assist.nvim",
  },
}

M.opts = {
  ui = {
    border = "rounded",
    notification_style = "plugin", -- "native" | "plugin",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true,
      project_config = true,
    },
  },
  root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    highlight = "Comment",
    prefix = "",
    enabled = false,
  },
  lsp = {
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = false,
      lineLength = 200,
      completeFunctionCalls = true,
      enableSnippets = true,
      enableSdkFormatter = true,
      updateImportsOnRename = true,
      renameFilesWithClasses = "prompt",
    },
  },
}

function M.config()
  require("flutter-tools").setup(M.opts)
  require("pubspec-assist").setup {}
end

return M
