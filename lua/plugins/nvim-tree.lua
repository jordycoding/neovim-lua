require('nvim-tree').setup({
    open_on_setup = true,
    open_on_tab = true,
    actions = {
        open_file = {
                resize_window = true
        }
    },
    view = {
        side = 'left',
    },
})

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
