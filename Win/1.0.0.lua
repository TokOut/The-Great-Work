
--# Main

supportedOrientations(WIDTH)
displayMode(OVERLAY)
displayMode(FULLSCREEN)

function setup()
    testwindow = Window()
    testwindow.pos = vec2(575, 500)
    testalert = Alert("A one button alert\nwith some lines\nand no buttons and\ncloseable with the\nX-Button", "Test Alert", 50, 50)
    game = Game(25, 350)
end

function draw()
    background(0, 0, 0, 255)
    testwindow:draw()
    testalert:draw()
    game:draw()
end

function touched(t)
    testwindow:touched(t)
    testalert:touched(t)
    game:touched(t)
end

--# Window
Window = class()

function Window:init()
    self.drawing = true
    self.pos = vec2(0, 0)
    self.size = vec2(400, 250)
    self.logo = readImage("Cargo Bot:Codea Icon")
    self.action = function() print("The window was clicked!") end
    self.name = "Test Window"
    self.fontSize = 25
    self.closeable = true
    self.logo_size = 45
end

function Window:draw()
    if self.drawing then
        fill(255, 255, 255, 255)
        rect(self.pos.x, self.pos.y, self.size.x, self.size.y)
        stroke(0, 0, 0, 255)
        strokeWidth(2.5)
        line(self.pos.x, self.pos.y+self.size.y-50, self.pos.x+self.size.x, self.pos.y+self.size.y-50)
        sprite(self.logo, self.pos.x + 25, self.pos.y+self.size.y-25, self.logo_size, self.logo_size)
        fill(0, 0, 0, 255)
        font("AmericanTypewriter")
        fontSize(self.fontSize)
        text(self.name, self.pos.x+self.size.x/2, self.pos.y+self.size.y-25)
        if self.closeable then
            fill(255, 0, 0, 255)
            stroke(0, 255, 50, 255)
            strokeWidth(1)
            rect(self.pos.x+self.size.x-45, self.pos.y+self.size.y-45, 40, 40)
            fill(255, 255, 255, 255)
            font("AmericanTypewriter-Bold")
            fontSize(40)
            text("X", self.pos.x+self.size.x-25, self.pos.y+self.size.y-25)
        end
    end
end

function Window:touched(t)
    if t.state == BEGAN and self.drawing then
        if t.x>self.pos.x and t.x<self.pos.x+self.size.x and t.y>self.pos.y and t.y<self.pos.y+self.size.y then
            self.action()
            if self.closeable and t.x>self.pos.x+self.size.x-45 and t.x<self.pos.x+self.size.x-5 and t.y>self.pos.y+self.size.y-45 and t.y<self.pos.y+self.size.y-5 then
                print("Window Closed!")
                self.drawing = false
            end
        end
    end
end

--# Alert
Alert = class()

function Alert:init(m, t, x, y)
    if t==nil then t="Alert" end
    self.message = m
    self.window = Window()
    self.window.drawing = true
    self.window.name = t
    self.window.closeable = true
    self.window.logo = readImage("Platformer Art:Block Special")
    self.window.action = function() print("The Alert was clicked!") end
    self.window.size = vec2(250, 150)
    self.window.pos = vec2(x, y)
end

function Alert:draw()
    self.window:draw()
    if self.window.drawing then
        font("AmericanTypewriter")
        fontSize(15)
        fill(0, 0, 0, 255)
        text(self.message, self.window.pos.x+self.window.size.x/2, self.window.pos.y+self.window.size.y/2-25)
    end
end

function Alert:touched(t)
    self.window:touched(t)
end

--# Game
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

--# GameBody
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
