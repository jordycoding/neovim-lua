return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	opts = {
		graph_style = "kitty",
	},
	cmd = { "Neogit" },
	keys = {
		{
			"<leader>gg",
			":Neogit<cr>",
		},
		{
			"<leader>gc",
			":Neogit commit<cr>",
		},
	},
}
