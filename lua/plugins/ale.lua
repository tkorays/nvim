return function()
    -- use ALE as a complementary for diagnostic
    local g = vim.g

    g.ale_set_quick_fix = true
    g.ale_open_list = false
    g.ale_lint_on_enter = true
    g.ale_lint_on_text_change = true
    g.ale_lint_on_save = true
    g.ale_cpp_cpplint_executable = 'cpplint'
    g.ale_cpp_cpplint_options = '--linelength=120 --filter="-legal/copyright"'
    g.ale_python_flake8_options = '--max-line-length=120'

    g.ale_linters = {
        -- cpp = {'cpplint'},
        -- c = {'cpplint'},
        -- rust= {'analyzer'},

        -- dep: use mason to install flake8 and pyright
        python = {'flake8', 'pyright'},

        -- dep: use mason to install lua_ls
        lua = {"lua_ls"}
    }
    g.ale_fixers = {
        -- cpp = {'clang-format'}
        python = {
            -- common fixers
            'remove_trailing_lines',
            'trim_whitespace',

            'add_blank_lines_for_python_control_statements',
            -- dep: use mason to install autopep8
            'autopep8',
            -- dep: python -m pip install autoflake
            'autoflake',
            -- dep: python -m pip install autoimport
            -- autoimport may make imports messy
            -- 'autoimport',
            -- dep: python -m pip install reorder-python-imports
            'reorder-python-imports',
        }
    }
    g.ale_fixers['*'] = {'remove_trailing_lines', 'trim_whitespace'}

    g.ale_completion_enabled = false
    g.ale_cpp_clangd_executable = 'clangd'

    g.ale_sign_error = '✗'
    g.ale_sign_warning = '⚠'
    -- just show a sign and don't show virtual text
    g.ale_virtualtext_cursor = 'disabled'
    -- vim.api.nvim_set_keymap('n', '<leader>xl', ':ALELint<CR>', {silent = true})
    -- vim.api.nvim_set_keymap('n', '<leader>gd', ':ALEDetail<CR>', {silent = true})
    require("which-key").add({
        { "<leader>d", group="diagnostic" },
        { "<leader>df", "<cmd>ALEFix<cr>", desc = "Fix diagnostic" },
    })
end
