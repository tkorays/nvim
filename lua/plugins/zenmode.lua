return function()
    -- require("zen-mode").toggle({
    --     window = {
    --         width = .85 -- width will be 85% of the editor width
    --     }
    -- })
    require("which-key").add({
        { "<leader>x", group = "Execute" },
        { "<leader>xz", "<cmd>ZenMode<cr>", desc = "enter/leave zen mode" },
    })
end
