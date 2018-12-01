scene = {}

function scene:new()
  local newScene = {}
  setmetatable(newScene, self)
  self.__index = self

  return newScene
end


function scene:load() end
function scene:update(dt) end
function scene:onEvent(e) end
function scene:draw() end
function scene:reset() end

return scene
