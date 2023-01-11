return function()
    require'clipboard-image'.setup {
        default = {
            img_dir = 'images',
            img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end,
            affix = '<\n %s \n>'
        }
    }
end
