return function()
    local maker = require('telescope-extension-maker')

    local cmake = require('cmake-tools')
    maker.register({
        name = 'gtest',
        command = function()
            Items = {}
            local gtest_bin = vim.api.nvim_get_var('gtest#gtest_command')
            if (cmake.is_cmake_project()) then
                gtest_bin = cmake.get_launch_path(cmake.get_launch_target())..'/'..cmake.get_launch_target()
                print(gtest_bin)
            end

            local jid = vim.fn.jobstart(gtest_bin..' --gtest_list_tests --gtest_color=no', { stdout_buffered = true, on_stdout = function(job_id, data) 
                for k, line in pairs(data) do
                    if(line:match('^%s+')) then
                        Items[#Items + 1] = line:gsub("^%s+", "")
                    end
                end
            end })
            vim.fn.jobwait({jid}, -1)
            Items[#Items + 1] = 'wtf'
            return Items

        end,
        onSubmit = function(item)
            if vim.tbl_islist(item) then
                error('Not support multiple selections')
            end
            local gtest_bin = vim.api.nvim_get_var('gtest#gtest_command')
            if (cmake.is_cmake_project()) then
                gtest_bin = cmake.get_launch_path(cmake.get_launch_target())..'/'..cmake.get_launch_target()
                print(gtest_bin)
            end
            vim.cmd('GTestCmd'..gtest_bin)
            print(item.text)
            vim.cmd('GTestName '..item.text)
            vim.cmd('GTestRun')
        end,
    })

end
