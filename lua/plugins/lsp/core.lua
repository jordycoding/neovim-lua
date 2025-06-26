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
			-- TODO: Remove when PR/Issue is closed https://github.com/stevearc/conform.nvim/issues/699
			formatters = {
				csharpier = function()
					local useDotnet = not vim.fn.executable("csharpier")

					local command = useDotnet and "dotnet csharpier" or "csharpier"

					local version_out = vim.fn.system(command .. " --version")

					--NOTE: system command returns the command as the first line of the result, need to get the version number on the final line
					local version_result = version_out[#version_out]
					local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
					local is_new = major_version >= 1

					local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

					return {
						command = command,
						args = args,
						stdin = not is_new,
						require_cwd = false,
					}
				end,
			},
			format_on_save = function(bufnr)
				local slow_format_filetypes =
					{ "dart", "javascript", "javascriptreact", "typescript", "typescriptreact" }
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
				javascript = { "eslint_d", "biome-check", "prettier", stop_after_first = true },
				javascriptreact = { "biome-check", "prettier", stop_after_first = true },
				typescript = { "eslint_d", "biome-check", "prettier", stop_after_first = true },
				typescriptreact = { "eslint_d", "biome-check", "prettier", stop_after_first = true },
				nix = { "nixpkgs_fmt" },
				json = { "biome", "prettier", stop_after_first = true },
				go = { "goimports", "gofmt" },
				vue = { "biome", "prettier", stop_after_first = true },
				latex = { "latexindent" },
				dart = { "dart_format" },
				html = { "eslint_d", "prettier", stop_after_first = true },
				css = { "eslint_d", "prettier", stop_after_first = true },
				cs = { "csharpier" },
			},
		},
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		---@type TailwindTools.Option
		opts = {
			server = {
				settings = {
					experimental = {
						classRegex = {
							{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
						},
					},
				},
			},
		},
	},
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
		-- lazy = true,
		opts = {
			notification = {
				window = {
					normal_hl = "DiagnosticInfo",
					winblend = 100,
				},
			},
			integration = {
				["nvim-tree"] = {
					enable = false,
				},
			},
		},
	},
	{
		"nvim-java/nvim-java",
		opts = {
			jdk = {
				auto_install = false,
			},
		},
		dependencies = {
			-- TODO: https://github.com/nvim-java/nvim-java/issues/384 remove when this is fixed
			{ "mason-org/mason.nvim", version = "^1.0.0" },
			{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
}
