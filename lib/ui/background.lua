cloud = {}

function cloud:new( x, y, v )
    local c = {}
    setmetatable(c, cloud)
    self.__index = self

    c.x = x
    c.y = y

    c.v = v

    c.w = math.random(3,5)*unit*1.5
    c.h = unit*1.5

    c.wu = math.random(1,2)*unit*1.5
    c.xu = c.x + math.random( c.wu/2 ,c.w - c.wu)
    c.yu = c.y - c.h

    c.r = unit/3

    local cc = math.random(1,7)

    if cc  <=  1 then c.color = cred
    elseif cc  <=  2 then c.color = coreng
    elseif cc  <=  3 then c.color = cyellow
    elseif cc <= 4 then c.color = clime
    elseif cc <= 5 then c.color = cgreen
    elseif cc <= 6 then c.color = caqua
    elseif cc <= 7 then c.color = cpurple end

    return c
end

function cloud:reset()
    self.x, self.y, self.v = width,math.random(unit*2 , height), math.random(unit,unit*5)

    self.w = math.random(3,5)*unit*1.5
    self.h = unit*1.5

    self.wu = math.random(1,2)*unit*1.5
    self.xu = self.x + math.random( self.wu/2 ,self.w - self.wu)
    self.yu = self.y - self.h

    local cc = math.random(1,7)

    if cc  <=  1 then self.color = cred
    elseif cc  <=  2 then self.color = coreng
    elseif cc  <=  3 then self.color = cyellow
    elseif cc <= 4 then self.color = clime
    elseif cc <= 5 then self.color = cgreen
    elseif cc <= 6 then self.color = caqua
    elseif cc <= 7 then self.color = cpurple end

end

function cloud:update(dt)
    self.x = self.x - self.v*dt
    self.xu = self.xu - self.v*dt
end

function cloud:draw()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3], 0.3)
    love.graphics.rectangle("fill",self.x,self.y,self.w,self.h , self.h/2 )
    love.graphics.rectangle("fill", self.xu, self.yu, self.wu, self.h , self.h/2)
end

clouds = {}
clouds.n = 15

function clouds:load()
    for i = 1 , self.n do
        self[i] = cloud:new(math.random(0,width),math.random(unit*2 , height) , math.random(unit,unit*5))
    end
end

function clouds:update(dt)
    for i = 1 , self.n do
        self[i]:update(dt)

        if self[i].x + self[i].w < -10 then
            self[i]:reset()
        end

    end
end

function clouds:draw()
    for i = 1 , self.n do self[i]:draw() end
end

return clouds
