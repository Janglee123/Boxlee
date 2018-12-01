restart  = scene:new()

function restart:load()
    self.replayFont = love.graphics.newFont('asset/fonts/Quicksand-Regular.ttf', unit*5)
    self.homeFont = love.graphics.newFont('asset/fonts/Quicksand-Regular.ttf', unit*1.5)
    self.textFont = love.graphics.newFont('asset/fonts/Quicksand-Light.ttf', unit*3)
    self.replaybutton = button:new( width/2, height/2, unit*10, "Replay", green, self.replayFont)
    self.reswapbutton = button:new( width/2, height/2, unit*10, "Reswap\nCost "..reswapCost, coreng, self.textFont)
    self.homebutton = button:new(unit*3, unit*3, unit*2.5, "Home", cred, self.homeFont)
    self.time = 0;
    self.isReswapble = false
end

function restart:reset()
    self.time = 0;
    if user.coin >= reswapCost then
        self.isReswapble = true
    else
        self.isReswapble = false
    end
end

function restart:draw()
    love.graphics.setFont(self.textFont)
    love.graphics.setColor(lua_blue)
    love.graphics.printf("Score "..game.score, 0, height/2 + unit*11, width, "center")
    if game.score ~= game.highScore then
        love.graphics.printf("Highscore "..game.highscore, 0, height/2 + unit*15, width, "center")
    else
        love.graphics.printf("New Highscore !", 0, height/2 - unit*15, width, "center")
    end

    if self.isReswapble then
        self.reswapbutton:draw()
        love.graphics.setLineWidth(unit)
        love.graphics.setColor(cyellow)
        love.graphics.arc("line","open", width/2, height/2, unit*10 , 0, 2*math.pi*(1-self.time/3))
        love.graphics.setLineWidth(1)

    else
        self.replaybutton:draw()
    end
    self.homebutton:draw()
end

function restart:update(dt)

    if self.isReswapble then
        if self.reswapbutton:isPressed() then
            user:updateCoin(-reswapCost)
            game:reswap()
            engine.currentScene = 'game'
        end
    else
        if self.replaybutton:isPressed() then
            changeSceneTo('game')
        end
    end
    if self.homebutton:isPressed() then
        changeSceneTo('home')
    end
    self.time = self.time + dt

    if self.time > 3 then
        self.isReswapble = false
    end
end

return restart;
