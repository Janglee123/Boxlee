require 'lib/scene'
require 'lib/stack'
sceneManager = {}

function sceneManager:load()

    self.scenes = {}

    self.stack = stack:create()

    local files = love.filesystem.getDirectoryItems( 'lib/scenes/' );
    for k, file in ipairs(files) do
        sname = string.gsub(file,'.lua','')
        self.scenes[sname] = require ('lib/scenes/'..sname)
        print(sname);
        self.scenes[sname]:load()
    end

end

function sceneManager:update(dt)
    self.scenes[ self.currentScene ]:update(dt)
    self.scenes[ self.currentScene ]:onEvent(e)
end

function sceneManager:draw()
    self.scenes[ self.currentScene ]:draw()
end

function sceneManager:changeSceneTo(scene)
    self.stack:push(scene)
    self.currentScene = scene
    self.scenes[scene]:reset()
end

function sceneManager:changeSceneToPrevious()
    self.currentScene = self.stack:pop()
    self.scenes[scene]:reset()
end

return sceneManager
