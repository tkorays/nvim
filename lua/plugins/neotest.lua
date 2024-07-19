return function()
    local utils = require("neotest-gtest.utils")
    local lib = require("neotest.lib")

    require("neotest").setup({
        adapters = {
            -- require("neotest-python")({
            --     dap = { justMyCode = false },
            -- }),
            -- require("neotest-plenary"),
            -- require("neotest-vim-test")({
            --     ignore_file_types = { "python", "vim", "lua" },
            -- }),

            require("neotest-gtest").setup({
                -- find the root project
                root = lib.files.match_root_pattern(
                    "compile_commands.json",
                    "compile_flags.txt",
                    "WORKSPACE",
                    ".clangd",
                    "init.lua",
                    "init.vim",
                    "build",
                    ".git"
                ),

                -- filter directories for search test files
                filter_dir = function(name, rel_path, root)
                    if string.find(rel_path, "third_party") then
                        return false
                    end
                    if string.find(rel_path, "out") then
                        return false
                    end
                    if string.find(rel_path, "build") then
                        return false
                    end
                    if string.find(rel_path, "cmake") then
                        return false
                    end
                    return true
                end,

                -- is this file a test file 
                is_test_file =function(file_path)
                    local kw = {
                        '_test.cc', '_test.cpp', '_unittest.cc', '_unittest.cpp',
                    }
                    if string.find(file_path, "test_") == 1 then
                        return true
                    end

                    for k, v in ipairs(kw) do
                        if string.find(file_path, v, 1, true) then
                            return true
                        end
                    end

                    return false
                end,
                summary_view = {
                    header_length = 80,
                    shell_palette = {
                        passed = "\27[32m",
                        skipped = "\27[33m",
                        failed = "\27[31m",
                        stop = "\27[0m",
                        bold = "\27[1m",
                    },
                },
            }),
        },
    })
end
