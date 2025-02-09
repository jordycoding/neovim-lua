return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"folke/neoconf.nvim",
				config = true,
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>F",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			format_on_save = function(bufnr)
				local slow_format_filetypes = {}
				if slow_format_filetypes[vim.bo[bufnr].filetype] then
					return
				end
				local function on_format(err)
					if err and err:match("timeout$") then
						slow_format_filetypes[vim.bo[bufnr].filetype] = true
					end
				end

				return { timeout_ms = 200, lsp_fallback = true }, on_format
			end,

			format_after_save = function(bufnr)
				local slow_format_filetypes = {}
				if not slow_format_filetypes[vim.bo[bufnr].filetype] then
					return
				end
				return { lsp_fallback = true }
			end,

			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "biome-check", "prettier", stop_after_first = true },
				javascriptreact = { "biome-check", "prettier", stop_after_first = true },
				typescript = { "biome-check", "prettier", stop_after_first = true },
				typescriptreact = { "biome-check", "prettier", stop_after_first = true },
				nix = { "nixpkgs_fmt" },
				json = { "biome", "prettier", stop_after_first = true },
				go = { "goimports", "gofmt" },
				vue = { "biome", "prettier", stop_after_first = true },
				latex = { "latexindent" },
				dart = { "dart_format" },
			},
		},
	},
	-- {
	-- 	"luckasRanarison/tailwind-tools.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	---@type TailwindTools.Option
	-- 	opts = {
	-- 		server = {
	-- 			settings = {
	-- 				experimental = {
	-- 					classRegex = {
	-- 						{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"j-hui/fidget.nvim",
		lazy = true,
		opts = {
			notification = {
				window = {
					winblend = 100,
				},
			},
		},
	},
	{
		lazy = true,
		"mfussenegger/nvim-jdtls",
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
}
