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
    local ts = require("telescope.builtin")
    require("which-key").register({
        f = {
            name = "Telescope keymaps",
            f = {function() ts.find_files(no_preview()) end, "Find files"},
            g = {function() ts.grep_string(no_preview()) end, "Grep string"},
            b = {function() ts.buffers(no_preview()) end, "Show buffers"},
            s = {function() ts.lsp_document_symbols(no_preview()) end, "document Symbols"},
            S = {function() ts.lsp_workspace_symbols(no_preview()) end, "Workspace Symbols"},
            h = {function() ts.help_tags(no_preview()) end, "Help tags"},
            o = {function() ts.resume(no_preview()) end, "resume"},
            m = {function() ts.marks(no_preview()) end, "marks"},
            i = {function() ts.lsp_implementations(no_preview()) end, "Implementations"},
            r = {function() ts.lsp_references(no_preview()) end, "LSP reference"},
            c = {function() ts.lsp_incoming_calls(no_preview()) end, "imcoming calls"},
            C = {function() ts.lsp_outgoing_calls(no_preview()) end, "outgong calls"},
        }
    }, { prefix = "<leader>" })
end
