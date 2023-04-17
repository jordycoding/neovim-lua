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
				custom_highlights = function(C)
					return {
						PmenuSel = { bg = C.surface1, fg = "NONE" },
						Pmenu = { fg = C.text, bg = C.surface0 },
						CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
						CmpItemKindKeyword = { fg = C.base, bg = C.red },
						CmpItemKindText = { fg = C.base, bg = C.teal },
						CmpItemKindMethod = { fg = C.base, bg = C.blue },
						CmpItemKindConstructor = { fg = C.base, bg = C.blue },
						CmpItemKindFunction = { fg = C.base, bg = C.blue },
						CmpItemKindFolder = { fg = C.base, bg = C.blue },
						CmpItemKindModule = { fg = C.base, bg = C.blue },
						CmpItemKindConstant = { fg = C.base, bg = C.peach },
						CmpItemKindField = { fg = C.base, bg = C.green },
						CmpItemKindProperty = { fg = C.base, bg = C.green },
						CmpItemKindEnum = { fg = C.base, bg = C.green },
						CmpItemKindUnit = { fg = C.base, bg = C.green },
						CmpItemKindClass = { fg = C.base, bg = C.yellow },
						CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
						CmpItemKindFile = { fg = C.base, bg = C.blue },
						CmpItemKindInterface = { fg = C.base, bg = C.yellow },
						CmpItemKindColor = { fg = C.base, bg = C.red },
						CmpItemKindReference = { fg = C.base, bg = C.red },
						CmpItemKindEnumMember = { fg = C.base, bg = C.red },
						CmpItemKindStruct = { fg = C.base, bg = C.blue },
						CmpItemKindValue = { fg = C.base, bg = C.peach },
						CmpItemKindEvent = { fg = C.base, bg = C.blue },
						CmpItemKindOperator = { fg = C.base, bg = C.blue },
						CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
						CmpItemKindCopilot = { fg = C.base, bg = C.teal },
					}
				end,
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
			"jose-elias-alvarez/typescript.nvim",
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
		config = function()
			require("colorizer").setup({
				user_default_options = { tailwind = true },
			})
		end,
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
	{
		"simrat39/symbols-outline.nvim",
		config = true,
	},
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
	"tpope/vim-abolish",
	"lukas-reineke/indent-blankline.nvim",
	"rmagatti/auto-session",
	{
		"rmagatti/session-lens",
		config = true,
	},
	{
		"AckslD/nvim-neoclip.lua",
		config = true,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = "nvim-lua/plenary.nvim",
	},
}, {
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- Config folder is readonly because of home manager
})
