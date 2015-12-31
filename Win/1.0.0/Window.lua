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
