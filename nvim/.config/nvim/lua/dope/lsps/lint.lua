local M = {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = "VeryLazy",
}

M.linters_by_ft = {}

function M.config(_, opts)
  table.insert(opts.linters_by_ft or {}, {
    go = { "golangcilint" },
    dockerfile = { "hadolint" },
    javascript = { "biomejs", "eslint_d", "eslint" },
    typescript = { "biomejs", "eslint_d", "eslint" },
    javascriptreact = { "biomejs", "eslint_d", "eslint" },
    typescriptreact = { "biomejs", "eslint_d", "eslint" },
    proto = { "protolint"}
  })

  table.insert(opts.linters or {}, {
    biomejs = {
      condition = function(ctx)
        return vim.fs.find({ "biome.json", "biome.jsonc" }, {
          path = ctx.dirname,
          upward = true,
        })[1]
      end,
    },
  })

  table.insert(opts.linters or {}, {
    eslint = {
      condition = function(ctx)
        return vim.fs.find({
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json",
          "eslint.config.js",
          "eslint.config.mjs",
          "eslint.config.cjs",
          "eslint.config.ts",
          "eslint.config.mts",
          "eslint.config.cts",
        }, {
          path = ctx.dirname,
          upward = true,
        })[1]
      end,
    },
  })

  return opts
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

return M
