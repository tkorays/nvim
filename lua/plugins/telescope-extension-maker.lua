return function()
    local maker = require('telescope-extension-maker')

    local cmake = require('cmake-tools')


    local get_gtest_bin = function()
        -- get gtest excutable from global variable in gtest plugin
        local gtest_bin = vim.api.nvim_get_var('gtest#gtest_command')

        -- override gtest executable from cmake-tools luanch target
        if (cmake.is_cmake_project()) then
            gtest_bin = cmake.get_launch_path(cmake.get_launch_target())..'/'..cmake.get_launch_target()
            print(gtest_bin)
        end
        return gtest_bin
    end

    local get_test_cases_from_binary = function(gtest_bin)
        Items = {}
        -- fetch gtest test case from gtest excutable
        local jid = vim.fn.jobstart(gtest_bin..' --gtest_list_tests --gtest_color=no', { stdout_buffered = true, on_stdout = function(job_id, data) 
            for k, line in pairs(data) do
                if(line:match('^%s+')) then
                    Items[#Items + 1] = line:gsub("^%s+", "")
                end
            end
        end })

        -- wait for task down
        vim.fn.jobwait({jid}, -1)

        return Items
    end

    maker.register({
        name = 'gtest',

        -- get telescope lists
        command = function()
            local gtest_bin = get_gtest_bin()
            return get_test_cases_from_binary(gtest_bin)
        end,

        -- trigger when item selected
        onSubmit = function(item)
            if vim.tbl_islist(item) then
                error('Not support multiple selections')
            end

            local gtest_bin = get_gtest_bin()

            -- set executable for gtest plugin and run test case
            vim.cmd('GTestCmd'..gtest_bin)
            vim.cmd('GTestName '..item.text)
            vim.cmd('GTestRun')
        end,
    })

end
