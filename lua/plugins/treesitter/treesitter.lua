return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			config = true,
		},
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
	},
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")
		local ts_languages = {
			"c",
			"lua",
			"html",
			"css",
			"tsx",
			"typescript",
			"javascript",
			"rust",
			"json",
			"latex",
			"markdown",
			"c_sharp",
			"bash",
			"dockerfile",
			"php",
			"phpdoc",
			"python",
			"yaml",
			"nix",
			"svelte",
			"yaml",
			"dart",
		}

		for _, parser in ipairs(ts_languages) do
			ts.install(parser)
		end
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ts_languages,
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
			end,
		})
	end,
}
