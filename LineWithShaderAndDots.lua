Line = class()

function Line:init(x, y, x2, y2, size)
    if size == nil then
        size = 15
    end
    
    if x == nil or y == nil or x2 == nil or y2 == nil then
        self.x = 0
        self.y = 0
        self.x2 = 0
        self.y2 = 0
    end
    
    self.x = x
    self.y = y
    self.x2 = x2
    self.y2 = y2
    self.size = size
end

function Line:draw()
    strokeWidth(self.size)
    
    stroke(187, 186, 187, 255)
    line(self.x + 5, self.y + 2.5, self.x2 + 5, self.y2 + 2.5)
    
    stroke(255, 255, 255, 255)
    line(self.x, self.y, self.x2, self.y2)
    
    fill(127, 127, 127, 255)
    strokeWidth(0)
    ellipse(self.x + 4.5, self.y, self.size + 10)
    ellipse(self.x2 + 4.5, self.y2, self.size + 10)
end

--[[
CurrentTouch.tapCount
CurrentTouch.deltaX
CurrentTouch.deltaY
CurrentTouch.prevX
CurrentTouch.prevY
CurrentTouch.state
CurrentTouch.x
CurrentTouch.y
]]

function Line:touched(t)
    if t.state == BEGAN then
        print("Touch position: ".. t.x .."x" .. t.y .. "; \nBegan!")
    end
    
    if t.state == MOVING then
        print("Moved to " .. t.x .. "x" .. t.y)
    end
    
    if t.state == ENDED then
        print("Touch position: ".. t.x .."x" .. t.y .. "; \nEnded!")
    end
end
