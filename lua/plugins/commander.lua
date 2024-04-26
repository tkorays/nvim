return function()

    local commander = require('commander')
    commander.setup{
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
    commander.add {
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
            desc = 'workspace-symbols',
            cmd = '<leader>fS',
            keys = { 'n', '<leader>fS' },
        },
        {
            desc = 'document-symbols',
            cmd = '<leader>fs',
            keys = { 'n', '<leader>fs' },
        }
    }

    require("which-key").register({
        f = {
            name = "Telescope keymaps",
            a = { '<cmd>Telescope commander<CR>', 'Commander' }
        }
    }, { prefix = "<leader>" })

end

