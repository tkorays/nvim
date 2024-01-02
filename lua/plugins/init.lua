
packer.startup(function()
    use 'wbthomason/packer.nvim'

    -- ui 
    ----------------------------------------------------------------
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly',
        config = require('plugins.nvim-tree')
    }

    use {"liuchengxu/vista.vim", config = require('plugins.vista') }

    use {'gelguy/wilder.nvim', config = require('plugins.wilder')}

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = require('plugins.barbar')
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = require('plugins.lualine')
    }

    use {'akinsho/toggleterm.nvim', config = require('plugins.toggleterm')}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = require('plugins.telescope') 
    }
    ----------------------------------------------------------------


    -- theme
    ----------------------------------------------------------------
    use 'morhetz/gruvbox'

    use "EdenEast/nightfox.nvim"
    ----------------------------------------------------------------


    -- editor tools
    ----------------------------------------------------------------
    -- vim-smoothie is better than 'karb94/neoscroll.nvim'
    use 'psliwka/vim-smoothie'

    use 'tpope/vim-surround'

    -- use {'jiangmiao/auto-pairs', config = require('plugins.auto-pairs')}

    use {'preservim/nerdcommenter', config = require('plugins.nerdcommenter')}

    use 'mg979/vim-visual-multi'

    use {'junegunn/vim-easy-align', config = require('plugins.vim-easy-align')}

    use {'lfv89/vim-interestingwords', config = function()
        vim.g['interestingWordsGUIColors'] = {
            '#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b',
            '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'
        }
    end}
    ----------------------------------------------------------------


    -- git tools
    ----------------------------------------------------------------
    use {'tpope/vim-fugitive', config = require('plugins.vim-fugitive')}

    -- use {'airblade/vim-gitgutter', config = require('plugins.vim-gitgutter')}

    use { 'kdheepak/lazygit.nvim', config = require('plugins.lazygit')}
    ----------------------------------------------------------------


    -- Language specific
    ----------------------------------------------------------------
    use {'neovim/nvim-lspconfig', config = require('plugins.nvim-lspconfig')}

    use {'dense-analysis/ale', config = require('plugins.ale')}

    use {'fatih/vim-go', run = ':GoUpdateBinaries', config = require('plugins.vim-go')}

    use 'rust-lang/rust.vim'

    use {'nvim-treesitter/nvim-treesitter', run = '<cmd>TSUpdate', config = require('plugins.nvim-treesitter')}

    use 'puremourning/vimspector'

    use 'alepez/vim-gtest'

    use {'Civitasv/cmake-tools.nvim', config=require('plugins.cmake-tools')}
    ----------------------------------------------------------------


    -- code complementation
    ----------------------------------------------------------------
    use {'sirver/ultisnips', config = require('plugins.ultisnips')}

    use 'honza/vim-snippets'

    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-buffer'

    use 'hrsh7th/cmp-path'

    use 'hrsh7th/cmp-cmdline'

    -- for ultisnips
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    use {'hrsh7th/nvim-cmp', config = require('plugins.nvim-cmp')}
    ----------------------------------------------------------------


    -- for markdown
    ----------------------------------------------------------------
    use {'ekickx/clipboard-image.nvim', config = require('plugins.clipboard-image')}

    use {'plasticboy/vim-markdown'}

    use 'godlygeek/tabular'

    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        config = require('plugins.markdown-preview')
    }
    ----------------------------------------------------------------
end)

-- use {
--     'glepnir/galaxyline.nvim',
--     branch = 'main',
--     requires = {'kyazdani42/nvim-web-devicons', opt = false},
--     config = function()
--         require('plugins.bubbles')
--     end
-- }

