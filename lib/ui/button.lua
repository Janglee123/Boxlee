local event = require 'lib/event'
button = {}

function dist(x1,y1,x2,y2)
    return math.sqrt( (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2))
end

function button:new(x,y,r,lable,color,font)
    local b = {}
    setmetatable(b, button)
    self.__index = self

    b.x = math.floor(x)
    b.y = math.floor(y)
    b.r = math.floor(r)
    b.color = color

    b.lable = lable

    b.font = font

    local w = b.font:getWidth(lable)

    if w > 2*r or string.match(lable,'\n') then
        b.lableY = math.floor(b.y - b.font:getHeight())
    else
        b.lableY = math.floor(b.y - b.font:getHeight()/2)
    end

    b.lableX = math.floor(b.x - b.r)

    b.isPressed_ = false

    return b
end

function button:isPressed()
    if not self.isPressed_ then
        if event.touch.pressed and dist( event.touch.x, event.touch.y, self.x, self.y ) < self.r
        or event.mouse.pressed and dist( event.mouse.x, event.mouse.y, self.x, self.y ) < self.r then
            self.isPressed_ = true
            event.touch.x, event.touch.y = nil,nil
            event.mouse.x, event.mouse.y = nil,nil
            event.touch.pressed = false
            event.mouse.pressed = false

        else
            self.isPressed_ = false
        end
    else
        self.isPressed_ = false
    end

    return self.isPressed_
end

function button:draw()
    love.graphics.setColor( self.color )
    love.graphics.setFont(self.font)
    love.graphics.circle("fill", self.x, self.y, self.r, 10000 )
    love.graphics.setColor(255,255,255)
    love.graphics.printf(self.lable, self.lableX, self.lableY , 2*self.r, "center")
end

return button
