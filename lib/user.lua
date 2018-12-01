local socket = require "socket"
local http = require "socket.http"
http.TIMEOUT = 1
user = {}

function user:load()

    if not love.filesystem.getInfo( 'id' ) then
        self.id = os.time()
        love.filesystem.write('id',self.id)
    else
        self.id  = love.filesystem.read('id')
    end

    if not love.filesystem.getInfo( 'coin' ) then
        love.filesystem.write('coin',0)
        self.coin = 0
    else
        local x = love.filesystem.read('coin')
        self.coin  = tonumber(x)
    end

    if not love.filesystem.getInfo( 'un' ) then
        self.name = love.filesystem.write('un','boxlee')
        self.name = 'boxlee'
    else
        self.name = love.filesystem.read('un')
    end

    local tu = love.filesystem.read('tu')
    local wu = love.filesystem.read('wu')

    self.jumpTimeLevel = tonumber(tu or 0)
    self.jumpWidthLevel = tonumber(wu or 0)
    self.highscore = tonumber(love.filesystem.read('hs') or 0)

    http.request('https://boxlee.glitch.me/sync?id='..self.id..'&username='..self.name..'&highscore='..self.highscore)

end

function user:updateHighscore(highscore)
    self.highscore = highscore
    http.request('https://boxlee.glitch.me/sync?id='..self.id..'&username='..self.name..'&highscore='..self.highscore)
end

function user:updateCoin(coins)
    self.coin = self.coin + coins
    coin.n = self.coin
    love.filesystem.write('coin',self.coin)
end

function user:updateName(name)
    love.filesystem.write('un',name)
    self.name = name
    http.request('https://boxlee.glitch.me/sync?id='..self.id..'&username='..self.name..'&highscore='..self.highscore)
end

function user:updateJumpWidth()
    self.jumpWidthLevel = self.jumpWidthLevel + 1
    self:updateCoin(-self.jumpWidthLevel*updateCost)
    love.filesystem.write( 'wu', self.jumpWidthLevel )
end

function user:updateJumpTime()
    self.jumpTimeLevel = self.jumpTimeLevel + 1
    self:updateCoin(-self.jumpTimeLevel*updateCost)
    love.filesystem.write( 'tu', self.jumpTimeLevel )
end

return user
