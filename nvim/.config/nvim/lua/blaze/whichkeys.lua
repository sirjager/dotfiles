-- stylua: ignore start
local Snacks = require("snacks")
local todo_keywords = require("blaze.plugins.comments-todo").todo_keywords()

return {
  -- { "<leader>e", "<CMD> Neotree toggle<CR>", icon = "  ", desc = "[F]ile Manager" },
  { "<leader>e",function()require("mini.files").open(vim.uv.cwd(),true)end,icon = "  ", desc = "[F]ile Manager" },
  { "<leader>v", "<CMD>PasteImage<CR>", icon = " ", desc = "[V]Paste Image" },

  -- { "<leader>m", group = "[M]acros", icon = "󰮋 " },
  -- { "<leader>mr", "qa", icon = " ", desc = "Record Macro" },
  -- { "<leader>ms", "q", icon = " ", desc = "Finish Record" },
  -- { "<leader>me", "@a", icon = " ", desc = "Execute Macro" },

  -- NOTE: Obsidian
  { "<leader>o", group = "[O]bsidian", icon = " " },
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
  { "<leader>du", ":lua require('dapui').toggle()<CR>", icon = " ", desc = "[U]i Toggle" },
  { "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", icon = "", desc = "[B]reakpoint" },
  { "<leader>dc", ":lua require('dap').continue()<CR>", icon = " ", desc = "[C]ontinue Debug" },
  { "<leader>dl", ":lua require('dap').show_log()<CR>", icon = "󱂅 ", desc = "[L]og Debug" },
  { "<leader>dq", ":lua require('dap').terminate()<CR>", icon = " ", desc = "[Q]uit Debug" },
  { "<leader>di", ":lua require('dap').step_into()<CR>", icon = "󰶡", desc = "[I]nto Step" },
  { "<leader>dj", ":lua require('dap').step_over()<CR>", icon = "󰔰 ", desc = "[J]ump Step" },
  { "<leader>do", ":lua require('dap').step_out()<CR>", icon = "󰶣 ", desc = "[O]ut Step" },

  -- NOTE: Golang
  { "<leader>g", group = "[G]olang", icon = " " },
  { "<leader>gt", ":GoAddTag ", icon = "󰜢 ", desc = "[T]ags Add" },
  { "<leader>gx", ":GoRmTag ", icon = "󱈠 ", desc = "[X]Remove Tags" },
  { "<leader>gj", ":GoAddTag json -transform camelcase<CR>", icon = " ", desc = "[J]son Tags" },
  { "<leader>gb", ":GoAddTag bson -transform camelcase<CR>", icon = "󰨥 ", desc = "[B]son Tags" },
  { "<leader>gy", ":GoAddTag yaml -transform camelcase<CR>", icon = " ", desc = "[Y]aml Tags" },
  { "<leader>gm", ":GoAddTag toml -transform camelcase<CR>", icon = " ", desc = "To[M]aml Tags" },
  { "<leader>gd", ":GoAddTag validate<CR>", icon = " ", desc = "[D]ata Validate" },
  { "<leader>ge", ":GoIfErr<CR>", icon = " ", desc = "[E]rror Check" },
  { "<leader>gf", ":GoFixPlurals<CR>", icon = "󰁨 ", desc = "[F]ix Plurals" },
  { "<leader>gr", ":GoRun ./cmd<CR>", icon = " ", desc = "[R]un Code" },
  { "<leader>gs", ":GoStop<CR>", icon = " ", desc = "[S]top Code" },
  { "<leader>gg", ":GoModTidy<CR>", icon = "󰿞 ", desc = "[G]o Mod Tidy" },
  { "<leader>gv", ":GoModVendor<CR>", icon = "󰕳 ", desc = "[V]endor Mod" },
  { "<leader>gi", ":GoImpl<CR>", icon = "󰰃 ", desc = "[I]plement Interface" },
  { "<leader>gl", ":GoToggleInlay<CR>", icon = "󰰃 ", desc = "In[L]ay Toggle" },

  { "<leader>t",function() Snacks.toggle.dim()end, icon = "󰊹 ", desc = "[T]oggle" },
  { "<leader>th", "<ESC><ESC>:noh<CR>", icon = " ", desc = "[h]ighlights" },

  -- -- Snacks Picker | Telescope replacement
  -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  {"<leader>s", group = "[S]earch", icon = " " },
  {"<leader>ss",function()Snacks.picker.files({layout="ivy",regex=true,hidden=true,dirs={vim.fn.getcwd()},})end,desc = "[s]earch files"},
  {"<leader>sr",function()Snacks.picker.resume({layout="ivy",})end,desc = "[r]esume search" },
  {"<leader>sl",function()Snacks.picker.lines()end,icon="󱎸 ", desc = "[l]ines search" },
  {"<leader>sb",function()Snacks.picker.buffers({layout="ivy",})end,icon = "󱎸 ",desc = "[b]uffers"},
  {"<leader>so",function()Snacks.picker.recent({layout="ivy"})end,icon = " ",desc = "[o]pen recent"},
  {"<leader>sw",function()Snacks.picker.grep({regex=true,hidden=true,dirs={vim.fn.getcwd()},layout = "ivy"})end, icon = "󰨭 ", desc = "grep" },
  {"<leader>sW",function()Snacks.picker.grep_word()end, icon = "󰨭 ", desc = "[W]ord grep" },
  {"<leader>sk",function()Snacks.picker.keymaps()end, icon = " ", desc = "[k]eymaps" },
  {"<leader>sg",function()Snacks.lazygit.open()end, icon = " ", desc = "Lazy[g]it" },
  {"<leader>sG",function()Snacks.lazygit.log()end, icon = " ", desc = "[G]itlog" },
  {"<leader>sm",function()Snacks.picker.marks()end, icon=" ", desc = "[m]arks" },
  {"<leader>sf",function()Snacks.picker.qflist()end,icon="󱖫 ", desc = "[f]ix list" },
  {"<leader>sp",function()Snacks.picker.projects()end,icon=" ",desc = "[p]rojects" },
  {"<leader>sc",function()Snacks.picker.colorschemes({layout="ivy"})end,icon=" ",desc = "[c]olorschemes" },
  {"<leader>sM",function()Snacks.picker.man()end,icon="󱔗 ",desc = "[m]an pages" },
  {"<leader>sR",function()Snacks.picker.registers({layout="ivy"})end, icon=" ", desc = "[R]egisters" },
  {"<leader>sj",function()Snacks.picker.jumps()end,icon="󱔕", desc = "[j]umps" },
  {"<leader>sc",function()Snacks.picker.command_history()end,icon=" ", desc = "[h]istory" },
  {"<leader>st",function()Snacks.picker.todo_comments({layout="ivy"})end,icon=" ", desc = "[t]odos" },
  {"<leader>sT",function()Snacks.picker.todo_comments({keywords=todo_keywords}) end, desc = "[T]odo comments" },
  {"<leader>si",function()Snacks.picker.icons({layout="ivy"}) end, desc = "icons emojis" },

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

  -- -- NOTE: Tools
  -- { "<leader>t", group = "[T]ools", icon = " " },
  -- { "<leader>tz", ":TSToolsOrganizeImports<CR>", icon = "󰒺 ", desc = "[T]ypescript [O]rganize Imports" },
  -- -- Tools:Lab
  -- { "<leader>tl", group = "[L]ab", icon = "󰤑 " },
  -- { "<leader>tlr", ":Lab code run<CR>", icon = " ", desc = "[R]un Code" },
  -- { "<leader>tls", ":Lab code stop<CR>", icon = " ", desc = "[S]top Code" },
  -- { "<leader>tlp", ":Lab code panel<CR>", icon = "󱗄 ", desc = "[P]anel Show" },
  -- { "<leader>tlc", ":Lab code config<CR>", icon = " ", desc = "[C]onfig Lab" },
  -- -- Tools:LiveServer
  -- { "<leader>ts", group = "[S]erver Live", icon = " " },
  -- { "<leader>tsi", ":LiveServerInstall<CR>", icon = "󰏔 ", desc = "[I]nstall Server" },
  -- { "<leader>tsr", ":LiveServerStart<CR>", icon = " ", desc = "[R]un Live Server" },
  -- { "<leader>tss", ":LiveServerStop<CR>", icon = " ", desc = "[S]top Live Server" },

  -- Flash
  { "<leader>f", group = "[F]lash", icon = " " },
  -- stylua: ignore
  {"<leader>fj",function()require("flash").jump()end,icon = " ",desc = "[J]ump To"},
  -- stylua: ignore
  {"<leader>ft",function()require("flash").treesitter()end,icon = " ",desc = "[T]reesitter"},
  -- stylua: ignore
  {"<leader>fs",function()require("flash").treesitter_search()end,icon = " ",desc = "[S]earch Treesitter"},

  -- Misc
  { "<leader>p", group = "Misc Shortcuts", icon = "暈" },
  -- stylua: ignore
  {"<leader>ps","<CMD>ToggleSpellChecker<CR>",icon = "暈",desc = function()return "Spell Checker: " .. (vim.opt.spell:get() and "Disable" or "Enable")end},
}

-- stylua: ignore end
