local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- Telescope
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",

	-- Alpha(dashboard)
	"goolord/alpha-nvim",

	-- Color scheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({
				integrations = {
					lsp_trouble = true,
					which_key = true,
					leap = true,
					harpoon = true,
					fidget = true,
					cmp = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					indent_blankline = {
						enabled = true,
						colored_indent_levels = true,
					},
					treesitter = true,
					treesitter_context = true,
					ts_rainbow = true,
					navic = {
						enabled = true,
						custom_bg = "NONE",
					},
				},
			})
		end,
	},

	-- Sidebar
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",

	-- Git(hub) integrations
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
	"f-person/git-blame.nvim",

	{
		"pwntester/octo.nvim",
		config = true,
	},
	"sindrets/diffview.nvim",

	-- LSP
	"folke/neoconf.nvim",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind-nvim",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"jose-elias-alvarez/null-ls.nvim",
			"rafamadriz/friendly-snippets",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
			"hrsh7th/cmp-path",
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		opts = {
			color_square_width = 2,
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = true,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				window = {
					blend = 100,
				},
			})
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "catppuccin",
		},
	},

	-- Java
	"mfussenegger/nvim-jdtls",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/playground",
	"windwp/nvim-ts-autotag",
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/nvim-treesitter-context",

	-- IDE functions
	{
		"folke/trouble.nvim",
		config = true,
	},
	"simrat39/symbols-outline.nvim",
	{
		"windwp/nvim-autopairs",
		config = true,
	},

	-- UI stuff/other plugins
	-- "feline-nvim/feline.nvim",
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					-- ... the rest of your lualine config
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		config = true,
	},
	"stevearc/dressing.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"akinsho/bufferline.nvim",
	"ThePrimeagen/harpoon",
	"inside/vim-search-pulse",
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
		opts = { highlight = true },
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"folke/zen-mode.nvim",
		dependencies = {
			{
				"folke/twilight.nvim",
				config = true,
			},
		},
		config = true,
	},
	"tpope/vim-surround",
	"lukas-reineke/indent-blankline.nvim",
	"tpope/vim-obsession",
	{
		"AckslD/nvim-neoclip.lua",
		config = true,
	},
}, {
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- Config folder is readonly because of home manager
})
