--manages scenes and etc
coin = require 'src/objects/coin'
user = require 'src/user'
engine = {}

function changeSceneTo(scene)
    engine.currentScene = scene
    engine.scenes[scene]:reset()
end

function engine:load()
    self.scenes = require 'src/scene'
    user:load()
    coin:load()
    self.scenes:load()

    if user.highscore == 0 then
        changeSceneTo('user')
    else
        changeSceneTo('home')
    end

end

function engine:update(dt)
    self.scenes[ self.currentScene ]:update(dt)
    coin:update(dt)
end

function engine:draw()
    self.scenes[ self.currentScene ]:draw()
    coin:draw()
end

return engine
