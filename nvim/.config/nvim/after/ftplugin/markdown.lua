local opts = { silent = true }
local keymaps = {
  -- n = {
  --   -- Obsidian commands for markdown
  --   ["<A-d>"] = { "<CMD>ObsidianFollowLink<CR>", "follow link" },
  --   ["<A-t>"] = { "<CMD>ObsidianTags<CR>", "list tags" },
  --   ["<A-o>"] = { "<CMD>ObsidianQuickSwitch<CR>", "switch markdown" },
  --   ["<A-l>"] = { "<CMD>ObsidianBackLink<CR>", "backlinks" },
  --   ["<A-s>"] = { "<CMD>ObsidianSearch<CR>", "search markdowns" },
  --   ["<A-b>"] = { ":lua require'obsidian'.util.toggle_checkbox()<CR>", "toggle checkbox" },
  --   ["<A-a>"] = { ":lua require('obsidian').util.smart_action()<CR>", "smart actions" },
  -- },

  -- insert mode
  i = {},

  -- visual mode
  v = {},

  -- terminal
  t = {},
}

--
for mode, mappings in pairs(keymaps) do
  for key, mapping in pairs(mappings) do
    local cmd = mapping[1]
    --[[ local desc = mapping[2] ]]
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
  end
end
