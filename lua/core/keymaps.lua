local harpoon = require("harpoon")
harpoon:setup()

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Tabs
map("n", "<tab>", ":tabnext<Return>")
map("n", "<s-tab>", ":tabprev<Return>")
map("n", "tw", ":tabclose<Return>")
map("n", "te", ":tabedit<Return>")

-- Harpoon
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
-- map("n", "<leader>hc", ":lua require('harpoon.mark').clear_all()<CR>")
vim.keymap.set("n", "<leader>ht", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<C-a>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-d>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-f>", function()
	harpoon:list():select(4)
end)

-- NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>")

-- Worktree
map("n", "<leader>fgw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map("n", "<leader>gwc", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

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

-- Trouble
map("n", "<leader>t", ":Trouble diagnostics<CR>")
map("n", "<leader>tb", ":Trouble diagnostics toggle filter.buf=0<CR>")

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
map("n", "<leader>du", ":lua require('dapui').toggle()<CR>")

-- Neotest
map("n", "<leader>Nn", ":lua require('neotest').run.run()<CR>")
map("n", "<leader>Nf", ":lua require('neotest').run.run(vim.fn.expand(' % ''))")
map("n", "<leader>Nd", ":lua require('neotest').run.run(vim.fn.getcwd())")
