return {
	{
		"folke/trouble.nvim",
		config = true,
		cmd = {
			"Trouble",
		},
		keys = {
			{ "<leader>t", ":Trouble diagnostics <cr>" },
			{ "<leader>tb", ":Trouble diagnostics toggle filter.buf=0<cr>" },
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
	{
		"windwp/nvim-autopairs",
		config = true,
	},
}
