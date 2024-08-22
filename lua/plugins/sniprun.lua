return function()
    require("sniprun").setup({
        repl_enable = {'Python3_original'},
        interpreter_options = {
            -- pip install klepto
            Python3_original = {
                interpreter = "python3.11",
                venv = {"venv"},
            }
        },
        display = {
            "Classic",
        },
    })
end
