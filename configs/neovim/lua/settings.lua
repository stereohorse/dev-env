local opt = vim.opt
local cmd = vim.cmd

opt.colorcolumn = '80'
opt.cursorline = true
opt.undofile = true
opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
cmd[[colorscheme dracula]]

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
