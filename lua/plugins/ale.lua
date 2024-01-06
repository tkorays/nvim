return function()
    vim.g['ale_cpp_ccls_init_options'] = {
        cacheDirectory = '.ccls-cache',
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
        rust= {'analyzer'},
        lua = {"lua_ls"}
    }
    vim.g['ale_fixers'] = {
        cpp = {'clang-format'}
    }
    vim.g['ale_completion_enabled'] = false
    vim.g['ale_cpp_clangd_executable'] = 'clangd'

    vim.g.ale_sign_error = '✗'
    vim.g.ale_sign_warning = '⚠'
    -- vim.api.nvim_set_keymap('n', '<leader>xl', ':ALELint<CR>', {silent = true})
    -- vim.api.nvim_set_keymap('n', '<leader>gd', ':ALEDetail<CR>', {silent = true})
    require("which-key").register({
        a = {
            name = "ALE",
            l = {"<cmd>ALELint<cr>", "Lint"},
            d = {"<cmd>ALEDetail<cr>", "show details"},
            f = {"<cmd>ALEFix<cr>", "Fix Lint"}
        }
    }, { prefix="<leader>" })
end
