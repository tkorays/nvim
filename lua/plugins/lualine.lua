return function()
    -- lualine has sections as show below.
    -- +-------------------------------------------------+
    -- | A | B | C                             X | Y | Z |
    -- +-------------------------------------------------+
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'gruvbox',
            -- '  '
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            -- section_separators = { left = "", right = ""},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        -- configurations for section A/B/C/X/Y/Z
        sections = {
            lualine_a = {
                {
                    'mode',
                    color = {bg='#ff8800'},
                    separator = { right = ''},

                }
            },
            lualine_b = {
                {
                    'branch',
                    color={bg='#65a380'},
                    separator = { right = ''},
                },
                {'diff'},
                {'diagnostics'}
            },
            lualine_c = {
                {'filename', color={fg='#c678dd'}}
            },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        -- configurations for inactive buffer sections
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end
