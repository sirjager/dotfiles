return {
  -- NOTE: File Explorer
  { "<leader>e", ":Neotree toggle<CR>", icon = "  ", desc = "[F]ile" },
  -- { "<leader>e", ":lua MiniFiles.open()<CR>", icon = "  ", desc = "[F]ile" },
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
  { "<leader>t", group = "Neo Tests", icon = "󰙨" },
  { "<leader>ts", ":Neotest summary<CR>", icon = "󰊹 ", desc = "Summary" },
  { "<leader>tr", ':lua require("neotest").run.run()<CR>', icon = "󰊹 ", desc = "Run Test" },
  { "<leader>ta", ':lua require("neotest").run.attach()<CR>', icon = " ", desc = "Attach Test" },
  { "<leader>tx", ':lua require("neotest").run.stop()<CR>', icon = "  ", desc = "Stop Test" },
  {
    "<leader>tc",
    ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
    icon = "󰢪 ",
    desc = "[C]urrent File Test",
  },
  { "<leader>td", ':lua require("neotest").run.run({strategy = "dap"})<CR>', icon = " ", desc = "[D]ebugger Test" },
  { "<leader>tg", group = "[G]o Tests", icon = " " },
  { "<leader>tgn", ':lua require("dap-go").debug_test()<CR>', icon = "󰊹 ", desc = "[G]o [N]earest Test" },
  { "<leader>tgl", ':lua require("dap-go").debug_last()<CR>', icon = "󰎔 ", desc = "[G]o [L]ast Test" },

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

  { "<leader>f", group = "[F]lash", icon = " " },
  {
    "<leader>fj",
    function()
      require("flash").jump()
    end,
    icon = " ",
    desc = "[J]ump To",
  },
  {
    "<leader>ft",
    function()
      require("flash").treesitter()
    end,
    icon = " ",
    desc = "[T]reesitter",
  },
  {
    "<leader>fs",
    function()
      require("flash").treesitter_search()
    end,
    icon = " ",
    desc = "[S]earch Treesitter",
  },

  -- Misc
  { "<leader>p", group = "Misc Shortcuts", icon = "暈" },
  {
    "<leader>ps",
    function()
      vim.opt.spell = not vim.opt.spell:get()
      local status = vim.opt.spell:get() and "enabled" or "disabled"
      vim.notify("Spell Checker " .. status, vim.log.levels.INFO)
    end,
    icon = "暈",
    desc = function()
      return "Spell Checker: " .. (vim.opt.spell:get() and "Disable" or "Enable")
    end,
  },
}
