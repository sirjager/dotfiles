local M = {
  "nvim-neotest/neotest",
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- adapters
    "nvim-neotest/neotest-go",
  },
}

function M.config()
  require("neotest").setup {
    discovery = {
      -- Drastically improve performance in ginormous projects by
      -- only AST-parsing the currently opened buffer.
      enabled = true,
      -- Number of workers to parse files concurrently.
      -- A value of 0 automatically assigns number based on CPU.
      -- Set to 1 if experiencing lag.
      concurrent = 1,
    },
    running = {
      concurrent = true, -- Run tests concurrently when an adapter provides multiple commands to run.
    },
    summary = {
      animated = true,
    },

    adapters = {
      require "neotest-go" {
        -- recursive_run = true, -- By default go test runs for currecnt package only. Set recursive_run to true to run for all packages
        args = {
          "-v",
          "-cover",
          "-short",
          "-race",
          "-count=1",
          "-timeout=60s",
          "-coverprofile=" .. vim.fn.getcwd() .. "/cover.out",
        },
      },
    },
  }
end

return M
