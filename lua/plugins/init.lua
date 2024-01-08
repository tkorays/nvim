require("lazy").setup({

    -- ui 
    ----------------------------------------------------------------
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly',
        config = require('plugins.nvim-tree')
    },

    {"liuchengxu/vista.vim", config = require('plugins.vista') },

    {'gelguy/wilder.nvim', build = ':UpdateRemotePlugins', config = require('plugins.wilder')},

    {
        'romgrk/barbar.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = require('plugins.barbar')
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = require('plugins.lualine')
    },

    {'akinsho/toggleterm.nvim', config = require('plugins.toggleterm')},

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
        config = require('plugins.telescope')
    },
    {
        'rcarriga/nvim-notify'
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    ----------------------------------------------------------------

    -- theme
    ----------------------------------------------------------------
    {'morhetz/gruvbox', config = function() vim.cmd [[colorscheme gruvbox]] end},

    "EdenEast/nightfox.nvim",
    ----------------------------------------------------------------

    -- editor tools
    ----------------------------------------------------------------
    -- vim-smoothie is better than 'karb94/neoscroll.nvim'
    'psliwka/vim-smoothie',

    'tpope/vim-surround',

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {'preservim/nerdcommenter', config = require('plugins.nerdcommenter')},

    'mg979/vim-visual-multi',

    {'junegunn/vim-easy-align', config = require('plugins.vim-easy-align')},

    {'lfv89/vim-interestingwords', config = function()
        vim.g['interestingWordsGUIColors'] = {
            '#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b',
            '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'
        }
    end},
    ----------------------------------------------------------------

    -- git tools
    ----------------------------------------------------------------
    {'tpope/vim-fugitive', config = require('plugins.vim-fugitive')},

    -- use {'airblade/vim-gitgutter', config = require('plugins.vim-gitgutter')}

    { "lewis6991/gitsigns.nvim", config = require("plugins.gitsigns") },

    { 'kdheepak/lazygit.nvim', config = require('plugins.lazygit')},
    ----------------------------------------------------------------


    -- Language specific
    ----------------------------------------------------------------
    {'neovim/nvim-lspconfig', config = require('plugins.nvim-lspconfig')},

    {'dense-analysis/ale', config = require('plugins.ale')},

    {'fatih/vim-go', build = ':GoUpdateBinaries', config = require('plugins.vim-go')},

    'rust-lang/rust.vim',

    {'nvim-treesitter/nvim-treesitter', build = '<cmd>TSUpdate', config = require('plugins.nvim-treesitter')},

    'puremourning/vimspector',

    'alepez/vim-gtest',

    {'Civitasv/cmake-tools.nvim', config=require('plugins.cmake-tools')},
    {
        "williamboman/mason.nvim", config = function() require("mason").setup() end
    },
    {
        "williamboman/mason-lspconfig.nvim", config = function() require("mason-lspconfig").setup() end

    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
        },
    },

    -- {
    --     "nvim-neotest/neotest",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "antoinemadec/FixCursorHold.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --         "alfaix/neotest-gtest",
    --         "nvim-neotest/neotest-go",
    --     },
    --     config = require("plugins.neotest"),
    --     lazy = true
    -- },
    ----------------------------------------------------------------

    -- code complementation
    ----------------------------------------------------------------
    {'sirver/ultisnips', config = require('plugins.ultisnips')},

    'honza/vim-snippets',

    'hrsh7th/cmp-nvim-lsp',

    'hrsh7th/cmp-buffer',

    'hrsh7th/cmp-path',

    'hrsh7th/cmp-cmdline',

    -- for ultisnips
    'quangnguyen30192/cmp-nvim-ultisnips',

    {'hrsh7th/nvim-cmp', config = require('plugins.nvim-cmp')},
    ----------------------------------------------------------------


    -- for markdown
    ----------------------------------------------------------------
    {'ekickx/clipboard-image.nvim', config = require('plugins.clipboard-image')},

    {'plasticboy/vim-markdown'},

    'godlygeek/tabular',

    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
        config = require('plugins.markdown-preview')
    },
    ----------------------------------------------------------------
})

-- {
--     'glepnir/galaxyline.nvim',
--     branch = 'main',
--     requires = {'kyazdani42/nvim-web-devicons', opt = false},
--     config = function()
--         require('plugins.bubbles')
--     end
-- }

