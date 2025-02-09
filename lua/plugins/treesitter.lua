return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			config = true,
		},
		-- "nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"html",
				"css",
				"tsx",
				"typescript",
				"javascript",
				"rust",
				"json",
				"latex",
				"markdown",
				"c_sharp",
				"bash",
				"dockerfile",
				"php",
				"phpdoc",
				"python",
				"yaml",
				"nix",
				"svelte",
				"yaml",
				"dart",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "php" },
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					scope_incremental = "<CR>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
			indent = {
				enable = true,
			},
		})
	end,
}
