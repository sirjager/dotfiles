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
    ["<C-w>"] = { ":bd<CR>", "close buffer" },

    -- new buffer
    ["<C-n>"] = { "<Cmd>enew<CR>", "new buffer" },

    -- toogle line numbers
    -- ["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
    -- ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

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
    ["<A-1>"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "go to 1 buffer" },
    ["<A-2>"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "go to 2 buffer" },
    ["<A-3>"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "go to 3 buffer" },
    ["<A-4>"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "go to 4 buffer" },
    ["<A-5>"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "go to 5 buffer" },
    ["<A-6>"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "go to 6 buffer" },
    ["<A-7>"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "go to 7 buffer" },
    ["<A-8>"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "go to 8 buffer" },
    ["<A-9>"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "go to 9 buffer" },
    ["<A-0>"] = { "<Cmd>BufferLineGoToBuffer 10<CR>", "go to 10 buffer" },

    -- split windows horizontally and vertically
    ["<A-s>l"] = { ":vsplit<CR>", "split window right" },
    ["<A-s>j"] = { ":split<CR>", "split window down" },


    -- INFO:  =================================================================
    -- All Most Used toggleable options using Alt key
    -- Some keybinds may conflict with tmux, keep cross checking tmux configs
    -- ========================================================================

    -- Toggle Maximize Current Buffer
    ["<A-a>"] = { ":MaximizerToggle<CR>", "maximize / restore window" },
    -- Switch Buffer
    -- ["<A-b>"] = { ":Telescope buffers <CR>", "opened buffers" },
    -- Toggle Zen Mode
    ["<A-z>"] = { ":ZenMode<CR>", "toggle zen mode" },
    -- Toggle Trouble panel
    ["<A-t>"] = { ":TroubleToggle<CR>", "toggle trouble" },
    -- Rename instance
    ["<A-r>"] = { ":Lspsaga rename<CR>", "smart rename" },
    -- Toggle Pin Current Buffer
    ["<A-P>"] = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin current buffer" },
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
    ["<A-e>"] = { ":Lspsaga peek_definition<CR>", "toggle peek definition" },
    -- Go To Definition
    ["<A-d>"] = { ":Lspsaga goto_definition<CR>", "goto definition" },
    -- Toggle Quick Fix Window
    ["<A-f>"] = { ":lua require('actions-preview').code_actions()<CR>", "code action" },
    -- Toggle Database UI, closing nvimtree first to keep one opened at same time
    ["<A-u>"] = { ":NvimTreeClose<CR> :DBUIToggle<CR>", "toggle database ui" },
    -- Close All But Current Or Pinned Buffers
    ["<A-w>"] = { ":BufferLineCloseOthers<CR>", "close other buffers" },
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
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
    ["<C-l>"] = { "<Right>", "Move right" },

    -- save buffer
    ["<C-s>"] = { "<ESC>:w<CR>i<Right>", "save buffer" },
  },

  -- visual mode
  v = {
    -- keep last copied in clipboard
    ["p"] = { '"_dp', "paste last copied" },

    ["q"] = { "<ESC><ESC> :noh <CR>", "escape visual mode" },
    ["w"] = { "e", "select word to right" },

    -- move selection left, right, top, bottom
    ["H"] = { "<gv", "indent left" },
    ["L"] = { ">gv", "indent right" },
    ["J"] = { ":move '>+1<CR>gv-gv", "move selection down" },
    ["K"] = { ":move '<-2<CR>gv-gv", "move selection up" },

    -- Toggle Comment: Also in normal mode
    ["<A-c>"] = { "gcc", "toggle comment" },

    -- replace highlighted in buffer
    ["<A-r>"] = { "y:%s/<MiddleMouse>//g<Left><Left>", "replace highlighted in buffer" },
  },

  -- terminal
  t = {},
}

local which_keymaps = {
  -- e = { ":NvimTreeToggle<CR>", "toggle file explorer" },
  e = { ":Neotree toggle<CR>", "toggle file explorer" },
  r = { ":luafile %<CR>", "source current luafile" },

  f = {
    name = "code actions",
    f = { ":lua require('actions-preview').code_actions()<CR>", "code action" },
  },

  o = {
    name = "obsidian",
    d = { "<CMD>ObsidianFollowLink<CR>", "follow link" },
    t = { "<CMD>ObsidianTags<CR>", "list tags" },
    o = { "<CMD>ObsidianQuickSwitch<CR>", "switch markdown" },
    l = { "<CMD>ObsidianBackLink<CR>", "backlinks" },
    s = { "<CMD>ObsidianSearch<CR>", "search markdowns" },
    b = { ":lua require'obsidian'.util.toggle_checkbox()<CR>", "toggle checkbox" },
    a = { ":lua require('obsidian').util.smart_action()<CR>", "smart actions" },
  },

  d = {
    name = "debugging",
    u = { "<CMD> DapUiToggle<CR>", "toggle dap ui" },
    b = { "<cmd> DapToggleBreakpoint <CR>", "toggle breakpoint" },
    c = { "<cmd> DapContinue <CR>", "debug continue" },
    t = { "<cmd> DapTerminate <CR>", "debug terminate" },
    l = { "<cmd> DapShowLog <CR>", "debug show log" },
    i = { "<cmd> DapStepInto <CR>", "debug step into" },
    j = { "<cmd> DapStepOver <CR>", "debug step over" },
    o = { "<cmd> DapStepOut <CR>", "debug step out" },
  },

  g = {
    name = "golang",
    t = { ":GoAddTag<CR>", "add tags" },
    j = { ":GoAddTag json<CR>", "add json tags" },
    b = { ":GoAddTag bson<CR>", "add bson tags" },
    y = { ":GoAddTag yaml<CR>", "add yaml tags" },
    d = { ":GoAddTag bindings<CR>", "add bindings tags" },
    x = { ":GoRmTag<CR>", "remove tags" },
    e = { ":GoIfErr<CR>", "add error check" },
    f = { ":GoFixPlurals<CR>", "fix func args" }, -- change func foo(b int, a int, r int) -> func foo(b, a, r int)
    r = { ":GoRun ./cmd<CR>", "run code" },
    s = { ":GoStop<CR>", "stop running code" },
    g = { ":GoModTidy<CR>", "mod tidy" },
    v = { ":GoModVendor<CR>", "mod vendor" },
    i = { ":GoImpl<CR>", "implement struct" },
  },

  t = {
    name = "typescript",
    o = { ':TSToolsOrganizeImports<CR>', "organize imports" },
  },

  v = {
    name = "tests",
    n = { ':lua require("neotest").run.run()<CR>', "test nearest" },
    a = { ':lua require("neotest").run.attach()<CR>', "attach nearest" },
    s = { ':lua require("neotest").run.stop()<CR>', "stop nearest" },
    c = { ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "test current file" },
    d = { ':lua require("neotest").run.run({strategy = "dap"})<CR>', "test nearest with debugger" },

    g = {
      name = "go test",
      n = { ':lua require("dap-go").debug_test()<CR>', "test nearest" },
      l = { ':lua require("dap-go").debug_last()<CR>', "test last" },
    }
  },

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


  l = {
    name = "lsp",
    i = { ":LspInfo<CR>", "lsp info" },
    h = { ":Lspsaga hover_doc <CR>", "hover doc" }, -- most used 1
    a = { ":CodeActionMenu<CR>", "code action" },   -- most used 2
    o = { ":Lspsaga outline <CR>", "outline" },
    r = { ":LspRestart<CR>", "restart lsp" },

    d = {
      name = "diagnostics",
      d = { ":Lspsaga show_buf_diagnostics <CR>", "buf diagnostics" }, -- most used
      w = { ":Lspsaga show_workspace_diagnostics <CR>", "workspace diagnostics" },
      l = { ":Lspsaga show_line_diagnostics <CR>", "line diagnostics" },
      j = { ":Lspsaga diagnostic_jump_next <CR>", "next diagnostic" },
      k = { ":Lspsaga diagnostic_jump_prev <CR>", "prev diagnostic" },
      c = { ":Lspsaga show_cursor_diagnostics <CR>", "cursor diagnostics" },
    },

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
  },
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
vim.api.nvim_set_keymap("n", "<A-c>", "gcc", { silent = true, noremap = false })
vim.api.nvim_set_keymap("v", "<A-c>", "gcc", { silent = true, noremap = false })

-- which key mappings:
local ok, wk = pcall(require, "which-key")
if ok then
  local which_key_opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
    expr = false,   -- use `expr` when creating keymaps
  }
  wk.register(which_keymaps, which_key_opts)
end
