return {
	"nvim-pack/nvim-spectre",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>S", '<cmd>lua require("spectre").open()<cr>', desc = "Open spectre" },
		{
			"<leader>sw",
			'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
			desc = "Open spectre current word",
		},
		{
			"<leader>sp",
			'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
			desc = "Open spectre search current file",
		},
	},
	cmd = {
		"Spectre",
	},
}
