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
			inline = {
				adapter = "deepseek",
				model = "deepseek-chat",
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
				mimo = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "xiaomi_mimo",
						formatted_name = "Xiaomi MiMo",
						env = {
							url = "https://api.xiaomimimo.com",
							api_key = "cmd: op read op://Private/Xiaomi/nvim_api_key",
						},
					})
				end,
			},
		},
	},
	cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
	keys = {
		{
			"<leader>Cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			mode = { "n", "v" },
			desc = "Toggle codecompanion chat",
		},
	},
}
