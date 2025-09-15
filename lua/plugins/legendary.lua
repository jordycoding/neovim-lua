return {
	"mrjones2014/legendary.nvim",
	priority = 10000,
	lazy = false,
	dependencies = {
		{
			"kkharji/sqlite.lua",
		},
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
		},
		{
			"mrjones2014/smart-splits.nvim",
		},
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		require("legendary").setup({
			extensions = {
				lazy_nvim = true,
				smart_splits = {
					directions = { "h", "j", "k", "l" },
					mods = {
						move = "<C>",
						resize = {
							mod = "<M>",
							prefix = "<leader>",
						},
						-- any of these can also be a table of the following form
						swap = {
							-- this will create the mapping like
							-- <leader><C-h>
							-- <leader><C-j>
							-- <leader><C-k>
							-- <leader><C-l>
							mod = "<C>",
							prefix = "<leader>",
						},
					},
				},
			},
			keymaps = {

				-- Tabs
				{ "<tab>", ":tabnext<Return>", description = "Next tab", opts = { silent = true } },
				{ "<s-tab>", ":tabprev<Return>", description = "Previous tab", opts = { silent = true } },
				{ "tw", ":tabclose<Return>", description = "Close tab", opts = { silent = true } },
				{ "te", ":tabedit<Return>", description = "Edit tab", opts = { silent = true } },

				-- Copy paste system clipboard
				{ "Y", '"+y', description = "Yank to system clipboard", mode = { "v" } },

				-- DAP
				{
					"<F5>",
					":lua require('dap').continue()<CR>",
					description = "DAP Continue",
					opts = { silent = true },
				},
				{
					"<F10>",
					":lua require('dap').step_over()<CR>",
					description = "DAP Step over",
					opts = { silent = true },
				},
				{
					"<F11>",
					":lua require('dap').step_into()<CR>",
					description = "DAP Step into",
					opts = { silent = true },
				},
				{
					"<F12>",
					":lua require('dap').step_out()<CR>",
					description = "DAP Step out",
					opts = { silent = true },
				},
				{
					"<leader>b",
					":lua require('dap').toggle_breakpoint()<CR>",
					description = "DAP Toggle breakpoint",
					opts = { silent = true },
				},
				{
					"<leader>B",
					":lua require('dap').set_breakpoint()<CR>",
					description = "DAP Set breakpoint",
					opts = { silent = true },
				},
				{
					"<leader>dr",
					":lua require('dap').repl.open()<CR>",
					description = "DAP Open REPL",
					opts = { silent = true },
				},
				{
					"<leader>du",
					":lua require('dapui').toggle()<CR>",
					description = "Toggle DAP UI",
					opts = { silent = true },
				},

				-- Harpoon
				{
					"<leader>ha",
					function()
						harpoon:list():add()
					end,
					description = "Add to harpoon",
					opts = { silent = true },
				},
				{
					"<leader>ht",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					description = "Toggle harpoon menu",
					opts = { silent = true },
				},
				{
					"<C-a>",
					function()
						harpoon:list():select(1)
					end,
					description = "Harpoon first file",
					opts = { silent = true },
				},
				{
					"<C-s>",
					function()
						harpoon:list():select(2)
					end,
					description = "Harpoon second file",
					opts = { silent = true },
				},
				{
					"<C-d>",
					function()
						harpoon:list():select(3)
					end,
					description = "Harpoon third file",
					opts = { silent = true },
				},
				{
					"<C-f>",
					function()
						harpoon:list():select(4)
					end,
					description = "Harpoon fourth file",
					opts = { silent = true },
				},
			},
		})
	end,
}
