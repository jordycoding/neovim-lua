return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"SmiteshP/nvim-navic",
			opts = { highlight = true },
			dependencies = "neovim/nvim-lspconfig",
		},
		{
			"nvim-tree/nvim-web-devicons",
		},
	},
	config = function()
		local helpers = require("incline.helpers")
		local navic = require("nvim-navic")
		local devicons = require("nvim-web-devicons")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		require("incline").setup({
			hide = {
				cursorline = true,
			},
			window = {
				padding = 0,
				margin = { horizontal = 0, vertical = 0 },
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local modified = vim.bo[props.buf].modified
				local res = {
					ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
					" ",
					{ filename, gui = modified and "bold,italic" or "bold" },
					guibg = mocha["crust"],
				}
				if props.focused then
					for _, item in ipairs(navic.get_data(props.buf) or {}) do
						table.insert(res, {
							{ " > ", group = "NavicSeparator" },
							{ item.icon, group = "NavicIcons" .. item.type },
							{ item.name, group = "NavicText" },
						})
					end
				end
				table.insert(res, " ")
				return res
			end,
		})
	end,
}
