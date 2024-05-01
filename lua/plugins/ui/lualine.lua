return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "catppuccin",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				"%=", -- make the indicator center
				separator = nil,
				{
					"harpoon2",
					indicators = { "a", "s", "d", "f" },
					active_indicators = { "[a]", "[s]", "[d]", "[f]" },
					_separator = " ",
				},
			},
			lualine_x = {
				"filetype",
			},
			lualine_y = {
				"b:gitsigns_status",
			},
			lualine_z = {
				"progress",
			},
		},
	},
	dependencies = {
		"letieu/harpoon-lualine",
	},
}
