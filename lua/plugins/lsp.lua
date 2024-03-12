return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
	},
	{
		"stevearc/conform.nvim",
	},
	{
		"pmizio/typescript-tools.nvim",
		config = true,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		opts = {
			color_square_width = 2,
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_default_options = { mode = "virtualtext", tailwind = "lsp" },
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				notification = {
					window = {
						winblend = 100,
					},
				},
			})
		end,
	},
	"mfussenegger/nvim-jdtls",
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
}
