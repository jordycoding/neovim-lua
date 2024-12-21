return {
	{
		"folke/trouble.nvim",
		config = true,
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
