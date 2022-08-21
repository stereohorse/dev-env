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

local api = vim.api

api.nvim_set_keymap('n', '<Leader>tt',  ':NvimTreeToggle<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Leader>tf',  ':NvimTreeFocus<CR>', { noremap = true, silent = true })
