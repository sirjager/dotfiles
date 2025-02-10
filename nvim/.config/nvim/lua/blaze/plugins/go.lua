local M = {
  "ray-x/go.nvim",
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}

M.opts = function()
  -- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  return {
    -- lsp_cfg = { capabilities = capabilities },
    disable_defaults = false,
    go = "go",
    goimports = "goimports_reviser", -- gopls
    fillstruct = false,
    gofmt = "golines", -- golines (for max line length)
    max_line_len = 1000,
    tag_transform = "camelcase", -- snakecase
    tag_options = "json=omitempty", -- sets options sent to gomodifytags, i.e., json=omitempty
    gotests_template = "", -- sets gotests -template parameter (check gotests for details)
    gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
    comment_placeholder = "󰟓 ", -- comment_placeholder your cool placeholder e.g. 󰟓       
    icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
    verbose = false, -- output loginf in messages
    -- false: do nothing
    -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
    --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
    --      when lsp_cfg is true
    -- if lsp_on_attach is a function: use this function as on_attach function for gopls
    lsp_keymaps = false, -- set to false to disable gopls/lsp keymap
    lsp_codelens = false, -- set to false to disable codelens, true by default, you can use a function
    -- function(bufnr)
    --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
    -- end
    -- to setup a table of codelens
    diagnostic = { -- set diagnostic to false to disable vim.diagnostic setup
      hdlr = true, -- hook lsp diag handler and send diag to quickfix
      underline = true,
      -- virtual text setup
      virtual_text = { spacing = 0, prefix = "■" },
      signs = true,
      update_in_insert = true,
    },
    lsp_document_formatting = true,
    lsp_inlay_hints = {
      enable = false,
      -- Only show inlay hints for the current line
      only_current_line = true,
      only_current_line_autocmd = "CursorHold",
      -- whether to show variable name before type hints with the inlay hints or not
      -- default: false
      show_variable_name = false,
      -- prefix for parameter hints
      parameter_hints_prefix = "󰊕 ",
      show_parameter_hints = false,
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 1,
      -- The color of the hints
      highlight = "Comment",
    },
    gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
    gopls_remote_auto = true, -- add -remote=auto to gopls
    gocoverage_sign = "█",
    sign_priority = 5, -- change to a higher number to override other signs
    dap_debug = true, -- set to false to disable dap
    dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
    -- false: do not use keymap in go/dap.lua.  you must define your own.
    -- Windows: Use Visual Studio keymap
    dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
    dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable
    dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pick up a random port
    dap_timeout = 10, --  see dap option initialize_timeout_sec = 15,
    dap_retries = 2, -- see dap option max_retries
    build_tags = "tag1,tag2", -- set default build tags
    textobjects = true, -- enable default text jobects through treesittter-text-objects
    test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
    verbose_tests = false, -- set to add verbose flag to tests deprecated, see '-v' option
    run_in_floaterm = false, -- set to true to run in a float window. :GoTermClose closes the floatterm
    -- float term recommend if you use richgo/ginkgo with terminal color
    floaterm = { -- position
      posititon = "auto", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
      width = 0.45, -- width of float window if not auto
      height = 0.98, -- height of float window if not auto
      title_colors = "nord", -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
      -- can also set to a list of colors to define colors to choose from
      -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
    },
    trouble = true, -- true: use trouble to open quickfix
    test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
    luasnip = true, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
    --  Do not enable this if you already added the path, that will duplicate the entries
    iferr_vertical_shift = 2, -- defines where the cursor will end up vertically from the begining of if err statement
    settings = require("blaze.plugins.servers.gopls").settings,
  }
end

M.config = function(_, opts)
  require("dap-go").setup {}
  require("go").setup(opts)
end

return M
