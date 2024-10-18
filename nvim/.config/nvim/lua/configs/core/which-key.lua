local which_keymaps = {
  -- NOTE: File Explorer
  { "<leader>e", ":NvimTreeToggle<CR>", icon = "  ", desc = "[F]ile" },
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
  {
    "<leader>nc",
    ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
    icon = "󰢪 ",
    desc = "[C]urrent File Test",
  },
  { "<leader>nd", ':lua require("neotest").run.run({strategy = "dap"})<CR>', icon = " ", desc = "[D]ebugger Test" },
  { "<leader>ng", group = "[G]o Tests", icon = " " },
  { "<leader>ngn", ':lua require("dap-go").debug_test()<CR>', icon = "󰊹 ", desc = "[G]o [N]earest Test" },
  { "<leader>ngl", ':lua require("dap-go").debug_last()<CR>', icon = "󰎔 ", desc = "[G]o [L]ast Test" },

  -- NOTE: Telescope Search
  { "<leader>s", group = "[S]earch", icon = " " },
  {
    "<leader>ss",
    ":Telescope find_files hidden=true no_ignore=false color=always<CR>",
    icon = "󰥨 ",
    desc = "[S]earch Files",
  },
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
  {
    "<leader>fc",
    ":lua require('nvim-treesitter-dart-data-class').generate()<CR>",
    icon = " ",
    desc = "Data [C]lass Generator",
  },
  { "<leader>fb", ":FlutterCreateBloc<CR>", icon = " ", desc = "Create [B]loc" },

  { "<leader>fp", group = "[F]lutter [P]ubspec", icon = " " },
  { "<leader>fpa", ":PubspecAssistAddPackage<CR>", icon = " ", desc = "[A]dd Package" },
  { "<leader>fpd", ":PubspecAssistAddDevPackage<CR>", icon = " ", desc = "Add [D]ev Package" },
  { "<leader>fpp", ":PubspecAssistPickVersion<CR>", icon = " ", desc = "[P]ick Version" },
}

return {
  spec = which_keymaps,
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = " ",
    ellipsis = "...",
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󱞦 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󱞦 ",
      BS = "󰁮 ",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫 ",
      F2 = "󱊬 ",
      F3 = "󱊭 ",
      F4 = "󱊮 ",
      F5 = "󱊯 ",
      F6 = "󱊰 ",
      F7 = "󱊱 ",
      F8 = "󱊲 ",
      F9 = "󱊳 ",
      F10 = "󱊴 ",
      F11 = "󱊵 ",
      F12 = "󱊶 ",
    },
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  win = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
    wo = {
      winblend = 0,
    },
  },
}
