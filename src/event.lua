event = {

     touch = {
        pressed = false,
        x = nil,
        y = nil,
        swipUp = false,
        swipDown = false
    },

     mouse = {
        pressed = false,
        x = nil,
        y = nil,
        button = nil
    }

}


function love.touchpressed(id, x, y, dx, dy, pressure)
     event.touch.pressed = true
     event.touch.x = x
     event.touch.y = y
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    if dy < 0 then  event.touch.swipUp = true
    elseif dy > 0 then  event.touch.swipDown = true end
end

function love.touchreleased(id, x, y, dx, dy, pressure)
     event.touch.pressed = false
     event.touch.x = nil
     event.touch.y = nil
     event.touch.swipDown = false;
	 event.touch.swipUp = false ;
end


function love.mousepressed(x, y, button, isTouch)
    if not isTouch then
         event.mouse.pressed = true
         event.mouse.x = x
         event.mouse.y = y
         event.mouse.button = button
    end
end

function love.mousereleased(x, y, button, isTouch)
     event.mouse.pressed = false
     event.mouse.x = nil
     event.mouse.y = nil
     event.mouse.button = nil
end

return event
