return {
	{
		"folke/trouble.nvim",
		config = true,
		cmd = {
			"Trouble",
		},
		keys = {
			{ "<leader>tt", ":Trouble diagnostics <cr>", desc = "Trouble diagnostics" },
			{
				"<leader>tb",
				":Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Trouble diagnostics current buffer",
			},
		},
	},
	{
		"hedyhli/outline.nvim",
		config = true,
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>s", "<cmd>Outline<CR>", desc = "Tolggle outline" },
		},
	},
}
