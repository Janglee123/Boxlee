home = {}

function home:load()
    self.playFont = love.graphics.newFont('asset/fonts/Quicksand-Regular.ttf', unit*5)
    self.userFont = love.graphics.newFont('asset/fonts/Quicksand-Regular.ttf', unit*1.5)
    self.textFont = love.graphics.newFont('asset/fonts/Quicksand-Medium.ttf', unit*3)
    self.titleFont = love.graphics.newFont('asset/fonts/Quicksand-Bold.ttf', unit*5)
    self.playButton = button:new(width/2, height/2, unit*7 ,"Play", purple, self.playFont)
    self.userButton = button:new(width/2  + 10*unit*math.cos(math.pi/4), height/2 - 10*unit*math.sin(math.pi/4), unit*2 , "User", lua_blue,self.userFont )
    self.storeButton = button:new(width/2  + 10*unit*math.cos(math.pi/9), height/2 - 10*unit*math.sin(math.pi/9), unit*2 , "Store", lua_blue,self.userFont)
    self.angel = 0
end

function home:reset()

end

function home:draw()

    love.graphics.setColor(clime)
    for i = 1 , 30 do
        love.graphics.arc("line","open" ,width/2, height/2 , unit*9 , i*math.pi/15 +self.angel , i*math.pi/15 + math.pi/30 +self.angel  )
    end

    self.playButton:draw()
    self.userButton:draw()
    self.storeButton:draw()
    love.graphics.setColor(caqua)
    love.graphics.setFont(self.textFont)
    love.graphics.printf("Highscore "..game.highscore, 0, math.floor(height/2 + unit*15), width, "center")
    love.graphics.setColor(coreng)
    love.graphics.setFont(self.titleFont)
    love.graphics.printf("Böxlee", 0,math.floor(height/2 - unit*20) ,width,"center")
end

function home:update(dt)

    if self.playButton:isPressed() then
        changeSceneTo('game')
    end

    if self.userButton:isPressed() then
        changeSceneTo('user')
    end

    if self.storeButton:isPressed() then
        changeSceneTo('store')
    end

    self.angel = self.angel + dt/4
end

return home
