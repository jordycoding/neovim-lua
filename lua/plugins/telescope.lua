local telescope = require('telescope')

telescope.load_extension('neoclip')
telescope.setup({
    defaults = {
        file_ignore_patterns = { '.git', 'node_modules'}
    },
    pickers = {
        find_files = {
            hidden = true
        },
        commands = {
            theme = 'dropdown'
        }
    }
})
