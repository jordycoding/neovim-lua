return {
	"inside/vim-search-pulse",
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
		lazy = true,
		ft = "markdown",
	},
}
