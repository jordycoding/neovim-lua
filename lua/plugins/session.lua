return {
	{
		"rmagatti/auto-session",
		lazy = false,
		keys = {
			{ "<leader>fS", "<cmd>SessionSearch<CR>", desc = "Session search" },
		},
		---@module "auto-session"
		---@type AutoSession.Config
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
			session_lens = {
				load_on_setup = false,
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
}
