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
			desc = "Open neogit",
		},
		{
			"<leader>gc",
			":Neogit commit<cr>",
			desc = "Neogit commit",
		},
	},
}
