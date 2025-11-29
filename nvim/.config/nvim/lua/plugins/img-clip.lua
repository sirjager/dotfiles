local M = {
  'HakonHarnes/img-clip.nvim',
  ft = {
    'markdown',
    'mdx',
    'mdoc',
    'norg',
    -- "html",
    -- "astro",
  },
}

local function find_assets_dir()
  local dir = vim.fn.expand '%:p:h'
  while dir ~= '/' do
    local full_path = dir .. '/assets/images'
    if vim.fn.isdirectory(full_path) == 1 then
      return full_path
    end
    dir = vim.fn.fnamemodify(dir, ':h')
  end
  return nil
end

M.opts = {
  default = {
    use_absolute_path = false,
    relative_to_current_file = true,
    dir_path = function()
      local path = find_assets_dir()
      return path or vim.fn.expand '%:t:r' .. '-img'
    end,
    prompt_for_file_name = true,
    file_name = '%Y-%m-%d-at-%H-%M-%S',
    extension = 'avif',
    process_cmd = 'convert - -quality 75 avif:-',
  },
  filetypes = {
    markdown = {
      url_encode_path = true, ---@type boolean
      template = '![$FILE_NAME]($FILE_PATH)', ---@type string
    },
  },
}

return M
