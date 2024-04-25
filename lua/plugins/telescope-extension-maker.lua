return function()
    local marker = require('telescope-extension-maker')

    -- create a extension named hello
    -- execute :buffers and output the prints to picker
    marker.register {
        name = 'hello',
        command = ':buffers',
    }

end
