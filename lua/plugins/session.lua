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
			bypass_save_filetypes = { "neo-tree", "alpha" },
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
				end,
			},
			session_lens = {
				load_on_setup = false,
			},
			post_restore_cmds = {},
		},
	},
}
