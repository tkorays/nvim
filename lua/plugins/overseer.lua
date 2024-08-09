return function()
    require("overseer").setup({
        strategy = {
            "toggleterm",
            use_shell = false,
            direction = 'horizontal'
        },
        templates = {
            'builtin',
            'python.run_current_file'
        }
    })
end
