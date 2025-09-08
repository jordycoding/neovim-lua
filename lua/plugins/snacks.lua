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
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
		},
		{
			"<leader>fF",
			function()
				Snacks.picker.git_files()
			end,
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.commands()
			end,
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.pickers()
			end,
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
		},
		{
			"<leader>fgb",
			function()
				Snacks.picker.git_branches()
			end,
		},
		{
			"<leader>fgc",
			function()
				Snacks.picker.git_log()
			end,
		},
		{
			"<leader>fgs",
			function()
				Snacks.picker.git_stash()
			end,
		},
		{
			"<leader>fgS",
			function()
				Snacks.picker.git_status()
			end,
		},
		{
			"<leader>fG",
			function()
				Snacks.picker.grep()
			end,
		},
	},
}
