local M = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  lazy = true,
  event = "VeryLazy",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}

function M.config()
  require "markdown-preview".setup {}
end

return M
