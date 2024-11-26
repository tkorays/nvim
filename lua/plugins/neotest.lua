return function()
    local utils = require("neotest-gtest.utils")
    local lib = require("neotest.lib")

    -- require("neotest-plenary"),
    -- require("neotest-vim-test")({
    --     ignore_file_types = { "python", "vim", "lua" },
    -- }),


    local neotest_python = require("neotest-python")({
        dap = { justMyCode = false },
        args = {"--log-level", "DEBUG"},
        runner = "pytest",
        python = vim.g.HOME_PATH..'/.pyenv/shims/python',
        pytest_discover_instances = true,
    })
    local neotest_gtest = require("neotest-gtest").setup({
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
        debug_adapter = "codelldb",

        -- filter directories for search test files
        filter_dir = function(name, rel_path, root)
            local ignore_dirs = {"third_party", "out", "build", "cmake"}
            for i, v in ipairs(ignore_dirs) do
                if string.find(rel_path, v) then return false end
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
    })

    require("neotest").setup({
        adapters = {
            neotest_python,
            neotest_gtest,
        },
    })
end
