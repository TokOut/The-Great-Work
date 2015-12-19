Window.Game = class()
-- The Game Window

function Window.Game:init(x, y)
    if x==nil or y==nil then x=0 y=0 end
    self.x = x
    self.y = y
    game_x = self.x
    game_y = self.y
    game_drawing = self.drawing
    self.drawing = true
    self.lobby = Window.Game.Lobby()
    self.game = Window.Game.World()
    self.logo = readImage("Platformer Art:Icon")
    self.currentpage = self.lobby
end

function Window.Game:draw()
    if self.drawing == true then
        fill(255, 255, 255, 255)
        rect(self.x, self.y, 400, 275)
        self.currentpage:draw()
        sprite(self.logo, self.x + 35, self.y + 240, 50, 50)
    end
end

function Window.Game:touched(t)
    if t.x>self.x and t.x<self.x+400 and t.y>self.y and t.y<self.y+275 and self.drawing==true then
        self.currentpage:touched(t)
    end
end
