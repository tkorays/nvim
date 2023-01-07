return function()
    vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
    vim.g.vista_default_executive = 'ctags'
    vim.g.vista_executive_for = {
        cpp = 'nvim_lsp',
        vimwiki = 'toc',
        pandoc = 'toc',
        markdown = 'toc'
    }
    vim.g.vista_sidebar_position = "vertical topleft"
    vim.g.vista_sidebar_width = 36
    vim.g.vista_disable_statusline = true
    vim.g.vista_enable_markdown_extension = true
    vim.g['vista#renderer#enable_icon'] = true
    vim.g['vista#renderer#icons'] = {
        functions = "  ",
        variable = "  ",
        maps = "  ",
        members = "  ",
        classes = "  ",
    }
    vim.g['vista#renderer#icons']['function'] = "  "
    vim.g['vista#renderer#icons']['autocommand groups'] = " 祐 "
    -- register `tt` for toggle tagbar
    vim.api.nvim_set_keymap('n', '<leader>tt', ':Vista!!<CR>', {silent = true})
end
