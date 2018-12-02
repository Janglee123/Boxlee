store  = scene:new()
function store:load()
    self.textFont = love.graphics.newFont('asset/fonts/Quicksand-Medium.ttf', unit*2)
    self.homeFont = love.graphics.newFont('asset/fonts/Quicksand-Regular.ttf', unit*1.5)
    self.jumpTimeUpdateButton = button:new(width/4, height/2, unit*6 ,"Jump\nTime", green, self.textFont)
    self.jumpWidthUpdateButton = button:new(3*width/4, height/2, unit*6 ,"Jump\nWidth", green, self.textFont)
    self.homebutton = button:new( unit*3, unit*3, unit*2.5, "Home", cred, self.homeFont)
end

function store:reset()
    if user.coin  > user.jumpTimeLevel*500 then

    end
    if user.coin  > user.jumpWidthLevel*500 then

    end
end

function store:update(dt)

    if user.coin  > (user.jumpTimeLevel+1)*updateCost and user.jumpTimeLevel < 5 then
            if self.jumpTimeUpdateButton:isPressed() then
                user:updateJumpTime()
        end
    end
    if user.coin  > (user.jumpWidthLevel+1)*updateCost and user.jumpWidthLevel < 5 then
        if self.jumpWidthUpdateButton:isPressed() then
            user:updateJumpWidth()
        end
    end

    if self.homebutton:isPressed() then
        sm:changeSceneTo('home')
    end

end

function store:draw()
    self.jumpTimeUpdateButton:draw()
    self.jumpWidthUpdateButton:draw()
    self.homebutton:draw()
    love.graphics.setColor(dark_green)
    love.graphics.setLineWidth(unit/1.75)
    love.graphics.arc("line","open", width/4, height/2, unit*6 , 0, 2*math.pi*(user.jumpTimeLevel/5))
    love.graphics.arc("line","open", 3*width/4, height/2, unit*6 , 0, 2*math.pi*(user.jumpWidthLevel/5))
    love.graphics.setColor(green)
    love.graphics.setFont(self.textFont)
    if user.jumpTimeLevel < 5 then
        love.graphics.printf("Cost\n"..(user.jumpTimeLevel+1)*updateCost, math.floor(width/4-unit*6), math.floor(height/2+unit*7), unit*12, 'center')
    else
        love.graphics.printf("Full", math.floor(width/4-unit*6), math.floor(height/2+unit*7), unit*12, 'center')
    end

    if user.jumpWidthLevel < 5 then
        love.graphics.printf("Cost\n"..(user.jumpWidthLevel+1)*updateCost, math.floor(3*width/4-unit*6), math.floor(height/2+unit*7), unit*12, 'center')
    else
        love.graphics.printf("Full", math.floor(width/4-unit*6), math.floor(height/2+unit*7), unit*12, 'center')
    end

    love.graphics.setLineWidth(1)
end

return store
