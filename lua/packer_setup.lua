return require('packer').startup(function()
    -- Let packer manage itself
    use 'wbthomason/packer.nvim'
  
    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Color scheme
    use 'catppuccin/nvim'

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
            'hrsh7th/vim-vnsip',
            'hrsh7h/cmp-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'jose-elias-alvarez/null-ls.nvim',
            'rafamadriz/friendly-snippets',
        },
    }

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
    }
    use 'simrat39/symbols-outline.nvim'
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end
    }

    -- UI stuff/other plugins
    use 'folke/which-key.nvim' 
    use 'stevearc/dressing.nvim'
    use 'ggandor/lightspeed.nvim'
    use 'akinsho/bufferline.nvim'
    use 'ThePrimeagen/harpoon'
    use 'inside/vim-search-pulse'
    use {
        'rcarriga/nvim-notfiy',
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
)
