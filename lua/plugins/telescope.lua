return function()
    local telescope = require('telescope')
    local telescope_pickers = require('plugins.telescope-pickers')
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
                find_command = { "fd" , "--ignore-case", "--type", "file" }
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
                width = 0.80,
                height = 0.618,
            },
            show_line = true,
            fname_width = 70,
            previewer = false,
            prompt_title = false
        })
    end

    -- key binding
    local ts = require("telescope.builtin")

    -- use ctrl-p to find files
    require("which-key").add({
        {"<leader>o", function() telescope_pickers.prettyFilesPicker({ picker = 'find_files', options = no_preview() }) end, desc="Find files"},
    })

    require("which-key").add({
            -- f = {function() ts.find_files(no_preview()) end, "Find files"},
            { "<leader>f", group = "Telescope keymaps" },
            {"<leader>ff", function() telescope_pickers.prettyFilesPicker({ picker = 'find_files', options = no_preview() }) end, desc="Find files"},
            {"<leader>fg", function() ts.grep_string(no_preview()) end, desc="Grep string"},
            {"<leader>fb", function() ts.buffers(no_preview()) end, desc="Show buffers"},
            {"<leader>fs", function() ts.lsp_document_symbols(no_preview()) end, desc="document Symbols"},
            {"<leader>fS", function() ts.lsp_workspace_symbols(no_preview()) end, desc="Workspace Symbols"},
            {"<leader>fh", function() ts.help_tags(no_preview()) end, desc="Help tags"},
            {"<leader>fo", function() ts.resume(no_preview()) end, desc="resume"},
            {"<leader>fm", function() ts.marks(no_preview()) end, desc="marks"},
            {"<leader>fi", function() ts.lsp_implementations(no_preview()) end, desc="Implementations"},
            {"<leader>fr", function() ts.lsp_references(no_preview()) end, desc="LSP reference"},
            {"<leader>fc", function() ts.lsp_incoming_calls(no_preview()) end, desc="imcoming calls"},
            {"<leader>fC", function() ts.lsp_outgoing_calls(no_preview()) end, desc="outgong calls"},
            {"<leader>fd", function() ts.diagnostics({bufnr=0}) end, desc="diagnostic"},
            {"<leader>ft", function() ts.treesitter() end, desc="treesitter"},
    })


    -- load extensions
    telescope.load_extension("cmake_tools")
    telescope.load_extension("emoji")
    telescope.load_extension("ui-select")
    telescope.load_extension("recent_files")
    telescope.load_extension("frecency")

end
