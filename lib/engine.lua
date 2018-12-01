--manages scenes and etc
sm = require 'lib/sceneManager'
coin = require 'lib/objects/coin'
user = require 'lib/user'
engine = {}

function engine:load()
    user:load()
    coin:load()
    sm:load()

    if user.highscore == 0 then
        sm:changeSceneTo('user')
    else
        sm:changeSceneTo('home')
    end

end

function engine:update(dt)
    sm:update(dt)
    coin:update(dt)
end

function engine:draw()
    sm:draw()
    coin:draw()
end

return engine
