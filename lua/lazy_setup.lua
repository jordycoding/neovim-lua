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
				flavour = "mocha",
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
					headlines = true,
					navic = {
						enabled = true,
						custom_bg = "NONE",
					},
					dap = {
						enabled = true,
						enable_ui = true,
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
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
					map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
					map("n", "<leader>hS", gs.stage_buffer)
					map("n", "<leader>hu", gs.undo_stage_hunk)
					map("n", "<leader>hR", gs.reset_buffer)
					map("n", "<leader>hp", gs.preview_hunk)
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end)
					map("n", "<leader>tb", gs.toggle_current_line_blame)
					map("n", "<leader>hd", gs.diffthis)
					map("n", "<leader>hD", function()
						gs.diffthis("~")
					end)
					map("n", "<leader>td", gs.toggle_deleted)

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})
		end,
	},
	"f-person/git-blame.nvim",

	{
		"pwntester/octo.nvim",
		config = true,
	},
	"sindrets/diffview.nvim",

	-- LSP
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
	"scalameta/nvim-metals",
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

	-- Copilot
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot.lua",
				config = function()
					require("copilot").setup({
						suggestion = { enabled = false },
						panel = { enabled = false },
					})
				end,
			},
		},
		config = true,
	},

	-- Java
	"mfussenegger/nvim-jdtls",

	-- DAP
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = true,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = true,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	"simrat39/rust-tools.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/playground",
	"windwp/nvim-ts-autotag",
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/nvim-treesitter-textobjects",

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
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			space_char_blankline = " ",
			show_current_context = true,
		},
	},
	"rmagatti/auto-session",
	{
		"rmagatti/session-lens",
	},
	{
		"AckslD/nvim-neoclip.lua",
		config = true,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
}, {
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- Config folder is readonly because of home manager
})
