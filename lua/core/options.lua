local g = vim.g
local opt = vim.opt

-----------
-- General
-----------
opt.mouse = "a"
g.mapleader = " "

-----------
-- UI
-----------
opt.splitright = true
opt.termguicolors = true
opt.laststatus = 3
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.showmode = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.hlsearch = false
opt.foldenable = false
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.title = true

-----------
-- nvim-tree
-----------
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 1
