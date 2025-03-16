return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			theme = "catppuccin",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", color = { gui = "italic,bold" } } },
			lualine_b = {
				{ "branch", color = { gui = "italic,bold" } },
				{ "b:gitsigns_status", color = { gui = "italic,bold" } },
				{ "diagnostics", color = { gui = "italic,bold" } },
			},
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
				{
					"fileformat",
					color = { gui = "italic,bold" },
				},
				{
					"encoding",
					color = { gui = "italic,bold" },
				},
			},
			lualine_y = {
				{

					"location",
					color = { gui = "italic,bold" },
				},
				{
					"progress",
					color = { gui = "italic,bold" },
				},
			},
			lualine_z = {
				{
					"datetime",
					style = " %H:%M",
					color = { gui = "italic,bold" },
				},
			},
		},
	},
	dependencies = {
		"letieu/harpoon-lualine",
	},
}
