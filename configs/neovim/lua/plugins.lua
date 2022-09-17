return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- EDITING
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use "mhartington/formatter.nvim"

    use 'numToStr/Comment.nvim'

    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
    }

    use 'powerman/vim-plugin-ruscmd'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }

    use "gpanders/editorconfig.nvim"

    use {
        "glepnir/lspsaga.nvim",
        branch = "main"
    }

    -- JAVA
    use 'mfussenegger/nvim-jdtls'

    -- CLOJURE
    use 'Olical/conjure'

    use 'tpope/vim-dispatch'
    use 'clojure-vim/vim-jack-in'
    use 'radenling/vim-dispatch-neovim'

    -- RESCRIPT
    use 'rescript-lang/vim-rescript'

    -- LOOK AND FEEL
    use { 'dracula/vim', as = 'dracula' }
    use 'glepnir/dashboard-nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind.nvim'

    -- DEBUGGING
    use { 'mfussenegger/nvim-dap' }

    -- NAVIGATION
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use 'ludovicchabant/vim-gutentags'

    use 'ggandor/leap.nvim'
end)
