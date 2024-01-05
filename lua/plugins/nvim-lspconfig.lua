return function()
    local util = require("lspconfig/util")
    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup {
    }
    lspconfig.lua_ls.setup {}
    vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>ClangdSwitchSourceHeader<CR>', {})
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
    -- use telescope to search references and implementations
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    local opts = { noremap=true, silent=true }
    -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', '<leader>gn', vim.lsp.diagnostic.goto_next, opts)
    -- vim.keymap.set('n', '<leader>gp', vim.lsp.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>xf', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<leader>xa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>xr', vim.lsp.buf.remove_workspace_folder, opts)
end
