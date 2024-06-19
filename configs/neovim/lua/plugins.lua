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

        'nvimtools/none-ls.nvim',
        'jay-babu/mason-null-ls.nvim',
    }

    use {
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'petertriho/cmp-git',
    }

    use {
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    }

    use 'norcalli/nvim-colorizer.lua'

    use 'numToStr/Comment.nvim'

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use "stevearc/conform.nvim"

    use 'github/copilot.vim'

    use { "NeogitOrg/neogit", requires = "sindrets/diffview.nvim" }

    -- LOOK AND FEEL
    use { 'dracula/vim', as = 'dracula' }
    use 'glepnir/dashboard-nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind.nvim'
    use "folke/which-key.nvim"
    use 'lewis6991/gitsigns.nvim'

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use {"akinsho/toggleterm.nvim", tag = '*' }

    use "stevearc/oil.nvim"

    -- NAVIGATION
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use "ahmedkhalf/project.nvim"

    use 'ludovicchabant/vim-gutentags'

    use 'ggandor/leap.nvim'

    use 'simrat39/symbols-outline.nvim'

    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    use {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        requires = "kkharji/sqlite.lua",
    }
end)
