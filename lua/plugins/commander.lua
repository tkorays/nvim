return function()

    local commander = require('commander')
    commander.setup {
        components = {
            'DESC',
            'KEYS',
            'CMD',
            'CAT'
        },
        sort_by = {
            'DESC',
            'KEYS',
            'CMD',
            'CAT'
        },
        prompt_title = 'Commander'
    }

    commander.add({
        {
            desc = 'cmake-build',
            cmd = '<CMD>CMakeBuild<CR>',
        },
        {
            desc = 'cmake-configure',
            cmd = '<CMD>CMakeGenerate<CR>',
        },
        {
            desc = 'cmake-run',
            cmd = '<CMD>CMakeRun<CR>',
        },
        {
            desc = 'cmake-run-test',
            cmd = '<CMD>CMakeRunTest<CR>',
        },
        {
            desc = 'cmake-select-build-target',
            cmd = '<CMD>CMakeSelectBuildTarget<CR>',
        },
        {
            desc = 'cmake-select-build-type',
            cmd = '<CMD>CMakeSelectBuildType<CR>',
        },
        {
            desc = 'cmake-select-launch-target',
            cmd = '<CMD>CMakeSelectLaunchTarget<CR>',
        },
        {
            desc = 'cmake-settings',
            cmd = '<CMD>CMakeSettings<CR>',
        },
        {
            desc = 'cmake-clean',
            cmd = '<CMD>CMakeClean<CR>',
        },
        {
            desc = 'cmake-gtest',
            cmd = '<CMD>Telescope gtest<CR>',
        },
        {
            desc = 'cmake-open-executor',
            cmd = '<CMD>CMakeOpenExecutor<CR>',
        },
        {
            desc = 'cmake-close-executor',
            cmd = '<CMD>CMakeCloseExecutor<CR>',
        },
        {
            desc = 'cmake-open-runner',
            cmd = '<CMD>CMakeOpenRunner<CR>',
        },
        {
            desc = 'cmake-close-runner',
            cmd = '<CMD>CMakeCloseRunner<CR>',
        },

        {
            desc = 'git-blame',
            cmd = '<CMD>Git blame<CR>'
        },
        {
            desc = 'git-toggle-current-line-blame',
            cmd = '<CMD>Gitsigns toggle_current_line_blame<CR>',
        },
        {
            desc = 'git-commits',
            cmd = '<CMD>Telescope git_commits<CR>'
        },

        {
            desc = 'markdown-preview',
            cmd = '<cmd>MarkdownPreview<cr>'
        },
        {
            desc = 'markdown-preview-stop',
            cmd = '<cmd>MarkdownPreviewStop<cr>'
        },
        {
            desc = 'markdown-preview-toggle',
            cmd = '<cmd>MarkdownPreviewToggle<cr>'
        },

        {
            desc = 'rename-symbol',
            cmd = '<leader>sr',
            keys = { 'n', '<leader>sr' }
        },

        {
            desc = 'show-buffers',
            cmd = '<leader>fb',
            keys = { 'n', '<leader>fb' }
        },

        {
            desc = 'switch-colorscheme',
            cmd = '<CMD>Telescope colorscheme<CR>'
        },
        {
            desc = 'live-grep',
            cmd = '<CMD>Telescope live_grep<CR>'
        },
        {
            desc = 'emoji',
            cmd = '<CMD>Telescope emoji<CR>'
        },
        {
            desc = 'lazygit',
            cmd = '<CMD>LazyGit<CR>'
        },
        {
            desc = 'workspace-symbols',
            cmd = '<leader>fS',
            keys = { 'n', '<leader>fS' },
        },
        {
            desc = 'document-symbols',
            cmd = '<leader>fs',
            keys = { 'n', '<leader>fs' },
        },
        {
            desc = 'toggle-terminal',
            cmd = '<CMD>ToggleTerm<CR>',
        },

        {
            desc = 'lsp-info',
            cmd = '<CMD>LspInfo<CR>',
        },
        {
            desc = 'lsp-start',
            cmd = '<CMD>LspStart<CR>',
        },
        {
            desc = 'lsp-stop',
            cmd = '<CMD>LspStop<CR>',
        },
        {
            desc = 'lsp-restart',
            cmd = '<CMD>LspRestart<CR>',
        },
        {
            desc = 'lsp-log',
            cmd = '<CMD>LspLog<CR>',
        },
        {
            desc = 'code action',
            cmd = function() vim.lsp.buf.code_action() end
        },
        {
            desc = 'open-recent',
            cmd = function() require('telescope').extensions.recent_files.pick() end
        },
        {
            desc = 'neotest-open-summary',
            cmd = function()
                require('neotest').summary.open()
            end
        },
        {
            desc = 'neotest-close-summary',
            cmd = function()
                require('neotest').summary.close()
            end
        },
        {
            desc = 'neotest-toggle-summary',
            cmd = function()
                require('neotest').summary.toggle()
            end
        },
        {
            desc = 'neotest-run-near',
            cmd = function()
                require('neotest').run.run()
            end
        },
        {
            desc = 'current filename',
            cmd = "<CMD>f<CR>"
        },
        {
            desc = 'trouble-diag-toggle',
            cmd = '<CMD>Trouble diagnostics toggle<CR>'
        },
        {
            desc = 'overseear-toggle',
            cmd = '<CMD>OverseerToggle<CR>'
        },
        {
            desc = 'overseear-run',
            cmd = '<CMD>OverseerRun<CR>'
        },
        {
            desc = 'lspsage-outline',
            cmd = '<CMD>Lspsage outline<CR>'
        },
        {
            desc = 'lspsage-incoming-calls',
            cmd = '<CMD>Lspsage incoming_calls<CR>'
        },
        {
            desc = 'lspsage-outging-calls',
            cmd = '<CMD>Lspsage outgoing_calls<CR>'
        },
        {
            desc = 'lspsage-code-action',
            cmd = '<CMD>Lspsaga code_action<CR>'
        }
    }, {})

    require("which-key").add({
        { "<leader>f", group = "Telescope keymaps" },
        { "<leader>fa", "<cmd>Telescope commander<CR>", desc = "Commander" },
    })

end

