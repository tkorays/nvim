return function()
    vim.api.nvim_set_keymap('n', '<leader>mm', ':MarkdownPreview<CR>', {noremap = true, silent =  true})
    vim.api.nvim_set_keymap('n', '<leader>ms', ':MarkdownPreviewStop<CR>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>mt', ':MarkdownPreviewToggle<CR>', {noremap = true, silent = true})
end
