-- require "user"

require "dope.spec"
require "dope.options"
require("dope.keymaps").setup()
spec("dope.core.notify")

spec "dope.theme"
spec "dope.core.alpha"
spec "dope.core.windline"
spec "dope.core.bufferline"
spec "dope.core.whichkey"

spec "dope.core.devicons"
spec "dope.core.neotree"
spec "dope.core.illuminate"
spec "dope.core.telescope"
spec "dope.core.tmuxnavigator"
-- spec "dope.core.yazi"

spec "dope.lsps.treesitter"
spec "dope.lsps.mason"
spec "dope.lsps.schemastore"
spec "dope.lsps.lspconfig"
spec "dope.lsps.lspsaga"
spec "dope.lsps.none-ls"
spec "dope.lsps.comments"
spec "dope.lsps.cmp"
spec "dope.lsps.go"

spec "dope.core.noice"
spec "dope.core.gitsigns"
spec "dope.lsps.ufo"

spec "dope.lsps.surround"
spec "dope.lsps.autopairs"
spec "dope.lsps.autotags"

spec "dope.core.obsidian"

spec "dope.xtra.harpoon"
spec "dope.xtra.codeium"
spec "dope.xtra.tabnine"
spec "dope.xtra.modicator"
spec "dope.xtra.hlchunk"
spec "dope.xtra.indentline"
spec "dope.xtra.wakatime"
-- spec "dope.xtra.flash"
-- spec "dope.xtra.zenmode"
-- spec "dope.xtra.twilight"

require "dope.lazy"
