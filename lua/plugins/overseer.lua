return function()
    require("overseer").setup({
        strategy = {
            "toggleterm",
            -- use_shell = true,
            direction = 'horizontal',
            -- quit_on_exit = "never",
            -- close_on_exit = false,
            -- open_on_start = true,
        },
        templates = {
            'builtin',
            'python.run_current_file',
        }
    })
end
