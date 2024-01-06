return function()
    -- vim.api.nvim_set_keymap('n', '<leader>mm', ':MarkdownPreview<CR>', {noremap = true, silent =  true})
    -- vim.api.nvim_set_keymap('n', '<leader>ms', ':MarkdownPreviewStop<CR>', {noremap = true, silent = true})
    -- vim.api.nvim_set_keymap('n', '<leader>mt', ':MarkdownPreviewToggle<CR>', {noremap = true, silent = true})
    require("which-key").register({
        m = {
            name = "Markdown",
            m = {"<cmd>MarkdownPreview<cr>", "Markdown Preview"},
            s = {"<cmd>MarkdownPreviewStop<cr>", "Stop Preview markdown"},
            t = {"<cmd>MarkdownPreviewToggle<cr>", "Toggle Markdown Preview"}
        }
    }, { prefix="<leader>" })
end
