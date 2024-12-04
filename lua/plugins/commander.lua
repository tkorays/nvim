return function()

    local commander = require('commander')
    commander.setup {
        components = {
            'DESC',
            -- 'KEYS',
            'CMD',
            'CAT'
        },
        sort_by = {
            'DESC',
            -- 'KEYS',
            'CMD',
            'CAT'
        },
        prompt_title = 'QuicCmd',
        separator = " ",
        auto_replace_desc_with_cmd = true,
        integration = {
            telescope = {
                enable = true
            },
            lazy = {
                enable = false
            }
        }
    }

    commander.add({
        {
            desc = '[CMake]build',
            cmd = '<CMD>CMakeBuild<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]configure',
            cmd = '<CMD>CMakeGenerate<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]run',
            cmd = '<CMD>CMakeRun<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]run-test',
            cmd = '<CMD>CMakeRunTest<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]select-build-target',
            cmd = '<CMD>CMakeSelectBuildTarget<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]select-build-type',
            cmd = '<CMD>CMakeSelectBuildType<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]select-launch-target',
            cmd = '<CMD>CMakeSelectLaunchTarget<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]settings',
            cmd = '<CMD>CMakeSettings<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]clean',
            cmd = '<CMD>CMakeClean<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]gtest',
            cmd = '<CMD>Telescope gtest<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]open-executor',
            cmd = '<CMD>CMakeOpenExecutor<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]close-executor',
            cmd = '<CMD>CMakeCloseExecutor<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]open-runner',
            cmd = '<CMD>CMakeOpenRunner<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]close-runner',
            cmd = '<CMD>CMakeCloseRunner<CR>',
            cat = 'CMake'
        },
        {
            desc = '[CMake]copy-target-path',
            cmd = function()
                local cmake = require('cmake-tools')
                if (cmake.is_cmake_project()) then
                    local bin_path = cmake.get_launch_path(cmake.get_launch_target())..'/'..cmake.get_launch_target()
                    vim.fn.setreg('+', bin_path)
                end
            end,
            cat = 'CMake'
        },

        {
            desc = '[Git]blame',
            cmd = '<CMD>Git blame<CR>',
            cat = 'Git'
        },
        {
            desc = '[Git]toggle-current-line-blame',
            cmd = '<CMD>Gitsigns toggle_current_line_blame<CR>',
            cat = 'Git'
        },
        {
            desc = '[Git]commits',
            cmd = '<CMD>Telescope git_commits<CR>',
            cat = 'Git'
        },

        {
            desc = '[Markdown]preview',
            cmd = '<cmd>MarkdownPreview<cr>',
            cat = 'Markdown'
        },
        {
            desc = '[Markdown]preview-stop',
            cmd = '<cmd>MarkdownPreviewStop<cr>',
            cat = 'Markdown'
        },
        {
            desc = '[Markdown]preview-toggle',
            cmd = '<cmd>MarkdownPreviewToggle<cr>',
            cat = 'Markdown'
        },

        {
            desc = '[LSP]rename-symbol',
            cmd = function() vim.lsp.buf.rename() end,
            cat = 'LSP'
        },

        {
            desc = '[Telescope]show-buffers',
            cmd = '<leader>fb',
            keys = { 'n', '<leader>fb' },
            cat = 'Telescope'
        },

        {
            desc = '[Telescope]change colorscheme',
            cmd = '<CMD>Telescope colorscheme<CR>',
            cat = 'Telescope'
        },
        {
            desc = '[Telescope]live-grep',
            cmd = '<CMD>Telescope live_grep<CR>',
            cat = 'Telescope'
        },
        {
            desc = '[Telescope]emoji',
            cmd = '<CMD>Telescope emoji<CR>',
            cat = 'Telescope'
        },
        {
            desc = '[Git]lazygit',
            cmd = '<CMD>LazyGit<CR>',
            cat = 'Git'
        },
        {
            desc = '[Telescope]workspace-symbols',
            cmd = '<leader>fS',
            keys = { 'n', '<leader>fS' },
            cat = 'Telescope'
        },
        {
            desc = '[Telescope]document-symbols',
            cmd = '<leader>fs',
            keys = { 'n', '<leader>fs' },
            cat = 'Telescope'
        },
        {
            desc = '[Terminal]toggle',
            cmd = '<CMD>ToggleTerm<CR>',
            cat = 'Telescope'
        },

        {
            desc = '[LSP]lsp-info',
            cmd = '<CMD>LspInfo<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]start',
            cmd = '<CMD>LspStart<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]stop',
            cmd = '<CMD>LspStop<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]restart',
            cmd = '<CMD>LspRestart<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]log',
            cmd = '<CMD>LspLog<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]code action',
            cmd = function() vim.lsp.buf.code_action() end,
            cat = 'LSP'
        },
        {
            desc = '[Telescope]open-recent',
            cmd = function() require('telescope').extensions.recent_files.pick() end,
            cat = 'Telescope'
        },
        {
            desc = '[Telescope]marks',
            cmd = '<CMD>Telescope marks<CR>',
            cat = 'Telescope'
        },
        {
            desc = '[NeoTest]open-summary',
            cmd = function()
                require('neotest').summary.open()
            end,
            cat = 'NeoTest'
        },
        {
            desc = '[NeoTest]close-summary',
            cmd = function()
                require('neotest').summary.close()
            end,
            cat = 'NeoTest'
        },
        {
            desc = '[NeoTest]toggle-summary',
            cmd = function()
                require('neotest').summary.toggle()
            end,
            cat = 'NeoTest'
        },
        {
            desc = '[NeoTest]run-near',
            cmd = function()
                require('neotest').run.run()
            end,
            cat = 'NeoTest'
        },
        {
            desc = '[Core]current filename',
            cmd = "<CMD>f<CR>"
        },
        {
            desc = '[Trouble]diag-toggle',
            cmd = '<CMD>Trouble diagnostics toggle<CR>',
            cat = 'Trouble'
        },
        {
            desc = '[OverSeerTask]toggle',
            cmd = '<CMD>OverseerToggle<CR>',
            cat = 'Overseer'
        },
        {
            desc = '[OverSeerTask]run',
            cmd = '<CMD>OverseerRun<CR>',
            cat = 'Overseer'
        },
        {
            desc = '[LSP]outline-toggle',
            cmd = '<CMD>Lspsaga outline<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]incoming-calls',
            cmd = '<CMD>Lspsaga incoming_calls<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]outging-calls',
            cmd = '<CMD>Lspsaga outgoing_calls<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]code-action-saga',
            cmd = '<CMD>Lspsaga code_action<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]diag-file-saga',
            cmd = '<CMD>Lspsaga show_buf_diagnostics<CR>'
        },
        {
            desc = '[LSP]diag-workspace-saga',
            cmd = '<CMD>Lspsaga show_workspace_diagnostics<CR>',
            cat = 'LSP'
        },
        {
            desc = '[LSP]find-reference-saga',
            cmd = '<CMD>Lspsaga finder<CR>',
            cat = 'LSP'
        },
        {
            desc = '[ALE]enable',
            cmd = '<CMD>ALEEnable<CR>',
            cat = 'ALE',
        },
        {
            desc = '[ALE]disable',
            cmd = '<CMD>ALEDisable<CR>',
            cat = 'ALE',
        },
        {
            desc = '[ALE]toggle',
            cmd = '<CMD>ALEToggle<CR>',
            cat = 'ALE',
        },
        {
            desc = '[ALE]enable-for-buffer',
            cmd = '<CMD>ALEEnableBuffer<CR>',
            cat = 'ALE',
        },
        {
            desc = '[ALE]disable-for-buffer',
            cmd = '<CMD>ALEDisableBuffer<CR>',
            cat = 'ALE',
        },
        {
            desc = '[ALE]toggle-buffer',
            cmd = '<CMD>ALEToggleBuffer<CR>',
            cat = 'ALE',
        },
    }, {})

    require("which-key").add({
        { "<leader>q", "<cmd>Telescope commander<CR>", desc = "Quick Commander" },
        { "<M- >", "<cmd>Telescope commander<CR>", desc = "Quick Commander" },
    })

end

