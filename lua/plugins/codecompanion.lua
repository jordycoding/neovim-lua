return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		interactions = {
			chat = {
				adapter = "deepseek",
			},
		},
		adapters = {
			http = {
				deepseek = function()
					return require("codecompanion.adapters").extend("deepseek", {
						env = {
							api_key = "cmd: op read op://Private/DeepSeek/api_key_nvim",
						},
					})
				end,
			},
		},
	},
	cmd = { "CodeCompanion", "CoddeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
	keys = {
		{
			"<leader>Cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			modes = { "n", "v" },
			desc = "Toggle codecompanion chat",
		},
	},
}
