local g = vim.g
local opt = vim.opt

-----------
-- General
-----------
opt.mouse = 'a'
g.mapleader = ' '

-----------
-- UI
-----------
opt.splitright = true
opt.termguicolors = true
opt.laststatus = 3
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.noshowmode = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.nu = true
opt.autoindent = true
opt.nohsearch = true
