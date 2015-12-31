Game = class()

function Game:init(x, y)
    self.window = Window()
    self.window = Window()
    self.version = "1.0"
    self.window.name = "Game plugin " .. self.version
    self.window.logo = readImage("Platformer Art:Icon")
    self.window.action = function() end
    self.window.size = vec2(500, 400) -- Do NOT change!
    self.window.pos = vec2(x, y)
    self.body = Game_Body(self.window.pos.x + 150, self.window.pos.y + self.window.size.y/2 + 50)
    self.currentmove = nil
    self.hold = false
end

function Game:draw()
    self.window:draw()
    if self.window.drawing then
        fill(0, 0, 0, 255)
        rect(self.window.pos.x + 10, self.window.pos.y + 10, 50, 50)
        rect(self.window.pos.x + 70, self.window.pos.y + 10, 50, 50)
        rect(self.window.pos.x + 130, self.window.pos.y + 10, 50, 50)
        rect(self.window.pos.x + 70, self.window.pos.y + 70, 50, 50)
        -- The plugin
        rect(self.window.pos.x + 25, self.window.pos.y + 140, self.window.size.x - 50, 200)
        fill(255, 255, 255, 255)
        font("AcademyEngravedLetPlain")
        fontSize(45)
        sprite("Tyrian Remastered:Arrow Left", self.window.pos.x + 35, self.window.pos.y + 35, 50, 50)
        sprite("Tyrian Remastered:Arrow Right", self.window.pos.x + 155, self.window.pos.y + 35, 50, 50)
        text("\\/", self.window.pos.x + 95, self.window.pos.y + 25)
        text("/\\", self.window.pos.x + 95, self.window.pos.y + 85)
        font("AmericanTypewriter-Light")
        fontSize(20)
        text("This example shows you,\nhow to make a simple game!", self.window.pos.x + self.window.size.x/2, self.window.pos.y + self.window.size.y/2 + 50)
        self.body:draw()
        if self.hold then
            if self.currentmove == "Up" and self.body.y<self.window.pos.y+340 then
                self.body:move(0, 3)
            elseif self.currentmove == "Down" and self.body.y>self.window.pos.y+140 then
                self.body:move(0, -3)
            elseif self.currentmove == "Right" and self.body.x<self.window.pos.x+self.window.size.x-25 then
                self.body:move(3, 0)
            elseif self.currentmove == "Left" and self.body.x>self.window.pos.x+25 then
                self.body:move(-3, 0)
            end
        end
    end
end

function Game:touched(t)
    self.window:touched(t)
    if self.window.drawing and t.state == BEGAN then
        self.hold = true
        --rect(self.window.pos.x + 25, self.window.pos.y + 140, self.window.size.x - 50, 200)
        if t.x>self.window.pos.x+10 and t.x<self.window.pos.x+60 and t.y>self.window.pos.y+10 and t.y<self.window.pos.y+60 and self.body.x>self.window.pos.x+25 then
            self.currentmove = "Left"
        elseif t.x>self.window.pos.x + 70 and t.x<self.window.pos.x + 120 and t.y>self.window.pos.y + 10 and t.y<self.window.pos.y + 60 and self.body.y>self.window.pos.y+140 then
            self.currentmove = "Down"
        elseif t.x>self.window.pos.x + 130 and t.x<self.window.pos.x + 180 and t.y>self.window.pos.y + 10 and t.y<self.window.pos.y + 60 and self.body.x<self.window.pos.x+self.window.size.x-25 then
            self.currentmove = "Right"
        elseif t.x>self.window.pos.x + 70 and t.x<self.window.pos.x + 120 and t.y>self.window.pos.y + 70 and t.y<self.window.pos.y + 120 and self.body.y<self.window.pos.y+340 then
            self.currentmove = "Up"
        else
            self.currentmove = nil
        end
    elseif t.state == ENDED then
        self.hold = false
    end
end
