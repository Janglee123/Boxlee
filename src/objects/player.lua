player = {}

function player:load()

    self.x = width/7
    self.y = 0
    self.w = 2.2*unit
    self.h = self.w;
    self.minH = self.w;
    self.a = self.w*self.w;
    self.r = radius/1.5

    self.gravity = 0
    self.vel = 0
    self.jumpVel = 0
    self.jumpWidth = unit*15 + user.jumpWidthLevel*unit
    self.jumpHeight = unit*16 + user.jumpTimeLevel*unit
    -- math and physics dont touch it
    self.gravityConst = 8*self.jumpHeight/(self.jumpWidth*self.jumpWidth)
    self.jumpVelConst = 4*self.jumpHeight/self.jumpWidth

    self.grounded = false

    if math.random() > 0.5 then self.color = pink
    else self.color = blue end

end

function player:reset()
    self.y = 0
    self.vel = 0
end

function player:update(dt,velX)
    self.gravity = self.gravityConst*velX*velX
    self.jumpVel = self.jumpVelConst*velX
    self.h = self.minH + math.floor(math.abs(self.vel)/75)
    self.w = self.a/self.h

    if not self.grounded then
        self.y = self.y + self.vel*dt
        self.vel = self.vel + self.gravity*dt
    else
        self.vel = 0
    end

end

function player:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle('fill', self.x, self.y,self.w , self.h , self.r , self.r)

end

function player:changeColor()
    if self.color == blue then self.color = pink
    else self.color = blue end
end

function player:jump()
    if self.grounded then
        self.y = self.y - 1
        self.vel = -self.jumpVel
    end
end

return player
