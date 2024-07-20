local M = {}

-- nothing to do here
-- call setup from where keymaps.lua is being loaded
M.setup = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  for mode, mappings in pairs(M.keymaps) do
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
end

M.keymaps = {
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
    ["<S-k>"] = { ":resize -2<CR>", "decrease window height" },
    ["<S-j>"] = { ":resize +2<CR>", "increase window height" },

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
    ["<A-z>"] = { ":ZenMode<CR>", "toggle zen mode" },
    ["<A-t>"] = { ":TroubleToggle<CR>", "toggle trouble" },
    ["<A-P>"] = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin current buffer" },
    ["<A-m>"] = { ":MarkdownPreviewToggle<CR>", "toggle markdown preview" },
    ["<A-c>"] = { "gcc", "toggle comment" },
    ["<A-y>"] = { ":lua Toggle_WrapLines()<CR>", "toggle wrap lines" },
    ["<A-o>"] = { ":Lspsaga outline<CR>LLLLL", "toggle lsp outline" },
    ["<A-u>"] = { ":NvimTreeClose<CR> :DBUIToggle<CR>", "toggle database ui" },
    ["<A-w>"] = { ":BufferLineCloseOthers<CR>", "close other buffers" },
    ["<A-p>"] = { ":lua vim.lsp.buf.format({timeout_ms = 10000})<CR>", "format without saving" },
    ["<A-x>"] = { ":PickColor<CR>", "color picker" },
    ["<A-v>"] = { ":lua require'ufo'.openAllFolds()<CR>", "open all folds" },
    ["<A-b>"] = { ":lua require'ufo'.closeAllFolds()<CR>", "close all folds" },
    ["<A-n>"] = { ":Lspsaga term_toggle<CR>", "toggle term" },
    ["<A-r>"] = { ":Lspsaga rename<CR>", "smart rename" },
    ["<A-i>"] = { ":Lspsaga hover_doc<CR>", "toggle doc" },
    ["<A-e>"] = { ":Lspsaga peek_definition<CR>", "toggle peek definition" },
    ["<A-d>"] = { ":Lspsaga goto_definition<CR>", "goto definition" },
    ["<A-f>"] = { ":Lspsaga code_action<CR>", "code action" },

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

M.which_keymaps = {
  -- NOTE: File Explorer
  { "<leader>e", ":Neotree toggle<CR>", mode = "n", desc = "toggle file explorer" },

  -- NOTE: Obsidian
  { "<leader>o", group = "obsidian", desc = "obsidian" },
  { "<leader>od", "<CMD>ObsidianFollowLink<CR>", desc = "follow link" },
  { "<leader>ot", "<CMD>ObsidianTags<CR>", desc = "list tags" },
  { "<leader>oo", "<CMD>ObsidianQuickSwitch<CR>", desc = "switch markdown" },
  { "<leader>ol", "<CMD>ObsidianBackLink<CR>", desc = "list links" },
  { "<leader>os", "<CMD>ObsidianSearch<CR>", desc = "search markdown" },
  { "<leader>ob", ":lua require'obsidian'.util.toggle_checkbox()<CR>", desc = "toggle checkbox" },
  { "<leader>oa", ":lua require'obsidian'.util.smart_action()<CR>", desc = "smart action" },

  -- NOTE: Debugging
  { "<leader>d", group = "debugging", desc = "debugging" },
  { "<leader>du", "<CMD>DapUiToggle<CR>", desc = "toggle dap ui" },
  { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "toggle breakpoint" },
  { "<leader>dc", "<cmd>DapContinue<CR>", desc = "debug continue" },
  { "<leader>dt", "<cmd>DapTerminate<CR>", desc = "debug terminate" },
  { "<leader>dl", "<cmd>DapShowLog<CR>", desc = "debug show log" },
  { "<leader>di", "<cmd>DapStepInto<CR>", desc = "debug step into" },
  { "<leader>dj", "<cmd>DapStepOver<CR>", desc = "debug step over" },
  { "<leader>do", "<cmd>DapStepOut<CR>", desc = "debug step out" },

  -- NOTE: Golang
  { "<leader>g", group = "golang", desc = "golang" },
  { "<leader>gt", ":GoAddTag<CR>", desc = "add tags" },
  { "<leader>gj", ":GoAddTag json<CR>", desc = "add json tags" },
  { "<leader>gb", ":GoAddTag bson<CR>", desc = "add bson tags" },
  { "<leader>gy", ":GoAddTag yaml<CR>", desc = "add yaml tags" },
  { "<leader>gd", ":GoAddTag bindings<CR>", desc = "add bindings tags" },
  { "<leader>gx", ":GoRmTag<CR>", desc = "remove tags" },
  { "<leader>ge", ":GoIfErr<CR>", desc = "add error check" },
  { "<leader>gf", ":GoFixPlurals<CR>", desc = "fix func args" },
  { "<leader>gr", ":GoRun ./cmd<CR>", desc = "run code" },
  { "<leader>gs", ":GoStop<CR>", desc = "stop running code" },
  { "<leader>gg", ":GoModTidy<CR>", desc = "mod tidy" },
  { "<leader>gv", ":GoModVendor<CR>", desc = "mod vendor" },
  { "<leader>gi", ":GoImpl<CR>", desc = "implement struct" },

  -- NOTE: Tests
  { "<leader>v", group = "tests", desc = "tests" },
  { "<leader>vn", ':lua require("neotest").run.run()<CR>', desc = "test nearest" },
  { "<leader>va", ':lua require("neotest").run.attach()<CR>', desc = "attach nearest" },
  { "<leader>vs", ':lua require("neotest").run.stop()<CR>', desc = "stop nearest" },
  { "<leader>vc", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = "test current file" },
  { "<leader>vd", ':lua require("neotest").run.run({strategy = "dap"})<CR>', desc = "test nearest with debugger" },
  { "<leader>vg", group = "go test", desc = "go test" },
  { "<leader>vgn", ':lua require("dap-go").debug_test()<CR>', desc = "test nearest" },
  { "<leader>vgl", ':lua require("dap-go").debug_last()<CR>', desc = "test last" },

  -- NOTE: Telescope
  { "<leader>s", group = "telescope", desc = "search" },
  { "<leader>ss", ":Telescope find_files hidden=true no_ignore=false color=always<CR>", desc = "find files" },
  { "<leader>sb", ":Telescope buffers<CR>", desc = "opened buffers" },
  { "<leader>se", ":Telescope emoji<CR>", desc = "find emoji" },
  { "<leader>sW", ":Telescope live_grep<CR>", desc = "find in workspace" },
  { "<leader>so", ":Telescope oldfiles<CR>", desc = "recent files" },
  { "<leader>sp", ":Telescope project<CR>", desc = "open project" },
  { "<leader>sr", ":Telescope resume<CR>", desc = "resume search" },
  { "<leader>sw", ":Telescope current_buffer_fuzzy_find<CR>", desc = "find in buffer" },
  { "<leader>sh", ":Telescope help_tags<CR>", desc = "help tags" },
  { "<leader>sk", ":Telescope keymaps<CR>", desc = "key bindings" },
  { "<leader>sc", ":Telescope colorscheme<CR>", desc = "color schemes" },
  { "<leader>sa", ":Telescope autocommands<CR>", desc = "auto commands" },
  { "<leader>sC", ":Telescope commands<CR>", desc = "list commands" },

  -- NOTE: LSP
  { "<leader>l", group = "lsp", desc = "lsp" },
  { "<leader>li", ":LspInfo<CR>", desc = "lsp info" },
  { "<leader>lr", ":LspRestart<CR>", desc = "restart lsp" },
  { "<leader>ld", group = "diagnostics", desc = "diagnostics" },
  { "<leader>ldd", ":Lspsaga show_buf_diagnostics<CR>", desc = "buf diagnostics" },
  { "<leader>ldw", ":Lspsaga show_workspace_diagnostics<CR>", desc = "workspace diagnostics" },
  { "<leader>ldl", ":Lspsaga show_line_diagnostics<CR>", desc = "line diagnostics" },
  { "<leader>ldj", ":Lspsaga diagnostic_jump_next<CR>", desc = "next diagnostic" },
  { "<leader>ldk", ":Lspsaga diagnostic_jump_prev<CR>", desc = "prev diagnostic" },
  { "<leader>ldc", ":Lspsaga show_cursor_diagnostics<CR>", desc = "cursor diagnostics" },

  -- NOTE: Tools
  { "<leader>t", group = "tools", desc = "xtra tools" },
  { "<leader>to", ":TSToolsOrganizeImports<CR>", desc = "organize imports" },
  { "<leader>tls", ":LiveServer<CR>", desc = "live server" },
  { "<leader>tli", ":LiveServerInstall<CR>", desc = "live server install" },
  { "<leader>tlr", ":LiveServerStart<CR>", desc = "run live server" },
  { "<leader>tlp", ":LiveServerStop<CR>", desc = "stop live server" },
}

return M
