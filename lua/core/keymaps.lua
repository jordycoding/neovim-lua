local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Harpoon

map("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
map("n", "<leader>hc", ":lua require('harpoon.mark').clear_all()<CR>")
map("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
map("n", "<C-a>", ":lua require('harpoon.ui').nav_file(1)<CR>")
map("n", "<C-s>", ":lua require('harpoon.ui').nav_file(2)<CR>")
map("n", "<C-d>", ":lua require('harpoon.ui').nav_file(3)<CR>")
map("n", "<C-f>", ":lua require('harpoon.ui').nav_file(4)<CR>")

-- NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>")

-- Fugitive
map("n", "<leader>gg", ":G<CR>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fa", "<cmd>Telescope commands<CR>")
map("n", "<leader>ft", "<cmd>Telescope builtin<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fy", "<cmd>Telescope neoclip<CR>")
map("n", "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
map("n", "<leader>fS", ":Telescope session-lens search_session<CR>")
map("n", "<leader>fgb", "<cmd>Telescope git_branches<CR>")
map("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>fgs", "<cmd>Telescope git_stash<CR>")
map("n", "<leader>fgS", "<cmd>Telescope git_status")

-- Zen mode
map("n", "<leader>z", "<cmd>ZenMode<CR>")

-- Trouble
map("n", "<leader>t", "<cmd>TroubleToggle<CR>")

-- Symbols
map("n", "<leader>s", "<cmd>SymbolsOutline<CR>")

-- Copy paste system clipboard
map("v", "Y", '"+y')

-- Spectre
map("n", "<leader>S", '<cmd>lua require("spectre").open()<CR>')
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
map("v", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')

-- DAP
map("n", "<F5>", ":lua require('dap').continue()<CR>")
map("n", "<F10>", ":lua require('dap').step_over()<CR>")
map("n", "<F11>", ":lua require('dap').step_into()<CR>")
map("n", "<F12>", ":lua require('dap').step_out()<CR>")
map("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
map("n", "<leader>B", ":lua require('dap').set_breakpoint()<CR>")
map("n", "<leader>dr", ":lua require('dap').repl.open()<CR>")
map("n", "<leader>du", ":lua require('dapui').toggle()")
