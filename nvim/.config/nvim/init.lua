-------
-------
-------

require "dope.spec"
require "dope.options"
require "dope.autocmds"
require("dope.keymaps").setup()

spec "dope.theme.onedark"
spec "dope.core.notify"
-- spec "dope.theme.catppuccin"

spec "dope.core.whichkey"
spec "dope.core.dashboard"
spec "dope.core.windline"
spec "dope.core.noice"
spec "dope.core.devicons"
spec "dope.core.neotree"
spec "dope.core.telescope"
spec "dope.core.tmuxnavigator"

spec "dope.lsps.mason"
spec "dope.lsps.mason_null_ls"
spec "dope.lsps.mason_lspconfig"
spec "dope.lsps.none-ls"

spec "dope.lsps.treesitter"
spec "dope.lsps.schemastore"
spec "dope.lsps.lspconfig"
spec "dope.lsps.lspsaga"
spec "dope.lsps.comments"
spec "dope.lsps.cmp"
-- spec "dope.lsps.dap"
-- spec "dope.lsps.go"
-- spec "dope.lsps.tests"

-- spec "dope.lsps.flutter"

spec "dope.lsps.surround"
spec "dope.lsps.autopairs"
spec "dope.lsps.autotags"

-- spec "dope.xtra.neogit"
spec "dope.xtra.wakatime"
-- spec "dope.xtra.harpoon"
spec "dope.xtra.codeium"
spec "dope.xtra.ufo"
-- spec "dope.xtra.supermaven"

-- spec "dope.xtra.markview"
-- spec "dope.xtra.obsidian"
spec "dope.xtra.bufferline"
spec "dope.xtra.gitsigns"
spec "dope.xtra.miniai"
-- spec "dope.xtra.tabnine"
-- spec "dope.xtra.modicator"
spec "dope.xtra.hlchunk"
spec "dope.xtra.illuminate"
-- spec "dope.xtra.yazi"
spec "dope.xtra.colorizer"
spec "dope.core.luarocks"
spec "dope.xtra.img-clip"
spec "dope.xtra.image"
spec "dope.xtra.maximizer"
-- spec "dope.xtra.lab"
-- spec "dope.xtra.dadbod"
-- spec "dope.xtra.cellular-automaton"
-- spec "dope.xtra.flash"
-- spec "dope.xtra.zenmode"
-- spec "dope.xtra.twilight"
-- spec "dope.xtra.dropbar"

require "dope.lazy"
