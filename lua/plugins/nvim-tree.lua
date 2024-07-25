return function()
    require('nvim-tree').setup {
        view = {
            width = 40,
            side = 'left',
        },
        filters = {
            dotfiles = false,
            custom = {},
            exclude = {},
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 400,
        }
    }
    vim.g['nvim_tree_icons'] = {
        default= "",
        symlink= "",
        git= {
            unstaged= "✗",
            staged= "✓",
            unmerged= "",
            renamed= "➜",
            untracked= "★",
            deleted= "",
            ignored= "◌"
        },
        folder= {
            arrow_open= "",
            arrow_closed= "",
            default= "",
            open= "",
            empty= "",
            empty_open= "",
            symlink= "",
            symlink_open= "",
        }
    }
    -- register `te` for toggle nvim-tree
    -- vim.api.nvim_set_keymap('n', '<leader>te', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
    -- vim.api.nvim_set_keymap('n', '<leader>gc', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
    require("which-key").add({
        { "<leader>t", group = "Nvim-Tree" },
        { "<leader>tc", "<cmd>NvimTreeFindFile<cr>", desc = "show file in tree" },
        { "<leader>te", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },

    })
end
