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
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		require("legendary").setup({
			extensions = {
				lazy_nvim = true,
			},
			keymaps = {
				{ "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts = { silent = true } },
				{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts = { silent = true } },
				{ "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts = { silent = true } },
				{ "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts = { silent = true } },

				-- Tabs
				{ "<tab>", ":tabnext<Return>", opts = { silent = true } },
				{ "<s-tab>", ":tabprev<Return>", opts = { silent = true } },
				{ "tw", ":tabclose<Return>", opts = { silent = true } },
				{ "te", ":tabedit<Return>", opts = { silent = true } },

				-- Copy paste system clipboard
				{ "Y", '"+y', mode = { "v" } },

				-- DAP
				{ "<F5>", ":lua require('dap').continue()<CR>", opts = { silent = true } },
				{ "<F10>", ":lua require('dap').step_over()<CR>", opts = { silent = true } },
				{ "<F11>", ":lua require('dap').step_into()<CR>", opts = { silent = true } },
				{ "<F12>", ":lua require('dap').step_out()<CR>", opts = { silent = true } },
				{ "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>", opts = { silent = true } },
				{ "<leader>B", ":lua require('dap').set_breakpoint()<CR>", opts = { silent = true } },
				{ "<leader>dr", ":lua require('dap').repl.open()<CR>", opts = { silent = true } },
				{ "<leader>du", ":lua require('dapui').toggle()<CR>", opts = { silent = true } },

				-- Move splits
				{ "<c-k>", ":wincmd k<CR>", opts = { silent = true } },
				{ "<c-j>", ":wincmd j<CR>", opts = { silent = true } },
				{ "<c-h>", ":wincmd h<CR>", opts = { silent = true } },
				{ "<c-l>", ":wincmd l<CR>", opts = { silent = true } },

				-- Harpoon
				{
					"<leader>ha",
					function()
						harpoon:list():add()
					end,
					opts = { silent = true },
				},
				{
					"<leader>ht",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					opts = { silent = true },
				},
				{
					"<C-a>",
					function()
						harpoon:list():select(1)
					end,
					opts = { silent = true },
				},
				{
					"<C-s>",
					function()
						harpoon:list():select(2)
					end,
					opts = { silent = true },
				},
				{
					"<C-d>",
					function()
						harpoon:list():select(3)
					end,
					opts = { silent = true },
				},
				{
					"<C-f>",
					function()
						harpoon:list():select(4)
					end,
					opts = { silent = true },
				},
			},
		})
	end,
}
