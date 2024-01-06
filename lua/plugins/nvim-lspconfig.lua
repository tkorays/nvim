return function()
    local util = require("lspconfig/util")
    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup {
    }
    lspconfig.lua_ls.setup {}
    -- vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>ClangdSwitchSourceHeader<CR>', {})
    require("which-key").register({
        x = {
            name = "Execute",
            s = {"<cmd>ClangdSwitchSourceHeader<cr>", "Switch source header"}
        }
    }, { prefix="<leader>" })

    -- lspconfig.ccls.setup {
    --     init_options = {
    --         cache = {
    --             directory = '.ccls-cache',
    --         },
    --         highlight = { lsRanges = true },
    --     }
    -- }
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
        -- require'completion'.on_attach(client)
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

    local opts = { noremap=true, silent=true }
    require("which-key").register({
        s = {
            name = "LSP",
            o = {function() vim.diagnostic.open_float(opts) end, "Open float"},
            l = {function() vim.diagnostic.setloclist(opts) end, "Open Local List"},
            a = {function() vim.diagnostic.add_workspace_folder(opts) end, "add_workspace_folder"},
            A = {function() vim.diagnostic.remove_workspace_folder(opts) end, "remove_workspace_folder"},
            ["["] = {function() vim.diagnostic.goto_prev(opts) end, "prev diagnostic error"},
            ["]"] = {function() vim.diagnostic.goto_next(opts) end, "next diagnostic error"},
            d = {function() vim.lsp.buf.definition(opts) end, "goto definition"},
            D = {function() vim.lsp.buf.declaration(opts) end, "goto declaration"},
            h = {function() vim.lsp.buf.hover(opts) end, "hover"},
            r = {function() vim.lsp.buf.rename() end, "rename symboles"},
            f = {function() vim.lsp.buf.format() end, "format"},
            -- use telescope to search references, symbols and implementations
        }
    }, { prefix="<leader>" })
end
