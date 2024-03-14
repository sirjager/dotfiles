local opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymaps = {
  n = {
    -- clear highlights
    ["<Esc>"] = { ":noh <CR>", "clear highlights" },

    ["w"] = { "<ESC>ve", "select word to right" },
    ["b"] = { "<ESC>vb", "select word to left" },

    ["W"] = { [[<ESC>:execute "normal! v" .. (col('$') - col('.')) .. 'l'<CR>]], "select words till end of line" },
    ["B"] = { [[:execute "normal! v" .. (col('.') - 1) .. 'h'<CR>]], "select words till start of line" },

    -- disabling recording:
    ["q"] = { "<ESC><ESC>:noh<CR>", "clear highlights" },

    -- select all text in current buffer
    ["<C-a>"] = { "gg<S-v>G", "select all" },

    -- save buffers
    ["<C-s>"] = { ":w<CR>", "save buffer" },

    -- close buffers
    ["<C-w>"] = { "<Cmd>BufferClose<CR>", "close buffer" },

    -- new buffer
    ["<C-n>"] = { "<Cmd>enew<CR>", "new buffer" },

    -- toogle line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

    -- rust crates
    ["<leader>rcu"] = { ":lua require'crates'.upgrade_all_crates()<CR>", "rust update crates" },

    -- Resize windows with arrows
    ["<C-Up>"] = { ":resize +2<CR>", "increase window height" },
    ["<C-Down>"] = { ":resize -2<CR>", "decrease window height" },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "decrease window width" },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "increase window width" },

    ["<S-h>"] = { ":vertical resize -2<CR>", "decrease window width" },
    ["<S-l>"] = { ":vertical resize +2<CR>", "increase window width" },
    ["<S-j>"] = { ":resize -2<CR>", "decrease window height" },
    ["<S-k>"] = { ":resize +2<CR>", "increase window height" },

    -- dont really use it,
    --[[ ["<A-i>"] = { "<Cmd>BufferPick<CR>", "smart buffer picker" }, ]]

    -- fast swtich tabs
    ["<A-1>"] = { "<Cmd>BufferGoto 1<CR>", "go to 1 buffer" },
    ["<A-2>"] = { "<Cmd>BufferGoto 2<CR>", "go to 2 buffer" },
    ["<A-3>"] = { "<Cmd>BufferGoto 3<CR>", "go to 3 buffer" },
    ["<A-4>"] = { "<Cmd>BufferGoto 4<CR>", "go to 4 buffer" },
    ["<A-5>"] = { "<Cmd>BufferGoto 5<CR>", "go to 5 buffer" },
    ["<A-6>"] = { "<Cmd>BufferGoto 6<CR>", "go to 6 buffer" },
    ["<A-7>"] = { "<Cmd>BufferGoto 7<CR>", "go to 7 buffer" },
    ["<A-8>"] = { "<Cmd>BufferGoto 8<CR>", "go to 8 buffer" },
    ["<A-9>"] = { "<Cmd>BufferGoto 9<CR>", "go to 9 buffer" },
    ["<A-0>"] = { "<Cmd>BufferLast<CR>", "go to last buffer" },

    -- split windows horizontally and vertically
    ["<A-s>l"] = { ":vsplit<CR><C-w>w", "split window right" },
    ["<A-s>j"] = { ":split<CR><C-w>w", "split window down" },

    -- go lang specific
    ["<leader>gsj"] = { "<CMD> GoTagAdd json <CR>", "go: add json struct tags" },
    ["<leader>gsy"] = { "<CMD> GoTagAdd yaml <CR>", "go: add yaml struct tags" },

    ["<leader>gg"] = { ":Gen <CR>", "go: add yaml struct tags" },

    -- INFO:  =================================================================
    -- All Most Used toggleable options using Alt key
    -- Some keybinds may conflict with tmux, keep cross checking tmux configs
    -- ========================================================================
    --
    -- Toggle Maximize Current Buffer
    --[[ ["<A-a>"] = { ":MaximizerToggle<CR>", "maximize / restore window" }, ]]
    -- Switch Buffer
    -- ["<A-b>"] = { ":Telescope buffers <CR>", "opened buffers" },
    -- Toggle Zen Mode
    ["<A-z>"] = { ":ZenMode<CR>", "toggle zen mode" },
    -- Toggle Trouble panel
    ["<A-t>"] = { ":TroubleToggle<CR>", "toggle trouble" },
    -- Rename instance
    ["<A-r>"] = { ":Lspsaga rename<CR>", "smart rename" },
    -- Toggle Pin Current Buffer
    ["<A-P>"] = { "<Cmd>BufferPin<CR>", "toggle pin current buffer" },
    -- Toggle Markdown Preview
    ["<A-m>"] = { ":MarkdownPreviewToggle<CR>", "toggle markdown preview" },
    -- Toggle Comment: Also in visual mode
    ["<A-c>"] = { "gcc", "toggle comment" },
    -- Toggle Wrap Lines with custom function in function.lua
    ["<A-y>"] = { ":lua Toggle_WrapLines()<CR>", "toggle wrap lines" },
    -- Toggle Line Numbers with custom function in function.lua
    ["<A-n>"] = { ":lua Toggle_LineNumbers()<CR>", "toggle line numbers" },
    -- Toggle Lspsage Outline; using L to increase size
    ["<A-o>"] = { ":NvimTreeClose<CR>:Lspsaga outline<CR>LLLLLLL", "toggle lsp outline" },
    -- Toggle Hover Pic
    ["<A-i>"] = { ":Lspsaga hover_doc <CR>", "toggle doc" },
    -- Toggle Peek Definition
    ["<A-e>"] = { ":Lspsaga peek_definition <CR>", "toggle peek definition" },
    -- Go To Definition
    ["<A-d>"] = { ":Lspsaga goto_definition <CR>", "goto definition" },
    -- Toggle Quick Fix Window
    ["<A-f>"] = { ":CodeActionMenu<CR>", "code action" },
    -- Toggle Database UI, closing nvimtree first to keep one opened at same time
    ["<A-u>"] = { ":NvimTreeClose<CR> :DBUIToggle<CR>", "toggle database ui" },
    -- Close All But Current Or Pinned Buffers
    ["<A-w>"] = { ":BufferCloseAllButCurrentOrPinned<CR>", "close all buffer but current or pinned" },
    -- Close All But Current Or Pinned Buffers
    ["<A-p>"] = { ":lua vim.lsp.buf.format({timeout_ms = 10000})<CR>", "format without saving" },
    -- Color picker
    ["<A-x>"] = { ":PickColor<CR>", "color picker" },
    -- Code fold
    ["<A-v>"] = { ":lua require'ufo'.openAllFolds()<CR>", "open all folds" },
    ["<A-b>"] = { ":lua require'ufo'.closeAllFolds()<CR>", "close all folds" },
    -- Toggle Terminal - Keeping here for ref. set by toggleterm.lua configs
    --[[ ["<C-\>"] = { ":ToggleTerm direction=float<CR>", "toggle terminal" }, ]]

    -- ========================================================================
  },

  -- insert mode
  i = {
    -- faster escape insert mode with: jk/kj
    ["jk"] = { "<ESC>", "escape insert mode" },
    ["kj"] = { "<ESC>", "escape insert mode" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },

    -- save buffer
    ["<C-s>"] = { "<ESC>:w<CR>i<Right>", "save buffer" },
  },

  -- visual mode
  v = {
    -- keep last copied in clipboard
    ["p"] = { '"_dp', "paste last copied" },

    ["<leader>gg"] = { ":Gen <CR>", "go: add yaml struct tags" },

    ["q"] = { "<ESC><ESC> :noh <CR>", "escape visual mode" },
    ["w"] = { "e", "select word to right" },

    -- move selection left, right, top, bottom
    ["H"] = { "<gv", "indent left" },
    ["L"] = { ">gv", "indent right" },
    ["J"] = { ":move '>+1<CR>gv-gv", "move selection down" },
    ["K"] = { ":move '<-2<CR>gv-gv", "move selection up" },

    -- Toggle Comment: Also in normal mode
    ["<A-c>"] = { "gcc", "toggle comment" },
  },

  -- terminal
  t = {},
}

local which_keymaps = {
  -- e = { ":NvimTreeFindFileToggle<CR>", "toggle file explorer" },
  e = { ":Neotree toggle<CR>", "toggle file explorer" },

  f = {
    l = { "<CMD>Telescope flutter commands<CR>", "flutter commands" },
  },

  w = {
    name = "nx workspace",
    a = { "<CMD>Telescope nx actions<CR>", "nx action" },
    g = { "<CMD>Telescope nx generators<CR>", "nx generators" },
    f = { "<CMD>Telescope nx affected<CR>", "nx affected" },
    m = { "<CMD>Telescope nx run_many<CR>", "nx run many" },
    e = { "<CMD>Telescope nx external_generators<CR>", "nx external generators" },
    w = { "<CMD>Telescope nx workspace_generators<CR>", "nx workspace generators" },
  },


  g = {
    name = "golang",
    t = { ":GoAddTag<CR>", "add tags" },
    x = { ":GoRmTag<CR>", "remove tags" },
    e = { ":GoIfErr<CR>", "add error check" },
    f = { ":GoFixPlurals<CR>", "fix func args" }, -- change func foo(b int, a int, r int) -> func foo(b, a, r int)
    r = { ":GoRun ./cmd<CR>", "run code" },
    s = { ":GoStop<CR>", "stop running code" },
    g = { ":GoModTidy<CR>", "mod tidy" },
    v = { ":GoModVendor<CR>", "mod vendor" },
  },

  --[[ t = { ]]
  --[[   name = "toggle", ]]
  --[[   t = { ]]
  --[[     name = "toggle terminal", ]]
  --[[     f = { ":ToggleTerm direction=float<CR>", "terminal on float" }, ]]
  --[[     l = { ":ToggleTerm direction=vertical size=80<CR>", "terminal on right" }, ]]
  --[[     j = { ":ToggleTerm direction=horizontal size=8<CR>", "terminal on left" }, ]]
  --[[   }, ]]
  --[[ }, ]]

  s = {
    name = "search",
    s = { ":Telescope find_files <CR>", "find files" }, -- most used
    b = { ":Telescope buffers <CR>", "opened buffers" },
    e = { ":Telescope emoji <CR>", "find emoji" },
    W = { ":Telescope live_grep <CR>", "find in workspace" },
    o = { ":Telescope oldfiles <CR>", "recent files" },
    p = { ":Telescope project <CR>", "open project" },
    r = { ":Telescope resume <CR>", "resume search" },
    w = { ":Telescope current_buffer_fuzzy_find <CR>", "find in buffer" },
    h = { ":Telescope help_tags <CR>", "help tags" },
    k = { ":Telescope keymaps <CR>", "key bindings" },
    c = { ":Telescope colorscheme <CR>", "color schemes" },
    a = { ":Telescope autocommands <CR>", "auto commands" },
    C = { ":Telescope commands <CR>", "list commands" },
  },

  d = {
    name = "diagnostic",
    d = { ":Lspsaga show_buf_diagnostics <CR>", "buf diagnostics" }, -- most used
    w = { ":Lspsaga show_workspace_diagnostics <CR>", "workspace diagnostics" },
    l = { ":Lspsaga show_line_diagnostics <CR>", "line diagnostics" },
    j = { ":Lspsaga diagnostic_jump_next <CR>", "next diagnostic" },
    k = { ":Lspsaga diagnostic_jump_prev <CR>", "prev diagnostic" },
    c = { ":Lspsaga show_cursor_diagnostics <CR>", "cursor diagnostics" },
  },


  l = {
    name = "lsp",
    i = { ":LspInfo<CR>", "lsp info" },
    h = { ":Lspsaga hover_doc <CR>", "hover doc" }, -- most used 1
    a = { ":CodeActionMenu<CR>", "code action" },   -- most used 2
    o = { ":Lspsaga outline <CR>", "outline" },
    r = { ":LspRestart<CR>", "restart lsp" },

    s = {
      name = "live server",
      l = { ":LiveServer<CR>", "live server" },
      i = { ":LiveServerInstall<CR>", "live server install" },
      s = { ":LiveServerStart<CR>", "start live server" },
      t = { ":LiveServerStop<CR>", "stop live server" },
    },

    l = {
      name = "lab:code runner",
      r = { ":Lab code run<CR>", "start code runner" },
      s = { ":Lab code stop<CR>", "stop code runner" },
      p = { ":Lab code panel<CR>", "code runner panel" },
    },

    c = {
      name = "calls",
      i = { ":Lspsaga incoming_calls <CR>", "incoming calls" },
      o = { ":Lspsaga outgoing_calls <CR>", "outgoing calls" },
    },

    d = {
      name = "debugging",
      b = { "<cmd> DapToggleBreakpoint <CR>", "toggle breakpoint" },
      c = { "<cmd> DapContinue <CR>", "debug continue" },
      t = { "<cmd> DapTerminate <CR>", "debug terminate" },
      l = { "<cmd> DapShowLog <CR>", "debug show log" },
      i = { "<cmd> DapStepInto <CR>", "debug step into" },
      j = { "<cmd> DapStepOver <CR>", "debug step over" },
      o = { "<cmd> DapStepOut <CR>", "debug step out" },
      u = {
        function()
          local widgets = require "dap.ui.widgets"
          local sidebar = widgets.sidebar(widgets.scopes)
          sidebar.open()
        end,
        "open debug sidebar",
      },
    },
  },
}

--
for mode, mappings in pairs(keymaps) do
  for key, mapping in pairs(mappings) do
    local cmd = mapping[1]
    --[[ local desc = mapping[2] ]]
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
  end
end

-- which key mappings:
local ok, wk = pcall(require, "which-key")
if ok then
  -- default which-key opts: https://github.com/folke/which-key.nvim
  local which_key_opts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
    expr = false,   -- use `expr` when creating keymaps
  }
  wk.register(which_keymaps, which_key_opts)
end
