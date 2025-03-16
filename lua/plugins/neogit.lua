return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = true,
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
