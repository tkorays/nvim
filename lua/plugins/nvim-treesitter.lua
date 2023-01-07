return function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {
            'bash', 'c', 'cpp', 'go', 'python', 'rust', 'vim', 'json', 'lua', 'norg'
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true
        },
    }
end
