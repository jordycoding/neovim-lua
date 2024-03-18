require("conform").setup({
	async = true,
	format_on_save = {
		async = true,
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		nix = { "nixpkgs_fmt" },
		json = { "prettier" },
	},
})
