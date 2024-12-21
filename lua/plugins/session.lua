return {
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			suppressed_dirs = { "~/Downloads" },
			bypass_save_filetypes = { "NvimTree", "alpha" },
			no_restore_cmds = {
				function()
					local file = vim.fn.expand("%:p")

					-- Check if the buffer is a directory
					local directory = vim.fn.isdirectory(file) == 1

					if not directory then
						return
					end

					-- Change to the directory
					vim.cmd.cd(file)

					-- Open the tree
					require("nvim-tree.api").tree.open()
				end,
			},
			post_restore_cmds = {
				function()
					-- Restore nvim-tree after a session is restored
					local nvim_tree_api = require("nvim-tree.api")
					nvim_tree_api.tree.open()
					nvim_tree_api.tree.change_root(vim.fn.getcwd())
					nvim_tree_api.tree.reload()
				end,
			},
		},
	},
	"rmagatti/session-lens",
}
