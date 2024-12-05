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
    ["<Esc>"] = { ":noh <CR>", "clear highlights" },
    ["q"] = { "<ESC><ESC>:noh<CR>", "clear highlights" }, -- disabling maro recording
    ["w"] = { "<ESC>ve", "select word to right" },
    ["b"] = { "<ESC>vb", "select word to left" },

    ["W"] = { [[<ESC>:execute "normal! v" .. (col('$') - col('.')) .. 'l'<CR>]], "select words till end of line" },
    ["B"] = { [[:execute "normal! v" .. (col('.') - 1) .. 'h'<CR>]], "select words till start of line" },

    ["<C-a>"] = { "gg<S-v>G", "select all" }, -- select all text in current buffer
    ["<C-s>"] = { "<ESC><ESC>:w<CR>", "save buffer" }, -- save buffers
    ["<C-w>"] = { ":bd<CR>", "close buffer" }, -- close buffers
    ["<C-n>"] = { "<CMD>enew<CR>", "new buffer" }, -- new buffer

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
    ["<A-1>"] = { "<CMD>BufferLineGoToBuffer 1<CR>", "go to 1 buffer" },
    ["<A-2>"] = { "<CMD>BufferLineGoToBuffer 2<CR>", "go to 2 buffer" },
    ["<A-3>"] = { "<CMD>BufferLineGoToBuffer 3<CR>", "go to 3 buffer" },
    ["<A-4>"] = { "<CMD>BufferLineGoToBuffer 4<CR>", "go to 4 buffer" },
    ["<A-5>"] = { "<CMD>BufferLineGoToBuffer 5<CR>", "go to 5 buffer" },
    ["<A-6>"] = { "<CMD>BufferLineGoToBuffer 6<CR>", "go to 6 buffer" },
    ["<A-7>"] = { "<CMD>BufferLineGoToBuffer 7<CR>", "go to 7 buffer" },
    ["<A-8>"] = { "<CMD>BufferLineGoToBuffer 8<CR>", "go to 8 buffer" },
    ["<A-9>"] = { "<CMD>BufferLineGoToBuffer 9<CR>", "go to 9 buffer" },
    ["<A-0>"] = { "<CMD>BufferLineGoToBuffer 10<CR>", "go to 10 buffer" },

    ["<A-a>"] = { ":Maximize<CR>", "maximize / restore window" },
    ["<A-z>"] = { ":ZenMode<CR>", "toggle zen mode" },
    ["<A-t>"] = { ":TroubleToggle<CR>", "toggle trouble" },
    ["<A-P>"] = { "<CMD>BufferLineTogglePin<CR>", "toggle pin current buffer" },
    ["<A-m>"] = { ":MarkdownPreviewToggle<CR>", "toggle markdown preview" },
    ["<A-c>"] = { "gcc", "toggle comment" },
    ["<A-o>"] = { ":Lspsaga outline<CR>LLLLL", "toggle lsp outline" },
    -- ["<A-u>"] = { ":BufferLinePick<CR>", "focus any active buffers" },
    ["<A-u>"] = { ":DBUIToggle<CR>", "DB UI Toggle" },
    ["<A-w>"] = { ":BufferLineCloseOthers<CR>", "close other buffers" },
    ["<A-p>"] = { ":lua vim.lsp.buf.format({timeout_ms = 10000})<CR>", "format without saving" },

    ["<A-v>"] = { ":lua require'ufo'.openAllFolds()<CR>", "open all folds" },
    ["<A-b>"] = { ":lua require'ufo'.closeAllFolds()<CR>", "close all folds" },

    ["<A-r>"] = { ":Lspsaga rename<CR>", "smart rename" },
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

M.which_keymaps = {
  -- NOTE: File Explorer
  { "<leader>e", ":Neotree toggle<CR>", icon = "  ", desc = "[F]ile" },
  { "<leader>v", "<CMD>PasteImage<CR>", icon = " ", desc = "[V]Paste Image" },

  -- NOTE: Obsidian
  { "<leader>o", group = "[O]bsidian", icon = "󰮋 " },
  { "<leader>od", "<CMD>ObsidianFollowLink<CR>", icon = " ", desc = "[F]llow Link" },
  { "<leader>ot", "<CMD>ObsidianTags<CR>", icon = " ", desc = "[T]ags List" },
  { "<leader>oo", "<CMD>ObsidianQuickSwitch<CR>", icon = " ", desc = "[O]pen Markdown" },
  { "<leader>ob", "<CMD>ObsidianBacklinks<CR>", icon = "󰿨 ", desc = "[B]ack Links" },
  { "<leader>ol", "<CMD>ObsidianLinks<CR>", icon = "󰿨 ", desc = "[L]inks List" },
  { "<leader>os", "<CMD>ObsidianSearch<CR>", icon = "󱎸 ", desc = "[S]earch Markdown" },
  { "<leader>oc", ":lua require'obsidian'.util.toggle_checkbox()<CR>", icon = " ", desc = "[C]heck Box" },
  { "<leader>oa", ":lua require'obsidian'.util.smart_action()<CR>", icon = " ", desc = "[A]ction Smart" },
  { "<leader>ov", "<CMD>ObsidianDebug<CR>", icon = " ", desc = "[V]erbose Obisidian" },

  -- NOTE: Git Neogit
  { "<leader>i", group = "Neo G[I]t", icon = " " },
  { "<leader>id", "<CMD>Neogit diff<CR>", icon = " ", desc = "[D]iff View" },

  -- NOTE: Debugging
  { "<leader>d", group = "[D]ebugging", icon = " " },
  { "<leader>du", "<CMD>DapUiToggle<CR>", icon = " ", desc = "[U]i Toggle" },
  { "<leader>db", "<CMD>DapToggleBreakpoint<CR>", icon = "", desc = "[B]reakpoint" },
  { "<leader>dc", "<CMD>DapContinue<CR>", icon = " ", desc = "[C]ontinue Debug" },
  { "<leader>dt", "<CMD>DapTerminate<CR>", icon = " ", desc = "[T]erminate Debug" },
  { "<leader>dl", "<CMD>DapShowLog<CR>", icon = "󱂅 ", desc = "[L]og Debug" },
  { "<leader>di", "<CMD>DapStepInto<CR>", icon = "󰶡", desc = "[I]nto Step" },
  { "<leader>dj", "<CMD>DapStepOver<CR>", icon = "󰔰 ", desc = "[J]ump Step" },
  { "<leader>do", "<CMD>DapStepOut<CR>", icon = "󰶣 ", desc = "[O]ut Step" },

  -- NOTE: Golang
  { "<leader>g", group = "[G]olang", icon = " " },
  { "<leader>gt", ":GoAddTag<CR>", icon = "󰜢 ", desc = "[T]ags Add" },
  { "<leader>gj", ":GoAddTag json -transform camelcase<CR>", icon = " ", desc = "[J]son Tags" },
  { "<leader>gb", ":GoAddTag bson -transform camelcase<CR>", icon = "󰨥 ", desc = "[B]son Tags" },
  { "<leader>gy", ":GoAddTag yaml -transform camelcase<CR>", icon = " ", desc = "[Y]aml Tags" },
  { "<leader>gd", ":GoAddTag validate<CR>", icon = " ", desc = "[D]ata Validate" },
  { "<leader>gx", ":GoRmTag<CR>", icon = "󱈠 ", desc = "[X]Remove Tags" },
  { "<leader>ge", ":GoIfErr<CR>", icon = " ", desc = "[E]rror Check" },
  { "<leader>gf", ":GoFixPlurals<CR>", icon = "󰁨 ", desc = "[F]ix Plurals" },
  { "<leader>gr", ":GoRun ./cmd<CR>", icon = " ", desc = "[R]un Code" },
  { "<leader>gs", ":GoStop<CR>", icon = " ", desc = "[S]top Code" },
  { "<leader>gg", ":GoModTidy<CR>", icon = "󰿞 ", desc = "[G]o Mod Tidy" },
  { "<leader>gv", ":GoModVendor<CR>", icon = "󰕳 ", desc = "[V]endor Mod" },
  { "<leader>gi", ":GoImpl<CR>", icon = "󰰃 ", desc = "[I]plement Interface" },
  { "<leader>gl", ":GoToggleInlay<CR>", icon = "󰰃 ", desc = "In[L]ay Toggle" },

  -- NOTE: Neo Tests
  { "<leader>n", group = "[N]eo Tests", icon = "󰙨" },
  { "<leader>np", ":Neotest summary<CR>", icon = "󰊹 ", desc = "[P]anel Summary" },
  { "<leader>nn", ':lua require("neotest").run.run()<CR>', icon = "󰊹 ", desc = "[N]earest Test" },
  { "<leader>na", ':lua require("neotest").run.attach()<CR>', icon = " ", desc = "[A]ttach Test" },
  { "<leader>nx", ':lua require("neotest").run.stop()<CR>', icon = "  ", desc = "[X]top Test" },
  { "<leader>nc", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', icon = "󰢪 ", desc = "[C]urrent File Test" },
  { "<leader>nd", ':lua require("neotest").run.run({strategy = "dap"})<CR>', icon = " ", desc = "[D]ebugger Test" },
  { "<leader>ng", group = "[G]o Tests", icon = " " },
  { "<leader>ngn", ':lua require("dap-go").debug_test()<CR>', icon = "󰊹 ", desc = "[G]o [N]earest Test" },
  { "<leader>ngl", ':lua require("dap-go").debug_last()<CR>', icon = "󰎔 ", desc = "[G]o [L]ast Test" },

  -- NOTE: Telescope Search
  { "<leader>s", group = "[S]earch", icon = " " },
  { "<leader>ss", ":Telescope find_files hidden=true no_ignore=false color=always<CR>", icon = "󰥨 ", desc = "[S]earch Files" },
  { "<leader>sb", ":Telescope buffers<CR>", icon = "󱎸 ", desc = "In [B]uffer" },
  { "<leader>se", ":Telescope emoji<CR>", icon = "󱊒 ", desc = "[E]moji" },
  { "<leader>sW", ":Telescope live_grep<CR>", icon = "󰨭 ", desc = "[W]orkspace" },
  { "<leader>so", ":Telescope oldfiles<CR>", icon = " ", desc = "[O]pen Recent" },
  { "<leader>sp", ":Telescope project<CR>", icon = " ", desc = "[P]roject" },
  { "<leader>sr", ":Telescope resume<CR>", icon = " ", desc = "[R]esume" },
  { "<leader>sw", ":Telescope current_buffer_fuzzy_find<CR>", icon = " ", desc = "[w]ord" },
  { "<leader>sh", ":Telescope help_tags<CR>", icon = "󰋗 ", desc = "[H]elp" },
  { "<leader>sk", ":Telescope keymaps<CR>", icon = " ", desc = "[K]eymaps" },
  { "<leader>sc", ":Telescope colorscheme<CR>", icon = " ", desc = "[C]olorscheme" },
  { "<leader>sa", ":Telescope autocommands<CR>", icon = " ", desc = "[A]utocommands" },
  { "<leader>sC", ":Telescope commands<CR>", icon = "󰘳 ", desc = "[C]ommannds List" },

  -- NOTE: LSP & Diagnostic
  { "<leader>l", group = "[L]SP [D]iagnostic", icon = " " },
  { "<leader>lv", ":LspInfo<CR>", icon = " ", desc = "[V]erbose" },
  { "<leader>lr", ":LspRestart<CR>", icon = " ", desc = "[R]estart" },
  { "<leader>ld", ":Lspsaga show_workspace_diagnostics<CR>", icon = " ", desc = "[W]orkspace" },
  { "<leader>ll", ":Lspsaga show_buf_diagnostics<CR>", icon = " ", desc = "[B]uf" },
  { "<leader>lj", ":Lspsaga diagnostic_jump_next<CR>", icon = " ", desc = "[J]ump" },
  { "<leader>lk", ":Lspsaga diagnostic_jump_prev<CR>", icon = " ", desc = "[K]Prev" },
  { "<leader>lc", ":Lspsaga show_cursor_diagnostics<CR>", icon = " ", desc = "[C]ursor" },
  { "<leader>lo", ":lua vim.diagnostic.enable(false)<CR>", icon = " ", desc = "[O]ff" },
  { "<leader>ln", ":lua vim.diagnostic.enable(true)<CR>", icon = " ", desc = "O[N]" },
  { "<leader>li", ":Lspsaga incoming_calls<CR>", icon = " ", desc = "[I]ncoming calls" },

  -- NOTE: Tools
  { "<leader>t", group = "[T]ools", icon = " " },
  { "<leader>tto", ":TSToolsOrganizeImports<CR>", icon = "󰒺 ", desc = "[T]ypescript [O]rganize Imports" },

  { "<leader>tl", group = "[L]ab", icon = "󰤑 " },
  { "<leader>tlr", ":Lab code run<CR>", icon = " ", desc = "[R]un Code" },
  { "<leader>tls", ":Lab code stop<CR>", icon = " ", desc = "[S]top Code" },
  { "<leader>tlp", ":Lab code panel<CR>", icon = "󱗄 ", desc = "[P]anel Show" },
  { "<leader>tlc", ":Lab code config<CR>", icon = " ", desc = "[C]onfig Lab" },

  { "<leader>ts", group = "[S]erver Live", icon = " " },
  { "<leader>tsi", ":LiveServerInstall<CR>", icon = "󰏔 ", desc = "[I]nstall Server" },
  { "<leader>tsr", ":LiveServerStart<CR>", icon = " ", desc = "[R]un Live Server" },
  { "<leader>tss", ":LiveServerStop<CR>", icon = " ", desc = "[S]top Live Server" },

  { "<leader>tc", group = "[C]ellular Automaton", icon = " " },
  { "<leader>tcr", "<CMD>CellularAutomaton make_it_rain<CR>", icon = " ", desc = "[R]ain" },
  { "<leader>tcl", "<CMD>CellularAutomaton game_of_life<CR>", icon = " ", desc = "[L]ife" },
  { "<leader>tcs", "<CMD>CellularAutomaton scramble<CR>", icon = " ", desc = "[S]cramble" },

  -- NOTE: Flutter Tools : https://github.com/akinsho/flutter-tools.nvim
  { "<leader>f", group = "[F]lutter", icon = " " },
  { "<leader>fr", ":FlutterRun<CR>", icon = " ", desc = "[R]un Code" },
  { "<leader>fd", ":FlutterDevices<CR>", icon = " ", desc = "[D]evices List" },
  { "<leader>fe", ":FlutterEmulators<CR>", icon = " ", desc = "[E]mulators List" },
  { "<leader>fr", ":FlutterReload<CR>", icon = " ", desc = "[R]eload App" },
  { "<leader>ft", ":FlutterRestart<CR>", icon = " ", desc = "Re[S]tart App" },
  { "<leader>fq", ":FlutterQuit<CR>", icon = " ", desc = "[Q]uit Running Session" },
  { "<leader>fo", ":FlutterOutlineToggle<CR>", icon = " ", desc = "[O]utline Toggle" },
  { "<leader>fl", ":FlutterLspRestart<CR>", icon = " ", desc = "[L]sp Restart" },
  { "<leader>fn", ":FlutterRename<CR>", icon = " ", desc = "Re[N]ame And Update Imports" },
  { "<leader>fy", ":FlutterReanalyze<CR>", icon = " ", desc = "ReAnal[Y]ze Code" },
  { "<leader>fu", ":FlutterSupper<CR>", icon = " ", desc = "GoTo S[U]per Class" },
  { "<leader>fc", ":lua require('nvim-treesitter-dart-data-class').generate()<CR>", icon = " ", desc = "Data [C]lass Generator" },
  { "<leader>fb", ":FlutterCreateBloc<CR>", icon = " ", desc = "Create [B]loc" },

  { "<leader>fp", group = "[F]lutter [P]ubspec", icon = " " },
  { "<leader>fpa", ":PubspecAssistAddPackage<CR>", icon = " ", desc = "[A]dd Package" },
  { "<leader>fpd", ":PubspecAssistAddDevPackage<CR>", icon = " ", desc = "Add [D]ev Package" },
  { "<leader>fpp", ":PubspecAssistPickVersion<CR>", icon = " ", desc = "[P]ick Version" },
}

return M
