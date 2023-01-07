return function()
    local telescope = require('telescope')
    telescope.setup {
        defaults = {
            -- layout_strategy = 'cursor',
            layout_config = {
                width = 0.95,
                height = 0.95,
            },
            -- use ripgrep as grep tool
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--trim",
            }
        },
        pickers = {
            -- use fd to find file
            find_files = {
                find_command = { "fd", "-g" , "--ignore-case", "--type", "f" }
            },
        }
    }
    local no_preview = function()
        return require('telescope.themes').get_dropdown({
            borderchars = {
                { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            },
            layout_config = {
                width = 0.95,
                height = 0.5,
            },
            show_line = true,
            fname_width = 70,
            previewer = false,
            prompt_title = false
        })
    end

    -- key binding
    vim.keymap.set('n', '<leader>s', function() require"telescope.builtin".find_files(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fg', function() require"telescope.builtin".grep_string(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fb', function() require"telescope.builtin".buffers(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fs', function() require"telescope.builtin".lsp_document_symbols(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fh', function() require"telescope.builtin".help_tags(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fo', function() require"telescope.builtin".resume(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fm', function() require"telescope.builtin".marks(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fi', function() require"telescope.builtin".lsp_implementations(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fr', function() require"telescope.builtin".lsp_references(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fc', function() require"telescope.builtin".lsp_incoming_calls(no_preview()) end, {})
    vim.keymap.set('n', '<leader>fC', function() require"telescope.builtin".lsp_outgoing_calls(no_preview()) end, {})
end
