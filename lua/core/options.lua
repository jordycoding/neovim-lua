local g = vim.g
local opt = vim.opt

-----------
-- General
-----------
opt.mouse = "a"
-- Avoid interpreting source comments (e.g. "ex: printf(...)") as editor options.
opt.modeline = false
g.mapleader = " "

-----------
-- UI
-----------
opt.splitright = true
opt.termguicolors = true
opt.laststatus = 3
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
opt.fillchars:append({ eob = " " })
