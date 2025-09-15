return {
	"mrjones2014/legendary.nvim",
	priority = 10000,
	lazy = false,
	dependencies = {
		{
			"kkharji/sqlite.lua",
		},
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
		},
		{
			"mrjones2014/smart-splits.nvim",
		},
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		require("legendary").setup({
			extensions = {
				lazy_nvim = true,
				smart_splits = {
					directions = { "h", "j", "k", "l" },
					mods = {
						move = "<C>",
						resize = {
							mod = "<M>",
							prefix = "<leader>",
						},
						-- any of these can also be a table of the following form
						swap = {
							-- this will create the mapping like
							-- <leader><C-h>
							-- <leader><C-j>
							-- <leader><C-k>
							-- <leader><C-l>
							mod = "<C>",
							prefix = "<leader>",
						},
					},
				},
			},
			keymaps = {

				-- Tabs
				{ "<tab>", ":tabnext<Return>", description = "Next tab", opts = { silent = true } },
				{ "<s-tab>", ":tabprev<Return>", description = "Previous tab", opts = { silent = true } },
				{ "tw", ":tabclose<Return>", description = "Close tab", opts = { silent = true } },
				{ "te", ":tabedit<Return>", description = "Edit tab", opts = { silent = true } },

				-- Copy paste system clipboard
				{ "Y", '"+y', description = "Yank to system clipboard", mode = { "v" } },
			},
		})
	end,
}
