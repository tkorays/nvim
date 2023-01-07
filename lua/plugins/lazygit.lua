return function()
    vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'}
    vim.g.lazygit_floating_window_use_plenary = true

    vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<CR>', {})            
end
