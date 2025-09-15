return {
	{
		"polarmutex/git-worktree.nvim",
		keys = {
			-- { "<leader>fgw", ":Telescope git_worktree git_worktree<cr>" },
			-- { "<leader>gwc", ":Telescope git_worktree create_git_worktree<cr>" },
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = true,
		keys = {
			{
				"<leader>ha",
				function()
					local harpoon = require("harpoon")
					harpoon:list():add()
				end,
				desc = "Add to harpoon",
			},
			{
				"<leader>ht",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Toggle harpoon menu",
			},
			{
				"<C-a>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(1)
				end,
				desc = "Harpoon first file",
			},
			{
				"<C-s>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(2)
				end,
				desc = "Harpoon second file",
			},
			{
				"<C-d>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(3)
				end,
				desc = "Harpoon third file",
			},
			{
				"<C-f>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(4)
				end,
				desc = "Harpoon fourth file",
			},
		},
	},
}
