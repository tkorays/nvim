return function()
    vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferPrevious<CR>', {silent = true})
    vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferNext<CR>', {silent = true})
end
