return function()
    -- vim.api.nvim_set_keymap('n', '<leader>mm', ':MarkdownPreview<CR>', {noremap = true, silent =  true})
    -- vim.api.nvim_set_keymap('n', '<leader>ms', ':MarkdownPreviewStop<CR>', {noremap = true, silent = true})
    -- vim.api.nvim_set_keymap('n', '<leader>mt', ':MarkdownPreviewToggle<CR>', {noremap = true, silent = true})
    -- require("which-key").register({
    --     m = {
    --         name = "Markdown",
    --         m = {"<cmd>MarkdownPreview<cr>", "Markdown Preview"},
    --         s = {"<cmd>MarkdownPreviewStop<cr>", "Stop Preview markdown"},
    --         t = {"<cmd>MarkdownPreviewToggle<cr>", "Toggle Markdown Preview"}
    --     }
    -- }, { prefix="<leader>" })
    require("which-key").add({
        { "<leader>m", group = "Markdown" },
        { "<leader>mm", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
        { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Preview markdown" },
        { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },
    }
    )
end
