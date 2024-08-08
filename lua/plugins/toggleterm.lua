return function()
    require("toggleterm").setup{
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 20
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.5
            end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = false, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
    }
    local Terminal  = require('toggleterm.terminal').Terminal
    if vim.fn.executable('ranger') == 1 then
        local ranger = Terminal:new({
            cmd = "ranger",
            direction = "float",
        })
        function _ranger_toggle()
            ranger:toggle()
        end
        vim.api.nvim_set_keymap('n', '<leader>tr', "<cmd>lua _ranger_toggle()<CR>", {noremap = true, silent = true})
    end
    if vim.fn.executable('spf') == 1 then
        local spf = Terminal:new({
            cmd = 'spf .',
            direction = "float",
        })
        function _spf_toggle()
            spf:toggle()
        end
        vim.api.nvim_set_keymap('n', '<leader>ts', "<cmd>lua _spf_toggle()<CR>", {noremap = true, silent = true})
    end

end
