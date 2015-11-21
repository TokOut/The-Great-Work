IntegerParameter = class()

function IntegerParameter:init(x1, y, x2, cp)
    self.x1 = x1
    self.y = y
    self.x2 = x2
    self.ellipseposition = cp
    if self.ellipseposition > x2 or self.ellipseposition < x1 or self.ellipseposition == x2 then
        self.ellipseposition = x1
    end
    self.value = self.ellipseposition - self.x1
end

function IntegerParameter:draw()
    strokeWidth(10)
    stroke(255, 255, 255, 255)
    line(self.x1, self.y, self.x2, self.y)
    
    fill(225, 221, 192, 255)
    strokeWidth(0)
    ellipse(self.ellipseposition, self.y, 25)
    
    fill(255, 157, 0, 255)
    font("AmericanTypewriter")
    fontSize(25)
    text("0", self.x1, self.y - 25)
    text(self.ellipseposition - (self.x1 + 1), self.x2 - 25, self.y - 25)
end

function IntegerParameter:touched(touch)
    if touch.state == BEGAN and self:hit(vec2(touch.x, touch.y)) then
        print("Touched")
    end
    if touch.state == MOVING and self:hit(vec2(touch.x, touch.y)) then
        print("Moving to", touch.x)
        self.ellipseposition = touch.x
        print("Have been Moved!")
        cp = self.ellipseposition
        print("Recognized values!")
    end
end

function IntegerParameter:hit(p)
    local r = self.x2
    local l = self.x1
    local t = self.y + 5
    local b = self.y - 5
    if p.x > l and p.x < r and p.y > b and p.y < t then
        return true
    end
    return false
end
