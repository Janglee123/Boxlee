require 'lib/globles'
require 'lib/ui/colors'
http = require "socket.http"
utf8 = require "utf8"
bg = require 'lib/ui/background'
button = require 'lib/ui/button'
e = require 'lib/engine'

function love.load()
    e:load()
    bg:load()
    ispaused = false
    love.keyboard.setTextInput( false )
end

function love.update(dt)
    if dt<1/30 and not ispaused then
        e:update(dt)
        bg:update(dt)
    end
end

function love.draw()
    love.graphics.setBackgroundColor(255, 255, 255)
    bg:draw()
    e:draw()
end


function love.keypressed(key)

    if key == 'backspace' then
        local byteoffset = utf8.offset(user.name, -1)

        if byteoffset then
            user.name = string.sub(user.name, 1, byteoffset - 1)
        end
    end

    if key == 'return' then
        user:updateName(user.name)
        sm:changeSceneTo('home')
        love.keyboard.setTextInput( false )
    end

end

function love.textinput(t)
    if #user.name < 10 then
        user.name = user.name..t
    end
end
