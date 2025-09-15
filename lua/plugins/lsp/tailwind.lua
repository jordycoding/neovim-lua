return {
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "virtual",
		},
	},
	{
		"razak17/tailwind-fold.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
		keys = {
			"<localleader>tf",
			"<cmd>TailwindFoldToggle<cr>",
			desc = "Toggle tailwind class fold",
		},
	},
}
