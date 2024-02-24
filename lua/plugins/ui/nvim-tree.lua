return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			view = {
				side = "left",
			},
		})

		local function open_nvim_tree(data)
			-- buffer is a directory
			local directory = vim.fn.isdirectory(data.file) == 1

			if not directory then
				return
			end

			-- change to the directory
			vim.cmd.cd(data.file)

			-- open the tree
			require("nvim-tree.api").tree.open()
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

		vim.g.nvim_tree_indent_markers = 1
		vim.g.nvim_tree_highlight_opened_files = 1
	end,
}
