return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		keys = {
			{ "<leader>n", "<Cmd>Neotree toggle<CR>", desc = "Toggle Neotree" },
		},
		opts = {
			window = {
				position = "right",
			},
		},
	},
	{
		"Mirsmog/real-icons.nvim",
		build = ":RealIcons install",
		opts = {
			integrations = {
				neo_tree = true,
			},
		},
	},
}
