return function()
    -- require("zen-mode").toggle({
    --     window = {
    --         width = .85 -- width will be 85% of the editor width
    --     }
    -- })
    require("which-key").add({
        { "<leader>zz", "<cmd>ZenMode<cr>", desc = "enter/leave zen mode" },
    })
end
