return {
	"saghen/blink.cmp",
	version = "v0.*",
	opts = {
		keymap = { preset = "enter" },
		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		sources = {
			default = { "lsp", "path", "luasnip", "buffer", "lazydev", "copilot" },
			providers = {
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
		signature = { enabled = true },
	},
}
