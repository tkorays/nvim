
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


-- add runtime path
vim.g.NVIMRC_PATH = vim.g.HOME_PATH..'/.config/nvim'
vim.o.runtimepath = vim.o.runtimepath..","..vim.g.NVIMRC_PATH

-- make sure that install_path existed 
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

ret, packer = pcall(require, "packer")
if not ret then
    print('failed to load packer')
    return
end

packer.init {
    git = {
        depth = 1,
        clone_timeout = 600,
    }
}

require("core")
require("plugins")


