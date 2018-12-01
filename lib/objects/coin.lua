coin={}

function coin:load()
    self.n = user.coin or 0
    self.w = unit
    self.h = unit
    self.sw = unit/2
    self.sh = unit/2
    self.font = love.graphics.newFont('asset/fonts/Quicksand-Bold.ttf', unit*2)
    self.a = 0
end

function coin:update (dt)
    self.a = self.a + dt
    self.n = user.coin
end

function coin:draw (x, y)
    local x = width - self.font:getWidth(self.n) - unit*2
    local y = unit*2
    love.graphics.setColor(cyellow)
    love.graphics.ellipse("fill", x, y, self.w*math.sin(self.a), self.h, 1000)
    love.graphics.setColor(coreng)
    love.graphics.setLineWidth(unit/1.75)
    love.graphics.ellipse("line", x, y, self.sw*math.sin(self.a), self.sh,1000)
    love.graphics.setFont(self.font)
    love.graphics.setLineWidth(1)
    love.graphics.print(self.n, x + 1.25*self.w , y - self.font:getHeight()/2)
end

return coin
