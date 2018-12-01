event = require 'src/event'
game = scene:new()

function isBetween(a,b,c)
  return ( a <= c and a >= b )
end

function game:load()
    self.player = require 'src/objects/player'
    self.buildings = require 'src/objects/buildings'
    self.scoreFont = love.graphics.newFont('asset/fonts/Quicksand-Bold.ttf', unit*5)
    self.bgSound = love.audio.newSource("asset/sound/background.ogg","static")

    self.highscore = user.highscore
    self.player:load()
    self.buildings:load()

    self.currentCoin = 0
    self.score = 0
    self.lastBuilding = -1
end

function game:reset()
    self.player:reset()
    self.buildings:reset()
    self.score = 0
    self.lastBuilding = -1
    self.currentCoin = 0

end

function game:reswap()
    self.player:reset()
    self.buildings:reset(self.buildings.vel, self.buildings.acc)
    self.currentCoin = 0
end

function game:update(dt)
    self.buildings:update(dt)

    local isCollided = false
    local player = self.player

    for i = 1, self.buildings.n do

        local building = self.buildings[i]

        if isBetween(player.x, building.x, building.x + building.w )
        or isBetween(player.x + player.w, building.x, building.x + building.w) then
            --building is in scope
            if isBetween(building.y, player.y, player.y + player.w )
            or isBetween(building.y, player.y + player.w, player.y + player.w + player.vel*dt) then

                if player.color == building.color then
                    player.grounded = true
                    player.y = building.y - player.w
                    isCollided = true

                    if self.lastBuilding ~= i then
                        self.score = self.score + 1
                        self.currentCoin = self.currentCoin + 1
                        self.lastBuilding = i
                    end
                end

                break
            end
        end
    end

    if not isCollided then player.grounded = false end

    player:update( dt, self.buildings.vel )
    if event.touch.swipUp or event.mouse.button == 1 then player:jump() end
    if event.touch.swipDown or event.mouse.button == 2 then
        if not continues and not paused then player:changeColor() end
    end
    continues = event.touch.swipDown or event.mouse.button == 2

    if player.y + player.w + player.vel*dt  > height then
        if self.score > self.highscore then
            self.highscore = self.score
            love.filesystem.write("hs",self.highscore)
            user:updateHighscore(self.highscore)
        end
        self.bgSound:stop()
        user:updateCoin(self.currentCoin)
        changeSceneTo('restart')
    end

end

function game:draw()
    love.graphics.setColor(lua_blue)
    love.graphics.setFont(self.scoreFont)
    love.graphics.printf(self.score, 0, height/4 - width/4, width, "center" )

    self.buildings:draw()
    self.player:draw()

    if ispaused then
        love.graphics.setColor(1, 1, 1, 0.7)
        love.graphics.rectangle("fill", 0, 0, width, height)
    end

end



return game
