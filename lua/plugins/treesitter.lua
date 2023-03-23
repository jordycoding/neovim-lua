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
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "php" },
	},
	playground = {
		enable = true,
	},
	autotag = {
		enable = true,
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
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
