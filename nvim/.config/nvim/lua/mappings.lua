require "nvchad.mappings"
-- add yours here

local M = {}

M.keymaps = {
  n = {
    ["<Esc>"] = { ":noh <CR>", "clear highlights" },
    ["q"] = { "<ESC><ESC>:noh<CR>", "clear highlights" }, -- disabling maro recording
    ["w"] = { "<ESC>ve", "select word to right" },
    ["b"] = { "<ESC>vb", "select word to left" },

    ["W"] = { [[<ESC>:execute "normal! v" .. (col('$') - col('.')) .. 'l'<CR>]], "select words till end of line" },
    ["B"] = { [[:execute "normal! v" .. (col('.') - 1) .. 'h'<CR>]], "select words till start of line" },

    ["<C-a>"] = { "gg<S-v>G", "select all" }, -- select all text in current buffer
    ["<C-s>"] = { "<ESC><ESC>:w<CR>", "save buffer" }, -- save buffers
    ["<C-w>"] = { ":lua require  require('nvchad.tabufline').close_buffer()<CR>", "close buffer" }, -- close buffers

    ["<C-Up>"] = { ":resize +2<CR>", "increase window height" },
    ["<C-Down>"] = { ":resize -2<CR>", "decrease window height" },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "decrease window width" },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "increase window width" },

    ["<S-h>"] = { ":vertical resize -2<CR>", "decrease window width" },
    ["<S-l>"] = { ":vertical resize +2<CR>", "increase window width" },
    ["<S-k>"] = { ":resize -2<CR>", "decrease window height" },
    ["<S-j>"] = { ":resize +2<CR>", "increase window height" },

    -- INFO:  =================================================================
    -- All Most Used toggleable options using Alt key
    -- DO NOT USE Alt+q Prefix;  Alt+q is use by tmux
    -- ========================================================================

    -- split windows horizontally and vertically
    ["<A-s>l"] = { ":vsplit<CR>", "split window right" },
    ["<A-s>j"] = { ":split<CR>", "split window down" },

    -- fast swtich tabs
    ["<A-1>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[1])<CR>", "go to 1 buffer" },
    ["<A-2>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[2])<CR>", "go to 2 buffer" },
    ["<A-3>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[3])<CR>", "go to 3 buffer" },
    ["<A-4>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[4])<CR>", "go to 4 buffer" },
    ["<A-5>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[5])<CR>", "go to 5 buffer" },
    ["<A-6>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[6])<CR>", "go to 6 buffer" },
    ["<A-7>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[7])<CR>", "go to 7 buffer" },
    ["<A-8>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[8])<CR>", "go to 8 buffer" },
    ["<A-9>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[9])<CR>", "go to 9 buffer" },
    ["<A-0>"] = { ":lua vim.api.nvim_set_current_buf(vim.t.bufs[10])<CR>", "go to 10 buffer" },

    ["<A-a>"] = { ":Maximize<CR>", "maximize / restore window" },
    ["<A-z>"] = { ":ZenMode<CR>", "toggle zen mode" },
    ["<A-t>"] = { ":TroubleToggle<CR>", "toggle trouble" },
    ["<A-m>"] = { ":MarkdownPreviewToggle<CR>", "toggle markdown preview" },
    ["<A-c>"] = { "gcc", "toggle comment" },
    ["<A-o>"] = { ":Lspsaga outline<CR>LLLLL", "toggle lsp outline" },
    -- ["<A-u>"] = { ":BufferLinePick<CR>", "focus any active buffers" },
    ["<A-u>"] = { ":DBUIToggle<CR>", "DB UI Toggle" },
    ["<A-w>"] = { ":lua require('nvchad.tabufline').closeAllBufs(false)<CR>", "close other buffers" },
    ["<A-p>"] = { ":lua vim.lsp.buf.format({timeout_ms = 10000})<CR>", "format without saving" },

    ["<A-B>"] = { ":lua require'ufo'.openAllFolds()<CR>", "open all folds" },
    ["<A-b>"] = { ":lua require'ufo'.closeAllFolds()<CR>", "close all folds" },

    ["<A-r>"] = { ":lua  require'nvchad.lsp.renamer'()<CR>", "smart rename" },
    ["<A-i>"] = { ":Lspsaga hover_doc<CR>", "documentation" },
    ["<A-e>"] = { ":Lspsaga peek_definition<CR>", "peek definition" },
    ["<A-d>"] = { ":Lspsaga goto_definition<CR>", "goto definition" },
    ["<A-f>"] = { ":Lspsaga code_action<CR>", "code action" },
  },

  -- insert mode
  i = {
    -- faster escape insert mode with: jk/kj
    ["jk"] = { "<ESC>", "escape insert mode" },
    ["kj"] = { "<ESC>", "escape insert mode" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
    ["<C-l>"] = { "<Right>", "Move right" },

    ["<C-s>"] = { "<ESC><ESC>:w<CR>i<Right>", "save buffer" }, -- save buffer
  },

  -- visual mode
  v = {
    ["p"] = { '"_dp', "paste last copied" }, -- keep last copied in clipboard
    ["q"] = { "<ESC><ESC> :noh <CR>", "escape visual mode" },
    ["w"] = { "e", "select word to right" },

    -- move selection left, right, top, bottom
    ["H"] = { "<gv", "indent left" },
    ["L"] = { ">gv", "indent right" },
    ["J"] = { ":move '>+1<CR>gv-gv", "move selection down" },
    ["K"] = { ":move '<-2<CR>gv-gv", "move selection up" },

    ["<A-c>"] = { "gcc", "toggle comment" }, -- Toggle Comment: Also in normal mode
    ["<A-r>"] = { "y:%s/<MiddleMouse>//g<Left><Left>", "replace highlighted in buffer" }, -- replace highlighted in buffer
  },

  -- terminal
  t = {},
}

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")
for mode, mappings in pairs(M.keymaps) do
  for key, mapping in pairs(mappings) do
    local cmd = mapping[1]
    local desc = mapping[2]
    vim.keymap.set(mode, key, cmd, { desc = desc })
  end
end
