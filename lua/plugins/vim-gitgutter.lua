return function()
    vim.cmd [[autocmd BufWritePost * GitGutter]]
end
