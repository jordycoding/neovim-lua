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
