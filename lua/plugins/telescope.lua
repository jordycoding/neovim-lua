return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		defaults = {
			file_ignore_patterns = { ".git", "node_modules", ".vendor" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			commands = {
				theme = "dropdown",
			},
		},
	},
	cmd = { "Telescope" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fa", "<cmd>Telescope commands<cr>" },
		{ "<leader>ft", "<cmd>Telescope builtin<cr>" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>" },
		{ "<leader>fgb", "<cmd>Telescope git_branches<cr>" },
		{ "<leader>fgc", "<cmd>Telescope git_commits<cr>" },
		{ "<leader>fgs", "<cmd>Telescope git_stash<cr>" },
		{ "<leader>fgS", "<cmd>Telescope git_status<cr>" },
	},
}
