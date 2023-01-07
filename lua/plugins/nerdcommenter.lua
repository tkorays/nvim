return function()
    vim.g['NERDSpaceDelims'] = true
    vim.g['NERDCompactSexyComs'] = false
    vim.g['NERDDefaultAlign'] = 'left'
    vim.g['NERDAltDelims_java'] = true
    vim.g['NERDCustomDelimiters'] = {
        c = {left = '/**', right = '*/'}
    }
    vim.g['NERDCommentEmptyLines'] = true
    vim.g['NERDTrimTrailingWhitespace'] = true
    vim.g['NERDToggleCheckAllLines'] = true
end
