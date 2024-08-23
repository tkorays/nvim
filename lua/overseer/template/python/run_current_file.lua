return {
    name = "python-run",
    builder = function()
        local file = vim.fn.expand("%:p")
        local root_dir = require("lspconfig/util").root_pattern('.git')(file)
        return {
            cmd = { "python" },
            args = { file },
            cwd = root_dir,
            env = {
                PYTHONPATH = root_dir
            },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "python" },
    },
}
