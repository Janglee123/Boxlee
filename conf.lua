function love.conf(t)
    t.identity = boxlee


    t.window.width = 375
    t.window.height = 667


    t.window.msaa = 8
    t.modules.joystick = false
    t.window.title = "Böxlee"
    t.window.borderless = false
    t.window.icon = "asset/icon3.png"

    t.modules.keyboard = true
end
