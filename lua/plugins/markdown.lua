return {
	{
		"OXY2DEV/markview.nvim",
		opts = {
			latex = { enable = true },
			preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},
	{
		"TobinPalmer/pastify.nvim",
		cmd = { "Pastify", "PastifyAfter" },
		config = true,
	},
}
