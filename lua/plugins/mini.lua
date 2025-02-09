return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.bracketed").setup()
	end,
}
