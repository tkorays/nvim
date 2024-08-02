
-- get HOME_PATH
if vim.fn.has('mac') == 1 then
    vim.g.HOME_PATH = "/Users/"..vim.fn.expand('$USER')
elseif vim.fn.has('unix') == 1 then
    vim.g.HOME_PATH = "/home/"..vim.fn.expand('$USER')
elseif vim.fn.has('win32') == 1 then
    vim.g.HOME_PATH = vim.fn.expand('$HOME')..'/AppData/Local/nvim/'
else
    print("bad env!")
    vim.g.HOME_PATH = ''
    return
end

-- Set GIT_EDITOR to use nvr if Neovim and nvr are available
if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
  vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

-- add runtime path
vim.g.NVIMRC_PATH = vim.g.HOME_PATH..'/.config/nvim'
vim.o.runtimepath = vim.o.runtimepath..","..vim.g.NVIMRC_PATH

-- load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core")

