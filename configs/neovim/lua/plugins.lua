return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"

    -- EDITING
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'williamboman/mason.nvim',

        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',

        'jay-babu/mason-nvim-dap.nvim',
        'mfussenegger/nvim-dap',

        'jose-elias-alvarez/null-ls.nvim',
        'jay-babu/mason-null-ls.nvim',
    }

    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
    }

    use({
        "L3MON4D3/LuaSnip",
        tag = "v1.*",
        run = "make install_jsregexp"
    })

    use 'numToStr/Comment.nvim'

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
        'glepnir/lspsaga.nvim',
        branch = 'main',
    }

    use 'gpanders/editorconfig.nvim'

    use 'powerman/vim-plugin-ruscmd'

    -- LOOK AND FEEL
    use { 'dracula/vim', as = 'dracula' }
    use 'glepnir/dashboard-nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind.nvim'

    -- NAVIGATION
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use 'ludovicchabant/vim-gutentags'

    use 'ggandor/leap.nvim'
end)
