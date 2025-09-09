return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			picker = "snacks_picker",
		})
	end,
	keys = {
		{
			"<leader>zcc",
			"<cmd>ZkNew<cr>",
			desc = "New zk note in current buffer",
		},
		{
			"<leader>zcv",
			"<cmd>vsplit<cr><cmd>ZkNew<cr>",
			desc = "New zk note vertical split",
		},
		{
			"<leader>zcs",
			"<cmd>split<cr><cmd>ZkNew<cr>",
			desc = "New zk note horizontal split",
		},
		{
			"<leader>zfn",
			"<cmd>ZkNotes<cr>",
			desc = "Find zk notes",
		},
		{
			"<leader>zft",
			"<cmd>ZkTags<cr>",
			desc = "Find zk tags",
		},
	},
}
