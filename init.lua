vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Import Lua modules
require("core/options")
require("lazy_setup")
require("core/colors")
require("core/keymaps")
require("lsp")
