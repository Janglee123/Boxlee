setting  = scene:new()

function setting:load()
    self.userFont = love.graphics.newFont('asset/fonts/Quicksand-Regular.ttf', unit*2)
    self.homeFont = love.graphics.newFont('asset/fonts/Quicksand-Regular.ttf', unit*1.5)
    self.userbutton = button:new( width/2, height/2, unit*7,user.name ,cyellow, self.userFont)
    self.homebutton = button:new( unit*3, unit*3, unit*2.5, "Home", cred, self.homeFont)
    self.leaderboard = button:new( width/2 + 12*unit*0.707106781,height/2 - 12*unit*0.707106781,unit*3,"Leader\nBoard",caqua,self.homeFont)
    self.a = 0
end

function setting:reset()end

function setting:update(dt)
    if self.userbutton:isPressed() then
        self.isVisible = true
        love.keyboard.setTextInput( true )
    end
    if self.homebutton:isPressed() then
        love.keyboard.setTextInput( false )
        changeSceneTo('home')
    end

    if self.leaderboard:isPressed() then
        love.system.openURL( 'https://boxlee.glitch.me/?id='..user.id )
    end
    self.userbutton.lable = user.name
    self.a = self.a + dt*2
end

function setting:draw()
    self.userbutton:draw();
    love.graphics.setColor(cgreen)
    love.graphics.printf('^\nTap to change username',math.floor(width/2-unit*7), math.floor(height/2 + unit*8 + unit*math.sin(self.a)*math.sin(self.a)),unit*14 , 'center')
    self.homebutton:draw()
    self.leaderboard:draw()

end


return setting
