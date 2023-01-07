return function()
    vim.g.go_fmt_command="goimports"
    vim.g.go_info_mode='gopls'
    vim.g.go_def_mode='gopls'
    vim.g.go_rename_command='gopls'
    vim.g.go_referrers_mode='gopls'
    vim.g.go_autodetect_gopath=true
    vim.g.go_list_type="quickfix"
    vim.g.go_version_warning=true
    vim.g.go_highlight_types=true
    vim.g.go_highlight_fields=true
    vim.g.go_highlight_functions=true
    vim.g.go_highlight_function_calls=true
    vim.g.go_highlight_operators=true
    vim.g.go_highlight_extra_types=true
    vim.g.go_highlight_methods=true
    vim.g.go_highlight_generate_tags=true
    vim.g.go_highlight_function_parameters = true
    vim.g.go_highlight_build_constraints = true
    vim.g.godef_split=2
    vim.cmd [[autocmd FileType qf wincmd J]]
end
