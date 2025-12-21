local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<tab>", "<cmd>tabnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<s-tab>", "<cmd>tabprev<CR>", opts)
vim.api.nvim_set_keymap("n", "tw", "<cmd>tabclose<CR>", opts)
vim.api.nvim_set_keymap("n", "te", "<cmd>tabedit<CR>", opts)
-- Visual mode: yank selection to clipboard
vim.api.nvim_set_keymap("v", "Y", '"+y', opts)
-- Normal mode: yank with motions to clipboard (e.g., Yw, Yt()
vim.api.nvim_set_keymap("n", "Y", '"+y', opts)
