require 'src/scene'
sceneManager = {}

function sceneManager:load()

    self.scenes = {}

    local files = love.filesystem.getDirectoryItems( 'src/scenes/' );
    for k, file in ipairs(files) do
        sname = string.gsub(file,'.lua','')
        self.scenes[sname] = require ('src/scenes/'..sname)
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
    self.currentScene = scene
    self.scenes[scene]:reset()
end

return sceneManager
