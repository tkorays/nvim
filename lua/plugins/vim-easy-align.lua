return function()
    vim.api.nvim_set_keymap('x', 'ea', '<Plug>(EasyAlign)', {noremap = false, silent = true})
    vim.api.nvim_set_keymap('n', 'ea', '<Plug>(EasyAlign)', {noremap = false, silent = true})
end
