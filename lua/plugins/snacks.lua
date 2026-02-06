return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		notify = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = true },
		rename = { enabled = true },
		gitbrowse = { enabled = true },
		lazygit = { enabled = true },
		zen = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true, layout = { preset = "vscode", preview = true } },
		image = { enabled = true },
	},
	keys = {
		{
			"<leader>G",
			function()
				Snacks.lazygit()
			end,
			desc = "Snacks lazygit",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Snacks zen",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "Snacks picker smart",
		},
		{
			"<leader>fF",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Snacks picker git files",
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.commands()
			end,
			desc = "Snacks picker commands",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.pickers()
			end,
			desc = "Snacks picker pickers",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Snacks picker buffers",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_workspace_symbols({
					filter = {
						vue = {
							"Variable",
							"Class",
							"Constructor",
							"Enum",
							"Field",
							"Function",
							"Interface",
							"Method",
							"Module",
							"Namespace",
							"Property",
							"Struct",
							"Trait",
						},
						typescript = {
							"Variable",
							"Class",
							"Constructor",
							"Enum",
							"Field",
							"Function",
							"Interface",
							"Method",
							"Module",
							"Namespace",
							"Property",
							"Struct",
							"Trait",
						},
					},
				})
			end,
			desc = "Snacks picker lsp symbols",
		},
		{
			"<leader>fgb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Snacks picker git branches",
		},
		{
			"<leader>fgc",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Snacks picker git log",
		},
		{
			"<leader>fgs",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Snacks picker git stash",
		},
		{
			"<leader>fgS",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Snacks picker git status",
		},
		{
			"<leader>fG",
			function()
				Snacks.picker.grep()
			end,
			desc = "Snacks picker grep",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Snacks picker keymaps",
		},
	},
}
