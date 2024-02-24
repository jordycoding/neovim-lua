return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.load_extension("neoclip")
		telescope.load_extension("git_worktree")
		telescope.setup({
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
		})
	end,
}
