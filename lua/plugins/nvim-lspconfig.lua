return function()
    local util = require("lspconfig/util")
    local lspconfig = require('lspconfig')

    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'lua_ls',
            'jsonls',
            'pyright',
        }
    })
    require('lspsaga').setup({})


    -- config LSP for C/C++ with `clangd`
    lspconfig.clangd.setup {
        root_dir = util.root_pattern('.clang-format',
                                     '.clang-tidy',
                                     'compile_commands.json',
                                     '.git'),
    }

    -- lspconfig.lua_ls.setup {}
    require("which-key").add({
        { "<leader>x", group = "Execute" },
        { "<leader>xs", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch source header" },
    })

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

    local signs = {
        Error = " ",
        Warning = " ",
        Warn = " ",
        Hint = "💡",
        Information = " ",
        Info = " "
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local opts = { noremap=true, silent=true }
    require("which-key").add({
        { "<leader>s", group = "LSP" },
        -- { "<leader>ss", '<CMD>Lspsaga show_buf_diagnostics<CR>', desc = "show buf diagnostic" },
        -- { "<leader>sS", '<CMD>Lspsaga show_workspace_diagnostics<CR>', desc = "show workspace diagnostic" },
        -- { "<leader>sj", '<CMD>Lspsaga diagnostic_jump_next<CR>', desc = "next diagnostic" },
        -- { "<leader>sk", '<CMD>Lspsaga diagnostic_jump_prev<CR>', desc = "prev diagnostic" },

        { "<leader>sa", function() vim.diagnostic.add_workspace_folder(opts) end, desc = "add_workspace_folder" },
        { "<leader>sA", function() vim.diagnostic.remove_workspace_folder(opts) end, desc = "remove_workspace_folder" },
        { "<leader>sd", function() vim.lsp.buf.definition(opts) end, desc = "goto definition" },
        { "<leader>sD", function() vim.lsp.buf.declaration(opts) end, desc = "goto declaration" },
        { "<leader>sp", '<CMD>Lspsaga peek_type_definition<CR>', desc = "peek definition" },
        { "<leader>sf", function() vim.lsp.buf.format() end, desc = "format" },
        { "<leader>sc", '<CMD>Lspsaga code_action<CR>', desc = "code action" },
        { "<leader>sh", '<CMD>Lspsaga hover_doc<CR>', desc = "hover" },
        -- { "<leader>so", '<CMD>Lspsaga show_line_diagnostics<CR>', desc = "Open float" },
        { "<leader>sr", function() vim.lsp.buf.rename() end, desc = "rename symboles" },

        -- { "<leader>sl", function() vim.diagnostic.setloclist(opts) end, desc = "Open Local List" },
        -- { "<leader>sj", function() vim.diagnostic.goto_prev(opts) end, desc = "prev diagnostic error" },
        -- { "<leader>sk", function() vim.diagnostic.goto_next(opts) end, desc = "next diagnostic error" },
        -- { "<leader>sc", function() vim.lsp.buf.code_action() end, desc = "code action" },
        -- { "<leader>so", function() vim.diagnostic.open_float(opts) end, desc = "Open float" },
        -- { "<leader>sh", function() vim.lsp.buf.hover() end, desc = "hover" },
    })
    require("which-key").add({
        { "<leader>d", group="diagnostic" },
        { "<leader>do", '<CMD>Lspsaga show_buf_diagnostics<CR>', desc = "show buf diagnostic" },
        { "<leader>dO", '<CMD>Lspsaga show_workspace_diagnostics<CR>', desc = "show workspace diagnostic" },
        { "<leader>dj", '<CMD>Lspsaga diagnostic_jump_next<CR>', desc = "next diagnostic" },
        { "<leader>dk", '<CMD>Lspsaga diagnostic_jump_prev<CR>', desc = "prev diagnostic" },
        { "<leader>dl", '<CMD>Lspsaga show_line_diagnostics<CR>', desc = "Open float" },
    })
end
