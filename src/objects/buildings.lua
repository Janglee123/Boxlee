building = {}

function building:load(x,y,w,vel,acc)
    local b = {}
    setmetatable(b, self)
    self.__index = self

    b.x  = x;
    b.y = y
    b.w = w
    b.h = height - b.y + 10
    b.vel = vel
    b.acc = acc


    if math.random() > 0.5 then b.color = pink
    else b.color = blue end

    return b
end

function building:draw()
    love.graphics.setColor(self.color) --self.hue,1,0.5
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, radius*2, radius*2)
    local color
    if self.color == blue then color = pink
    else color = blue end


end

function building:update(dt)
    self.x = self.x - self.vel*dt
    self.vel = self.vel + self.acc*dt
end

function building:reset(x,y,w,vel,acc)

    self.x = x
    self.y = y
    self.w = w
    self.h = height - self.y + 10
    self.vel = vel
    self.acc = acc

    if math.random() > 0.5 then
        self.color = pink
    else
        self.color = blue
    end


end

buildings = {}

function buildings:load()
    self.n = 3
    self.lastB = self.n

    self.h = height/1.90
    self.hd = width/6
    self.w = unit*15
    self.gap = unit*10

    self.vel = width/2
    self.acc = width/100
    self.da = width/15500

    self[1] = building:load( -5 , self.h , width , self.vel , self.acc )
    self[1].color = player.color

    for i = 2,self.n do
        local x =  self[i-1].x + self[i-1].w + self.gap
        local y =  self.h + math.random( -self.hd, self.hd )
        self[i] = building:load( x, y, self.w, self.vel, self.acc )
    end
end

function buildings:reset(vel,acc)
    self.lastB = self.n
    if not vel then
        self.vel = width/2
    else
        self.vel = vel
    end

    if not acc then
        self.acc = width/100
    else
        self.acc = acc
    end

    self[1] = building:load( -5 , self.h , width , self.vel , self.acc )
    self[1].color = player.color

    for i = 2,self.n do
        local x =  self[i-1].x + self[i-1].w + self.gap
        local y =  self.h + math.random( -self.hd, self.hd )
        self[i] = building:load( x, y, self.w, self.vel, self.acc )
    end
end


function buildings:update(dt)
    for i = 1,self.n do
        self[i]:update(dt)

        if self[i].x + self[i].w < -5 then
            local x = self[self.lastB].x + self[self.lastB].w + self.gap
            local y = self.h + math.random( -self.hd , self.hd )
            self[i]:reset( x, y, self.w  , self.vel, self.acc )
            self.lastB = i
        end
    end

    self.vel = self.vel + self.acc*dt
    self.acc = self.acc - self.da*dt
    if self.acc < 0.19 then
        self.da = 0
        self.acc = 0.20000
    end

end

function buildings:draw()
    for i = 1,self.n do
        self[i]:draw()
    end
end

return buildings
