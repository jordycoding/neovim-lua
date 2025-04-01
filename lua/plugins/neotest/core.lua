return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>Nn", ":lua require('neotest').run.run()<CR>" },
		{ "<leader>Nf", ":lua require('neotest').run.run(vim.fn.expand(' % ''))" },
		{ "<leader>Nd", ":lua require('neotest').run.run(vim.fn.getcwd())" },
	},
}
