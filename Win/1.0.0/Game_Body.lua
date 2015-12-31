Game_Body = class()

function Game_Body:init(x, y)
    self.body = readImage("Planet Cute:Character Horn Girl")
    self.x = x
    self.y = y
end

function Game_Body:draw()
    sprite(self.body, self.x, self.y, 50, 100)
end

function Game_Body:move(x, y)
    self.x = self.x + x
    self.y = self.y + y
end
