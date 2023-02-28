local opt = vim.opt
local cmd = vim.cmd

opt.undofile = true
opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
cmd[[colorscheme dracula]]
cmd[[let mapleader = ","]]
cmd[[syntax on]]

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
