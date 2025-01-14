require("lazy").setup({

    -- ui 
    ----------------------------------------------------------------
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        -- tag = 'nightly',
        config = require('plugins.nvim-tree'),
        cond = not vim.g.vscode
    },

    {
        "liuchengxu/vista.vim",
        config = require('plugins.vista'),
        cond = not vim.g.vscode
    },

    {
        'gelguy/wilder.nvim',
        build = ':UpdateRemotePlugins',
        config = require('plugins.wilder'),
        cond = not vim.g.vscode
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = require('plugins.barbar'),
        cond = not vim.g.vscode
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = require('plugins.lualine'),
        cond = not vim.g.vscode
    },

    {
        'akinsho/toggleterm.nvim',
        config = require('plugins.toggleterm'),
        cond = not vim.g.vscode
    },
    {
        'stevearc/overseer.nvim',
        opts = {},
        config = require("plugins.overseer")
    },
    {
        -- code runner
        "michaelb/sniprun",
        branch = "master",
        -- mac users should compiple with rust toolchains
        build = "sh install.sh",
        config = require('plugins.sniprun'),
    },
    {
        "CRAG666/code_runner.nvim",
        config = require('plugins.code_runner'),
    },

    {
        -- ui hooks for vim.ui.select and vim.ui.input
        'stevearc/dressing.nvim',
    },

    {
        'nvim-telescope/telescope-ui-select.nvim'
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'smartpde/telescope-recent-files',
            "nvim-telescope/telescope-frecency.nvim",
        },
        config = require('plugins.telescope'),
        cond = not vim.g.vscode
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
        config = require('plugins.flash')
    },

    {
        'adoyle-h/telescope-extension-maker.nvim',
        config = require('plugins.telescope-extension-maker'),
        dependencies = { 'alepez/vim-gtest', 'Civitasv/cmake-tools.nvim'}
    },
    {
        "FeiyouG/commander.nvim",
        config = require('plugins.commander')
    },
    {
        's1n7ax/nvim-window-picker',
        config = function()
            require'window-picker'.setup()
        end,
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
    -- {
    --     'rmagatti/auto-session',
    --     lazy = false,
    --     dependencies = {
    --         'nvim-telescope/telescope.nvim',
    --     },
    --     opts = {
    --         auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
    --         silent_restore = false
    --     }
    -- },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 0.85
            }
        },
        config = require('plugins.zenmode')
    },
    ----------------------------------------------------------------

    -- theme
    ----------------------------------------------------------------
    {'morhetz/gruvbox', config = function()
        vim.cmd [[colorscheme gruvbox]]
        vim.cmd [[hi! Normal ctermbg=NONE guibg=NONE]]
        vim.cmd [[hi! NonText ctermbg=NONE guibg=NONE]]
    end},

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
        vim.g['interestingWordsTermColors'] = {
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

    {
        'kdheepak/lazygit.nvim',
        config = require('plugins.lazygit'),
        cond = not vim.g.vscode
    },
    ----------------------------------------------------------------


    -- Language specific
    ----------------------------------------------------------------
    {
        'neovim/nvim-lspconfig',
        config = require('plugins.nvim-lspconfig'),
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig',
            'nvimdev/lspsaga.nvim',
        }
    },

    {'dense-analysis/ale', config = require('plugins.ale')},

    -- {'fatih/vim-go', build = ':GoUpdateBinaries', config = require('plugins.vim-go')},

    'rust-lang/rust.vim',

    {'nvim-treesitter/nvim-treesitter', build = '<cmd>TSUpdate', config = require('plugins.nvim-treesitter')},

    'puremourning/vimspector',

    'alepez/vim-gtest',

    {
        'Civitasv/cmake-tools.nvim',
        config=require('plugins.cmake-tools'),
        cond = not vim.g.vscode,
    },
    {
        "folke/trouble.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
    },
    { "folke/neodev.nvim", opts = {}, config = require('plugins.neodev')},
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "alfaix/neotest-gtest",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
        },
        config = require("plugins.neotest"),
        lazy = true
    },
    { "nvim-neotest/nvim-nio" },
    ----------------------------------------------------------------

    -- code complementation
    ----------------------------------------------------------------
    {'sirver/ultisnips', config = require('plugins.ultisnips')},


    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = require('plugins.nvim-cmp'),
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- for ultisnips
            'quangnguyen30192/cmp-nvim-ultisnips',
            'honza/vim-snippets',
        }
    },
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

    -- extensions
    {
        -- use enter to select emoji and use `p` to paste this emoji
        'xiyaowong/telescope-emoji.nvim',
    },
    {
        "uga-rosa/translate.nvim",
        config = function()
            require("translate").setup({
                default = {
                    -- command = "deepl_pro",
                },
                preset = {
                    output = {
                        split = {
                            append = true,
                        },
                    },
                },
            })
            vim.api.nvim_set_keymap('v', '<A-t>', '<cmd>Translate ZH<CR>', {})
        end
    }
})

-- {
--     'glepnir/galaxyline.nvim',
--     branch = 'main',
--     requires = {'kyazdani42/nvim-web-devicons', opt = false},
--     config = function()
--         require('plugins.bubbles')
--     end
-- }

