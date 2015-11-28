Button = class()

function Button:init(name, x, y, action)
    if x == nil or y == nil then
        x = 0
        y = 0
    end
    
    if name == nil then
        name = "Nil"
    end
    
    if action == nil then
        action = function() print("Using a Non-Function Button") end
    end
    
    self.x = x
    self.y = y
    self.name = name
    self.action = action
    self.color = color(255, 255, 255, 255)
end

function Button:draw()
    fill(self.color)
    rect(self.x, self.y, 75, 75)
    fill(0, 0, 0, 255)
    font("AmericanTypewriter")
    fontSize(25)
    textMode(CENTER)
    text(self.name, self.x + 35, self.y + 35)
end

function Button:touched(t)
    if t.state == BEGAN and self:hit(vec2(t.y,t.x)) then
        self.color = color(187, 187, 187, 255)
        self.action()
    else
        self.color = color(255, 255, 255, 255)
    end
    
    if t.state == ENDED then
        self.color = color(255, 255, 255, 255)
    end
end

function Button:hit(p)
    local t = self.x + 75
    local b = self.x - 1
    local l = self.y - 1
    local r = self.y + 75
    if p.x > l and p.x < r and p.y > b and p.y < t then
        return true
    end
        return false
end
