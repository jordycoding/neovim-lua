require('nvim-treesitter.configs').setup({
    highlight = {
        ensure_installed = 'maintained',
        enable = true,    
        additional_vim_regex_highlighting = false,
    },
    playground = {
        enable = true
    },
    autotag = {
        enable = true
    },
})
EOF
