return function()
    require('code_runner').setup({
        filetype = {
            java = {
                "cd $dir &&",
                "javac $fileName &&",
                "java $fileNameWithoutExt"
            },
            python = "python -u",
            typescript = "deno run",
            rust = {
                "cd $dir &&",
                "rustc $fileName &&",
                "$dir/$fileNameWithoutExt"
            },
            c = function(...)
                c_base = {
                    "cd $dir &&",
                    "gcc $fileName -o",
                    "/tmp/$fileNameWithoutExt",
                }
                local c_exec = {
                    "&& /tmp/$fileNameWithoutExt &&",
                    "rm /tmp/$fileNameWithoutExt",
                }
                vim.ui.input({ prompt = "Add more args:" }, function(input)
                    c_base[4] = input
                    vim.print(vim.tbl_extend("force", c_base, c_exec))
                    require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
                end)
            end,
        },
    })
    require("which-key").add({
        { "<leader>r", group = "Run Code" },
        { "<leader>rr", "<cmd>RunCode<cr>", desc = "run code" },
        { "<leader>rf", "<cmd>RunFile<cr>", desc = "run file" },
    })

end
