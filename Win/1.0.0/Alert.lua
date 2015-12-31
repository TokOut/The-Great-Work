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
