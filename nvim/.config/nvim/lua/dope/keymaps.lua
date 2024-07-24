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
    ["<C-s>"] = { ":w<CR>", "save buffer" }, -- save buffers
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

    ["<A-a>"] = { ":MaximizerToggle<CR>", "maximize / restore window" },
    ["<A-z>"] = { ":ZenMode<CR>", "toggle zen mode" },
    ["<A-t>"] = { ":TroubleToggle<CR>", "toggle trouble" },
    ["<A-P>"] = { "<CMD>BufferLineTogglePin<CR>", "toggle pin current buffer" },
    ["<A-m>"] = { ":MarkdownPreviewToggle<CR>", "toggle markdown preview" },
    ["<A-c>"] = { "gcc", "toggle comment" },
    ["<A-o>"] = { ":Lspsaga outline<CR>LLLLL", "toggle lsp outline" },
    ["<A-u>"] = { ":DBUIToggle<CR>", "toggle database ui" },
    ["<A-w>"] = { ":BufferLineCloseOthers<CR>", "close other buffers" },
    ["<A-p>"] = { ":lua vim.lsp.buf.format({timeout_ms = 3000})<CR>", "format without saving" },

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

    ["<C-s>"] = { "<ESC>:w<CR>i<Right>", "save buffer" }, -- save buffer
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
  { "<leader>gj", ":GoAddTag json<CR>", icon = " ", desc = "[J]son Tags" },
  { "<leader>gb", ":GoAddTag bson<CR>", icon = "󰨥 ", desc = "[B]son Tags" },
  { "<leader>gy", ":GoAddTag yaml<CR>", icon = " ", desc = "[Y]aml Tags" },
  { "<leader>gd", ":GoAddTag bindings<CR>", icon = " ", desc = "[D]ata Bindings" },
  { "<leader>gx", ":GoRmTag<CR>", icon = "󱈠 ", desc = "[X]Remove Tags" },
  { "<leader>ge", ":GoIfErr<CR>", icon = " ", desc = "[E]rror Check" },
  { "<leader>gf", ":GoFixPlurals<CR>", icon = "󰁨 ", desc = "[F]ix Plurals" },
  { "<leader>gr", ":GoRun ./cmd<CR>", icon = " ", desc = "[R]un Code" },
  { "<leader>gs", ":GoStop<CR>", icon = " ", desc = "[S]top Code" },
  { "<leader>gg", ":GoModTidy<CR>", icon = "󰿞 ", desc = "[G]o Mod Tidy" },
  { "<leader>gv", ":GoModVendor<CR>", icon = "󰕳 ", desc = "[V]endor Mod" },
  { "<leader>gi", ":GoImpl<CR>", icon = "󰰃 ", desc = "[I]plement Interface" },

  -- NOTE: Tests
  { "<leader>v", group = "[V] Tests", icon = "󰙨" },
  { "<leader>vn", ':lua require("neotest").run.run()<CR>', icon = "󰊹 ", desc = "[N]earest Test" },
  { "<leader>va", ':lua require("neotest").run.attach()<CR>', icon = " ", desc = "[A]ttach Test" },
  { "<leader>vs", ':lua require("neotest").run.stop()<CR>', icon = "  ", desc = "[S]top Test" },
  { "<leader>vc", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', icon = "󰢪 ", desc = "[C]urrent File Test" },
  { "<leader>vd", ':lua require("neotest").run.run({strategy = "dap"})<CR>', icon = " ", desc = "[D]ebugger Test" },
  { "<leader>vg", group = "go test", icon = " " },
  { "<leader>vgn", ':lua require("dap-go").debug_test()<CR>', icon = "󰊹 ", desc = "[G]o [N]earest Test" },
  { "<leader>vgl", ':lua require("dap-go").debug_last()<CR>', icon = "󰎔 ", desc = "[G]o [L]ast Test" },

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

  -- NOTE: LSP
  { "<leader>l", group = "[L]SP", icon = "  " },
  { "<leader>li", ":LspInfo<CR>", icon = " ", desc = "[I]nfo" },
  { "<leader>lr", ":LspRestart<CR>", icon = " ", desc = "[R]estart" },

  { "<leader>ld", group = "[D]iagnostic", icon = " " },
  { "<leader>ldd", ":Lspsaga show_buf_diagnostics<CR>", icon = " ", desc = "[B]uf" },
  { "<leader>ldw", ":Lspsaga show_workspace_diagnostics<CR>", icon = " ", desc = "[W]orkspace" },
  { "<leader>ldl", ":Lspsaga show_line_diagnostics<CR>", icon = " ", desc = "[L]ine" },
  { "<leader>ldj", ":Lspsaga diagnostic_jump_next<CR>", icon = " ", desc = "[J]ump" },
  { "<leader>ldk", ":Lspsaga diagnostic_jump_prev<CR>", icon = " ", desc = "[K]Prev" },
  { "<leader>ldc", ":Lspsaga show_cursor_diagnostics<CR>", icon = " ", desc = "[C]ursor" },

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
}

return M
