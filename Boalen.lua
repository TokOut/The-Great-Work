Boalen = class()

function Boalen:init(x, y, value)
    self.x = x
    self.y = y
    self.value = value
    self.size = 22.5
    
    if self.value == true then
        self.elx = self.x + 50
    else
        self.elx = self.x + 2.5
    end
end

function Boalen:draw()
    strokeWidth(50)
    stroke(255, 255, 255, 255)
    line(self.x, self.y, self.x + 50, self.y)
    
    fill(225, 220, 0, 255)
    ellipseMode(RADIUS)
    strokeWidth(0)
    ellipse(self.elx, self.y, self.size)
    
    if self.value == true then
        self.elx = self.x + 50
    else
        self.elx = self.x + 2.5
    end
end

function Boalen:touched(t)
    if t.state == BEGAN and self:hit(vec2(t.x, t.y)) then
        if self.value == true then
            self.value = false
            print("Set to false")
        else
            self.value = true
            print("Set to true")
        end
    end
end

function Boalen:hit(p)
    local r = self.x + 50
    local t = self.y + 10
    local b = self.y - 10
    local l = self.x
        if l < p.x
        and t > p.y
        and r > p.x
        and b < p.y
        then
        return true
    end
    return false
end
