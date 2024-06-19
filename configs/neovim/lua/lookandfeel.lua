-- WHICHKEY
local wk = require("which-key")
wk.setup {
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

-- STATUSLINE
require('lualine').setup()


-- STARTUP
local db = require('dashboard')
db.custom_header = {
  '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
}
db.custom_center = {
  { desc = ' ' }
}
db.custom_footer = {
  ' ',
}


-- TREE
require("nvim-tree").setup()

wk.register({
    t = {
        name = "Tree",
        t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
        f = { "<cmd>NvimTreeFindFile<cr>", "Find file" },
    }
}, { prefix = "<leader>" })

-- GIT SIGNS
require('gitsigns').setup()
