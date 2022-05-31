local plugins = {}

plugins.setup = function()
    packer.startup(function()
        use 'wbthomason/packer.nvim'

        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons',
            },
            tag = 'nightly',
            config = function()
                require('nvim-tree').setup {
                    view = {
                        width = 40,
                        side = 'left',
                    },
                    filters = {
                        dotfiles = false,
                        custom = {},
                        exclude = {},
                    },
                    git = {
                        enable = true,
                        ignore = true,
                        timeout = 400,
                    }
                }
                vim.g['nvim_tree_icons'] = {
                    default= "",
                    symlink= "",
                    git= {
                        unstaged= "✗",
                        staged= "✓",
                        unmerged= "",
                        renamed= "➜",
                        untracked= "★",
                        deleted= "",
                        ignored= "◌"
                    },
                    folder= {
                        arrow_open= "",
                        arrow_closed= "",
                        default= "",
                        open= "",
                        empty= "",
                        empty_open= "",
                        symlink= "",
                        symlink_open= "",
                    }
                }
                -- register `te` for toggle nvim-tree
                vim.api.nvim_set_keymap('n', '<leader>te', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
            end
        }

        use {"liuchengxu/vista.vim", config = function()
            vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
            vim.g.vista_default_executive = 'ctags'
            vim.g.vista_executive_for = {
                cpp = 'nvim_lsp',
                vimwiki = 'toc',
                pandoc = 'toc',
                markdown = 'toc'
            }
            vim.g.vista_sidebar_position = "vertical topleft"
            vim.g.vista_sidebar_width = 36
            vim.g.vista_disable_statusline = true
            vim.g.vista_enable_markdown_extension = true
            vim.g['vista#renderer#enable_icon'] = true
            vim.g['vista#renderer#icons'] = {
                functions = "  ",
                variable = "  ",
                maps = "  ",
                members = "  ",
                classes = "  ",
            }
            vim.g['vista#renderer#icons']['function'] = "  "
            vim.g['vista#renderer#icons']['autocommand groups'] = " 祐 "
            -- register `tt` for toggle tagbar
            vim.api.nvim_set_keymap('n', '<leader>tt', ':Vista!!<CR>', {silent = true})
        end}

        -- vim-smoothie is better than 'karb94/neoscroll.nvim'
        use 'psliwka/vim-smoothie'

        use {
            'romgrk/barbar.nvim',
            requires = {'kyazdani42/nvim-web-devicons'},
            config = function()
                vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferPrevious<CR>', {silent = true})
                vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferNext<CR>', {silent = true})
            end
        }

        use {
            'gelguy/wilder.nvim',
            config = function()
                local wilder = require('wilder')
                wilder.setup({
                    modes = {':', '/', '?'},
                })
                wilder.set_option('renderer', wilder.popupmenu_renderer(
                    wilder.popupmenu_border_theme({
                        highlights = {
                            border = 'Normal', -- highlight to use for the border
                        },
                        border = 'rounded',
                    })
                ))
            end,
        }

        use {
            'akinsho/toggleterm.nvim',
            config = function()
                require("toggleterm").setup{
                    -- size can be a number or function which is passed the current terminal
                    size = function(term)
                        if term.direction == "horizontal" then
                            return 20
                        elseif term.direction == "vertical" then
                            return vim.o.columns * 0.5
                        end
                    end,
                    open_mapping = [[<c-\>]],
                    hide_numbers = true, -- hide the number column in toggleterm buffers
                    shade_filetypes = {},
                    shade_terminals = false,
                    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                    start_in_insert = true,
                    insert_mappings = false, -- whether or not the open mapping applies in insert mode
                    persist_size = true,
                    direction = 'vertical',
                    close_on_exit = true, -- close the terminal window when the process exits
                    shell = vim.o.shell, -- change the default shell
                }
            end
        }

        use {'lfv89/vim-interestingwords', config = function()
            vim.g['interestingWordsGUIColors'] = {
                '#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b',
                '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'
            }
        end}

        use { 
            'glepnir/galaxyline.nvim',
            branch = 'main',
            requires = {'kyazdani42/nvim-web-devicons', opt = false},
            config = function()
                require('plugins.bubbles')
            end
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
            config = function()
                local telescope = require('telescope')
                telescope.setup {
                    defaults = {
                        -- layout_strategy = 'cursor',
                        layout_config = {
                            width = 0.95,
                            height = 0.95,
                        },
                        -- use ripgrep as grep tool
                        vimgrep_arguments = {
                            "rg",
                            "--color=never",
                            "--no-heading",
                            "--with-filename",
                            "--line-number",
                            "--column",
                            "--smart-case",
                            "--trim",
                        }
                    },
                    pickers = {
                        -- use fd to find file
                        find_files = {
                            find_command = { "fd", "-g" , "--ignore-case", "--type", "f" }
                        },
                    }
                }

                -- key binding
                -- `ff` for find files
                -- `fg` for find by grep
                -- `fb` for find buffers
                -- `fs` for find symbols in current buffer 
                -- `fh` for find help tags
                -- `fr` for open recent finding
                vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {})
                vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope grep_string<CR>', {})
                vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {})
                vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<CR>', {})
                vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {})
                vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope resume<CR>', {})
                vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Telescope marks<CR>', {})
            end
        }

        use {'tpope/vim-fugitive', config = function()
            -- `ob` for open git blame sidebar
            vim.api.nvim_set_keymap('n', '<leader>ob', '<cmd>Git blame<CR>', {})
        end}
        use {'airblade/vim-gitgutter', config = function()
            vim.cmd [[autocmd BufWritePost * GitGutter]]
        end}
        
        use { 'kdheepak/lazygit.nvim', config = function()
            vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'}
            vim.g.lazygit_floating_window_use_plenary = true

            vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<CR>', {})            
        end}

        use {'jiangmiao/auto-pairs', config = function()
            vim.g['AutoPairsFlyMode'] = false
            vim.g['AutoPairsShortcutBackInsert'] = '<C-b>'
        end}

        use {'preservim/nerdcommenter', config = function()
            vim.g['NERDSpaceDelims'] = true
            vim.g['NERDCompactSexyComs'] = false
            vim.g['NERDDefaultAlign'] = 'left'
            vim.g['NERDAltDelims_java'] = true
            vim.g['NERDCustomDelimiters'] = {
                c = {left = '/**', right = '*/'}
            }
            vim.g['NERDCommentEmptyLines'] = true
            vim.g['NERDTrimTrailingWhitespace'] = true
            vim.g['NERDToggleCheckAllLines'] = true
        end}
        use 'mg979/vim-visual-multi'
        use {'junegunn/vim-easy-align', config = function()
            vim.api.nvim_set_keymap('x', 'ea', '<Plug>(EasyAlign)', {noremap = false, silent = true})
            vim.api.nvim_set_keymap('n', 'ea', '<Plug>(EasyAlign)', {noremap = false, silent = true})
        end}

        use 'morhetz/gruvbox'
        use 'puremourning/vimspector'
        use 'alepez/vim-gtest'

        use 'rust-lang/rust.vim'

        use {
            'neovim/nvim-lspconfig',
            config = function()
                local util = require "lspconfig/util"
                local lspconfig = require('lspconfig')
                lspconfig.ccls.setup {
                    init_options = {
                        cache = {
                            directory = '/tmp/ccls/cache',
                        },
                        highlight = { lsRanges = true },
                    }
                }
                lspconfig.gopls.setup {
                    cmd = {'gopls', 'serve'},
                    filetypes = {'go', 'gomod'},
                    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                        },
                    },
                }
                lspconfig.pyright.setup{
                }

                local on_attach = function(client)
                    require'completion'.on_attach(client)
                end
                lspconfig.rust_analyzer.setup {
                    on_attach=on_attach,
                    settings = {
                        ["rust-analyzer"] = {
                            assist = {
                                importGranularity = "module",
                                importPrefix = "self",
                            },
                            cargo = {
                                loadOutDirsFromCheck = true
                            },
                            procMacro = {
                                enable = true
                            },
                        }
                    }

                }


                vim.diagnostic.config ({
                    virtual_text = false
                })
                vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {silent = true})
                vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {silent = true})
                vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {silent = true})
                vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {silent = true})
                vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', {silent = true})
                vim.api.nvim_set_keymap('n', '<leader>gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', {silent = true})
                vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', {silent = true})
                vim.api.nvim_set_keymap('n', '<leader>ge', '<cmd>lua vim.diagnostic.open_float()<cr>', {silent = true})
            end
        }

        use {'dense-analysis/ale', config = function()
            vim.g['ale_cpp_ccls_init_options'] = {
                cacheDirectory = '/tmp/ccls/cache',
                cacheFormat = 'binary',
                diagnostics = {
                    onOpen = 0,
                    opChange = 1000,
                }
            }
            vim.g['ale_set_quick_fix'] = true
            vim.g['ale_open_list'] = true
            vim.g['ale_lint_on_enter'] = false
            vim.g['ale_lint_on_text_change'] = false
            vim.g['ale_lint_on_save'] = false
            vim.g['ale_cpp_cpplint_executable'] = 'cpplint'
            vim.g['ale_cpp_cpplint_options'] = '--linelength=120 --filter="-legal/copyright"'
            vim.g['ale_linters'] = {
                cpp = {'cpplint'},
                c = {'cpplint'},
                python = {'pylint'},
                rust= {'analyzer'}
            }
            vim.g['ale_fixers'] = {
                cpp = {'clang-format'}
            }
            vim.g['ale_completion_enabled'] = false
            vim.g['ale_sign_error'] = '✗'
            vim.g['ale_sign_warning'] = '⚠'
            vim.g['ale_cpp_clangd_executable'] = 'clangd'

            vim.api.nvim_set_keymap('n', '<leader>xl', ':ALELint<CR>', {silent = true})
            vim.api.nvim_set_keymap('n', '<leader>gd', ':ALEDetail<CR>', {silent = true})
        end}

        use {'fatih/vim-go', run = ':GoUpdateBinaries', config = function()
            vim.g.go_fmt_command="goimports"
            vim.g.go_info_mode='gopls'
            vim.g.go_def_mode='gopls'
            vim.g.go_rename_command='gopls'
            vim.g.go_referrers_mode='gopls'
            vim.g.go_autodetect_gopath=true
            vim.g.go_list_type="quickfix"
            vim.g.go_version_warning=true
            vim.g.go_highlight_types=true
            vim.g.go_highlight_fields=true
            vim.g.go_highlight_functions=true
            vim.g.go_highlight_function_calls=true
            vim.g.go_highlight_operators=true
            vim.g.go_highlight_extra_types=true
            vim.g.go_highlight_methods=true
            vim.g.go_highlight_generate_tags=true
            vim.g.go_highlight_function_parameters = true
            vim.g.go_highlight_build_constraints = true
            vim.g.godef_split=2
            vim.cmd [[autocmd FileType qf wincmd J]]
        end}

        use {'nvim-treesitter/nvim-treesitter', run = '<cmd>TSUpdate', config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'bash', 'c', 'cpp', 'go', 'python', 'rust', 'vim', 'json', 'lua', 'norg'
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
            }
        end}

        -- code complementation
        use {'sirver/ultisnips', config = function()
            vim.g['UltiSnipsExpandTrigger'] = '<tab>'
            vim.g['UltiSnipsJumpForwardTrigger'] = '<c-n>'
            vim.g['UltiSnpisJumpBackwardTrigger'] = '<c-p>'
            vim.g['UltiSnipsSnippetDirectories'] = {"UltiSnips", "PrivateSnips"}
        end}
        use 'honza/vim-snippets'

        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        -- for ultisnips
        use 'quangnguyen30192/cmp-nvim-ultisnips'
        use {'hrsh7th/nvim-cmp', config = function()
            local cmp = require('cmp')
            cmp.setup {
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'ultisnips' },
                }, {
                    { name = 'buffer' },
                })
            }
        end}

        use 'godlygeek/tabular'

        use { 'nvim-neorg/neorg', after = 'nvim-treesitter', config = function()
            require('neorg').setup {
                load = {
                    ['core.defaults'] = {},
                    ['core.norg.dirman'] = {
                        config = {
                            workspaces = {
                                work = '~/notes/work',
                                home = '~/notes/home',
                            }
                        }
                    }
                }
            }
        end}

    end)
end



return plugins
