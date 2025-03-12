return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{
			"tpope/vim-dadbod",
			lazy = true,
			cmd = { "DB" },
		},
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
}
