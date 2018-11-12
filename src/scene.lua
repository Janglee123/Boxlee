scenes = {}

function scenes:load()
    local files = love.filesystem.getDirectoryItems( 'src/scenes/' );
    for k, file in ipairs(files) do
        sname = string.gsub(file,'.lua','')
        scenes[sname] = require ('src/scenes/'..sname)
        scenes[sname]:load()
    end
end

return scenes
