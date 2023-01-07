return function()
    vim.g['UltiSnipsExpandTrigger'] = '<tab>'
    vim.g['UltiSnipsJumpForwardTrigger'] = '<c-n>'
    vim.g['UltiSnpisJumpBackwardTrigger'] = '<c-p>'
    vim.g['UltiSnipsSnippetDirectories'] = {"UltiSnips", "PrivateSnips"}
end
