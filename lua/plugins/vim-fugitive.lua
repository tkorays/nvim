return function()
    -- `ob` for open git blame sidebar
    vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Git blame<CR>', {})
end
