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

-- TERMINAL
require("toggleterm").setup()

wk.register({
    e = {
        name = "Terminal",
        t = { "<cmd>ToggleTermToggleAll<cr>", "Toggle" },
    }
}, { prefix = "<leader>" })

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- OIL
require("oil").setup({
    delete_to_trash = true,
})

