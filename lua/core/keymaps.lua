local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Harpoon

map('n', '<silent><leader>ha', ':lua require(\'harpoon.mark\').add_file()<CR>')
map('n', '<silent><leader>hc', ':lua require(\'harpoon.mark\').clear_all()<CR>')
map('n', '<silent><leader>ht', ':lua require(\'harpoon.ui\').toggle_quick_menu()<CR>')
map('n', '<C-a>', ':lua require(\'harpoon.ui\').nav_file(1)<CR>')
map('n', '<C-s>', ':lua require(\'harpoon.ui\').nav_file(2)<CR>')
map('n', '<C-d>', ':lua require(\'harpoon.ui\').nav_file(3)<CR>')
map('n', '<C-f>', ':lua require(\'harpoon.ui\').nav_file(4)<CR>')

-- NvimTree
map('n', '<leader>n', ':NvimTreeToggle<CR>')

-- Fugitive
map('n', '<leader>gg', ':G<CR>')

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fa', '<cmd>Telescope commands<CR>')
map('n', '<leader>ft', '<cmd>Telescope builtin<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fy', '<cmd>Telescope neoclip<CR>')

-- Zen mode
map('n', '<leader>z', '<cmd>ZenMode<CR>')

-- Trouble
map('n', '<leader>t', '<cmd>TroubleToggle<CR>')

-- Symbols
map('n', '<leader>s', '<cmd>SymbolsOutline<CR>')
