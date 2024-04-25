return function()

    local commander = require('commander')
    commander.setup{}
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
            cmd = function() vim.lsp.buf.rename() end
        }
    }

    require("which-key").register({
        f = {
            name = "Telescope keymaps",
            a = { '<cmd>Telescope commander<CR>', 'Commander' }
        }
    }, { prefix = "<leader>" })

end

