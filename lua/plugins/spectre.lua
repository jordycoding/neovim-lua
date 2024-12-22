return {
	"nvim-pack/nvim-spectre",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>S", '<cmd>lua require("spectre").open()<cr>' },
		{ "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>' },
		{ "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>' },
	},
	cmd = {
		"Spectre",
	},
}
