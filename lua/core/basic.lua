
local opts = {
    fileencoding = 'utf-8',
    encoding = 'utf-8',

    -- nocompatible = true,
    -- backspace = 2,

    number = true,
    autoindent = true,
    smartindent = true,

    laststatus = 2,
    hlsearch = true,
    ignorecase = true,
    ruler = true,
    cursorline = true,

    t_Co = 256,

    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    tags = './.tags,.tags',
    redrawtime = 10000,
    colorcolumn = 120,

    -- nobackup = true,
    -- nowritebackup = true,

    termguicolors = true,

    history = 1000,
    undofile = true,
    swapfile = false,

    lazyredraw = true,
}

for k, v in pairs(opts) do
    vim.o[k] = v
end

vim.cmd [[syntax on]]
vim.cmd [[filetype off]]
vim.cmd [[filetype plugin on]]
vim.cmd [[highlight clear LineNr]]
vim.cmd [[highlight clear SignColumn]]
vim.cmd [[set colorcolumn=120]]

vim.cmd("let mapleader = ' '")
-- navigate in windows
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', {})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', {})
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', {})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', {})
vim.api.nvim_set_keymap('n', '<c-p>', '<c-w>p', {})


vim.api.nvim_set_keymap('n', '<leader>xq', ':q<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>xQ', ':qa!<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>xw', ':w<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>zb', 'vi{zf', {})

-- goto method
vim.api.nvim_set_keymap('n', '<leader>gmm', '[m', {})
vim.api.nvim_set_keymap('n', '<leader>gme', ']m', {})

--  for diff
vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //3<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //2<CR>', {})

