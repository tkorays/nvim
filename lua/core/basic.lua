
local opts = {
    fileencoding = 'utf-8',
    encoding = 'utf-8',
    exrc = true,

    -- nocompatible = true,
    -- backspace = 2,

    number = true,
    relativenumber = true,
    autoindent = true,
    smartindent = true,

    laststatus = 2,
    hlsearch = true,
    ignorecase = true,
    ruler = true,
    cursorline = true,

    -- t_Co = 256,

    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    tags = './.tags,.tags',
    redrawtime = 10000,
    -- colorcolumn = 120,

    -- nobackup = true,
    -- nowritebackup = true,

    termguicolors = true,

    history = 1000,
    undofile = true,
    swapfile = false,

    lazyredraw = true,

    -- menuone: popup even when there's only one match
    -- noinsert: Do not insert text until a selection is made
    -- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
    completeopt = "menuone,noinsert,noselect"
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
-- install win32yank for windows
-- sync with system clipboard
vim.cmd [[set clipboard+=unnamedplus]]

vim.cmd("let mapleader = ' '")
-- navigate in windows
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', {})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', {})
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', {})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', {})
vim.api.nvim_set_keymap('n', '<c-p>', '<c-w>p', {})
-- resize windows
vim.api.nvim_set_keymap('n', '<a-up>', '<cmd>resize +2<cr>', {})
vim.api.nvim_set_keymap('n', '<a-down>', '<cmd>resize -2<cr>', {})
vim.api.nvim_set_keymap('n', '<a-left>', '<cmd>vertical resize -2<cr>', {})
vim.api.nvim_set_keymap('n', '<a-right>', '<cmd>vertical resize +2<cr>', {})
-- move lines
vim.api.nvim_set_keymap('n', '<leader>gj', '<cmd>m .+1<cr>==', {})
vim.api.nvim_set_keymap('n', '<leader>gk', '<cmd>m .-2<cr>==', {})
vim.api.nvim_set_keymap('v', '<leader>gj', ":m '>+1<cr>gv=gv", {})
vim.api.nvim_set_keymap('v', '<leader>gk', ":m '<-2<cr>gv=gv", {})


vim.api.nvim_set_keymap('n', '<leader>xq', ':q<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>xQ', ':qa!<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>xw', ':w<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>zb', 'vi{zf', {})

-- goto method
vim.api.nvim_set_keymap('n', '<leader>gmm', '[m', {})
vim.api.nvim_set_keymap('n', '<leader>gme', ']m', {})

--  for diff
-- vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //3<CR>', {})
-- vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //2<CR>', {})

