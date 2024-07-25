return function()
    local util = require("lspconfig/util")
    local lspconfig = require('lspconfig')


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

    local opts = { noremap=true, silent=true }
    require("which-key").add({
        { "<leader>s", group = "LSP" },
        { "<leader>sA", function() vim.diagnostic.remove_workspace_folder(opts) end, desc = "remove_workspace_folder" },
        { "<leader>sD", function() vim.lsp.buf.declaration(opts) end, desc = "goto declaration" },
        { "<leader>s[", function() vim.diagnostic.goto_prev(opts) end, desc = "prev diagnostic error" },
        { "<leader>s]", function() vim.diagnostic.goto_next(opts) end, desc = "next diagnostic error" },
        { "<leader>sa", function() vim.diagnostic.add_workspace_folder(opts) end, desc = "add_workspace_folder" },
        { "<leader>sd", function() vim.lsp.buf.definition(opts) end, desc = "goto definition" },
        { "<leader>sf", function() vim.lsp.buf.format() end, desc = "format" },
        { "<leader>sh", function() vim.lsp.buf.hover() end, desc = "hover" },
        { "<leader>sl", function() vim.diagnostic.setloclist(opts) end, desc = "Open Local List" },
        { "<leader>so", function() vim.diagnostic.open_float(opts) end, desc = "Open float" },
        { "<leader>sr", function() vim.lsp.buf.rename() end, desc = "rename symboles" },
    })
end
