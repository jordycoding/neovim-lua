return require('packer').startup(function()
    -- Let packer manage itself
    use 'wbthomason/packer.nvim'
  
    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    
    -- Alpha(dashboard)
    use {
        'goolord/alpha-nvim',
    }

    -- Color scheme
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require('catppuccin').setup({
                integrations = {
                    lsp_trouble = true,
                    which_key = true,
                    leap = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = true,
                    },  
                }
            })
        end
    }

    -- Sidebar
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    
    -- Git(hub) integrations
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'pwntester/octo.nvim',
        config = function()
            require('octo').setup()
        end
    }
    use 'sindrets/diffview.nvim'

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'onsails/lspkind-nvim',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'jose-elias-alvarez/null-ls.nvim',
            'rafamadriz/friendly-snippets',
            'jose-elias-alvarez/nvim-lsp-ts-utils',
        },
    }

    -- Java
    use 'mfussenegger/nvim-jdtls'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'
    use 'windwp/nvim-ts-autotag'

    -- IDE functions
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup()
        end
    }
    use 'simrat39/symbols-outline.nvim'
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end
    }

    -- UI stuff/other plugins
    use 'feline-nvim/feline.nvim'
    use 'folke/which-key.nvim' 
    use 'stevearc/dressing.nvim'
    use {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    }
    use 'akinsho/bufferline.nvim'
    use 'ThePrimeagen/harpoon'
    use 'inside/vim-search-pulse'
    use {
        'SmiteshP/nvim-navic',
        requires = "neovim/nvim-lspconfig",
        config = function()
            require("nvim-navic").setup {
                highlight = true
            }
        end
    }
    use {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'folke/zen-mode.nvim',
        requires = {
            {
                'folke/twilight.nvim',
                config = function()
                    require('twilight').setup()
                end
            },
        },
        config = function()
            require('zen-mode').setup()
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end 
    }
    use 'tpope/vim-surround'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'tpope/vim-obsession'
    use {
        'AckslD/nvim-neoclip.lua',
        config = function()
            require('neoclip').setup()
        end
    }
end)
