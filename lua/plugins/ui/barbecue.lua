return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		{
			"SmiteshP/nvim-navic",
			opts = { highlight = true },
			dependencies = "neovim/nvim-lspconfig",
		},
		{
			"nvim-tree/nvim-web-devicons",
		},
	},
	opts = {
		theme = "catppuccin",
	},
}
