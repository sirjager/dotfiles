local keymaps = {
  n = {
    ['<Esc>'] = { '<ESC>:noh<CR>', 'clear highlights' },
    ['q'] = { '<ESC><ESC>:noh<CR>', 'clear highlights' }, -- disabling macro recording
    ['w'] = { '<ESC>ve', 'select word to right' },
    ['b'] = { '<ESC>vb', 'select word to left' },
    ['f'] = { ":lua require('flash').jump()<CR>", 'flash jump' },
    ['O'] = { ':so<CR>:restart<CR>', 'relaod configs' },

    ['W'] = { [[<ESC>:execute "normal! v" .. (col('$') - col('.')) .. 'l'<CR>]], 'select words till end of line' },
    ['B'] = { [[:execute "normal! v" .. (col('.') - 1) .. 'h'<CR>]], 'select words till start of line' },

    ['<C-a>'] = { 'gg<S-v>G', 'select all' }, -- select all text in current buffer
    ['<C-s>'] = { '<ESC><ESC>:w<CR>', 'save buffer' }, -- save buffers
    ['<C-w>'] = { ':bd<CR>', 'close buffer' }, -- close buffers
    ['<C-n>'] = { '<CMD>enew<CR>', 'new buffer' }, -- new buffer

    -- ['<C-h>'] = { '<CMD>KittyNavigateRight<CR>', 'KittyNavigateRight' },
    -- ['<C-j>'] = { '<CMD>KittyNavigateDown<CR>', 'KittyNavigateDown' },
    -- ['<C-k>'] = { '<CMD>KittyNavigateUp<CR>', 'KittyNavigateUp' },
    -- ['<C-l>'] = { '<CMD>KittyNavigateLeft<CR>', 'KittyNavigateLeft' },

    ['<C-Up>'] = { ':resize +2<CR>', 'increase window height' },
    ['<C-Down>'] = { ':resize -2<CR>', 'decrease window height' },
    ['<C-Left>'] = { ':vertical resize -2<CR>', 'decrease window width' },
    ['<C-Right>'] = { ':vertical resize +2<CR>', 'increase window width' },

    ['<S-h>'] = { ':vertical resize -2<CR>', 'decrease window width' },
    ['<S-l>'] = { ':vertical resize +2<CR>', 'increase window width' },
    ['<S-k>'] = { ':resize -2<CR>', 'decrease window height' },
    ['<S-j>'] = { ':resize +2<CR>', 'increase window height' },

    ['<S-m>'] = { '<CMD>MarksListAll<CR>', 'list all marks' },

    -- INFO:  =================================================================
    -- All Most Used toggleable options using Alt key
    -- DO NOT USE Alt+q Prefix;  Alt+q is use by tmux
    -- ========================================================================

    -- split windows horizontally and vertically
    ['<A-s>l'] = { ':vsplit<CR>', 'split window right' },
    ['<A-s>j'] = { ':split<CR>', 'split window down' },

    -- fast swtich tabs
    ['<A-1>'] = { '<CMD>BufferLineGoToBuffer 1<CR>', 'go to 1 buffer' },
    ['<A-2>'] = { '<CMD>BufferLineGoToBuffer 2<CR>', 'go to 2 buffer' },
    ['<A-3>'] = { '<CMD>BufferLineGoToBuffer 3<CR>', 'go to 3 buffer' },
    ['<A-4>'] = { '<CMD>BufferLineGoToBuffer 4<CR>', 'go to 4 buffer' },
    ['<A-5>'] = { '<CMD>BufferLineGoToBuffer 5<CR>', 'go to 5 buffer' },
    ['<A-6>'] = { '<CMD>BufferLineGoToBuffer 6<CR>', 'go to 6 buffer' },
    ['<A-7>'] = { '<CMD>BufferLineGoToBuffer 7<CR>', 'go to 7 buffer' },
    ['<A-8>'] = { '<CMD>BufferLineGoToBuffer 8<CR>', 'go to 8 buffer' },
    ['<A-9>'] = { '<CMD>BufferLineGoToBuffer 9<CR>', 'go to 9 buffer' },
    ['<A-0>'] = { '<CMD>BufferLineGoToBuffer 10<CR>', 'go to 10 buffer' },

    ['<A-a>'] = { ':Maximize<CR>', 'maximize / restore window' },
    ['<A-z>'] = { ":lua require('snacks').zen()<CR>", 'toggle zenmode' },
    ['<A-t>'] = { ':TroubleToggle<CR>', 'toggle trouble' },
    ['<A-P>'] = { '<CMD>BufferLineTogglePin<CR>', 'toggle pin current buffer' },

    -- Markdown Preview
    ['<A-M>'] = { ':MarkdownPreviewToggle<CR>', 'toggle markdown preview' },

    -- Harpoon - custom autocmd
    ['<TAB>'] = { '<CMD>HarpoonToggle<CR>', 'harpoon toogle menu' },
    ['<A-m>'] = { '<CMD>HarpoonMark<CR>', 'harpoon mark file' },
    ['<A-j>'] = { '<CMD>HarpoonNextMarked<CR>', 'harpoon next marked file' },
    ['<A-k>'] = { '<CMD>HarpoonPrevMarked<CR>', 'harpoon prev marked file' },

    ['<A-c>'] = { 'gcc', 'toggle comment' },
    -- ['<A-o>'] = { ':Outline<CR>', 'Toggle LSP Outline' },
    ['<A-u>'] = { ':BufferLinePick<CR>', 'focus any active buffers' },
    ['<A-w>'] = { ':BufferLineCloseOthers<CR>', 'close other buffers' },
    ['<C-p>'] = { ":lua require('snacks').picker.buffers({layout='ivy'})<CR>", 'active buffers' },
    ['<A-p>'] = { ":lua require('conform').format()<CR>", 'format without saving' },
    -- ["<A-p>"] = { ":lua vim.lsp.buf.format({timeout_ms = 5000})<CR>", "format without saving" },

    ['<A-v>'] = { ":lua require'ufo'.openAllFolds()<CR>", 'open all folds' },
    -- ['<A-b>'] = { ":lua require'ufo'.closeAllFolds()<CR>", 'close all folds' },

    ['<A-r>'] = { ':Lspsaga rename<CR>', 'smart rename' },
    -- ["<A-i>"] = { ":Lspsaga hover_doc<CR>", "documentation" },
    ['<A-i>'] = { ':lua vim.lsp.buf.hover()<CR>', 'documentation' },
    ['<A-e>'] = { ':Lspsaga peek_definition<CR>', 'peek definition' },
    ['<A-d>'] = { ':Lspsaga goto_definition<CR>', 'goto definition' },
    ['<A-f>'] = { ':Lspsaga code_action<CR>', 'code action' },

    -- ["<C-m>"] = { ":lua  require('menu').open('default')<CR>", "open option menu" },
    -- ["<RightMouse>"] = { ":lua  require('menu').open('default')<CR>", "open option menu" },
  },

  -- insert mode
  i = {
    -- faster escape insert mode with: jk/kj
    ['jk'] = { '<ESC>', 'escape insert mode' },
    ['kj'] = { '<ESC>', 'escape insert mode' },

    -- navigate within insert mode
    ['<C-h>'] = { '<Left>', 'Move left' },
    ['<C-j>'] = { '<Down>', 'Move down' },
    ['<C-k>'] = { '<Up>', 'Move up' },
    ['<C-l>'] = { '<Right>', 'Move right' },

    ['<C-s>'] = { '<ESC><ESC>:w<CR>i<Right>', 'save buffer' }, -- save buffer
    ['<C-p>'] = { ":lua require('snacks').picker.buffers({layout='ivy'})<CR>", 'active buffers' },
  },

  -- visual mode
  v = {
    ['p'] = { '"_dp', 'paste last copied' }, -- keep last copied in clipboard
    -- ["q"] = { "<ESC><ESC> :noh <CR>", "escape visual mode" },
    ['w'] = { 'e', 'select word to right' },

    -- move selection left, right, top, bottom
    ['H'] = { '<gv', 'indent left' },
    ['L'] = { '>gv', 'indent right' },
    ['J'] = { ":move '>+1<CR>gv-gv", 'move selection down' },
    ['K'] = { ":move '<-2<CR>gv-gv", 'move selection up' },

    ['<A-c>'] = { 'gcc', 'toggle comment' }, -- Toggle Comment: Also in normal mode

    -- ["<C-m>"] = { ":lua  require('menu').open('default')<CR>", "open option menu" },
    -- ["<RightMouse>"] = { ":lua  require('menu').open('default')<CR>", "open option menu" },
  },

  -- terminal
  t = {},
}

for mode, mappings in pairs(keymaps) do
  for key, mapping in pairs(mappings) do
    local cmd = mapping[1]
    local desc = mapping[2]
    vim.api.nvim_set_keymap(mode, key, cmd, { silent = true, noremap = true, desc = desc })
  end
end

-- these two were not working with noremap = true
-- if noremap = true, set then movenment in editing mode dosen't work, specifically right side
vim.api.nvim_set_keymap('n', '<A-c>', 'gcc', { silent = true, noremap = false })
vim.api.nvim_set_keymap('v', '<A-c>', 'gcc', { silent = true, noremap = false })
