
Constant = class()

function Constant:init()
    self.pi = 3.14159265358979
    self.e = 2.71828182845904
end

Vec = class()

function Vec:init(x, y, z, w)
    if x==nil then x=0 y=0 z=0 w=0 end
    if y==nil then y=0 z=0 w=0 end
    if z==nil then z=0 w=0 end
    if w==nil then w=0 end
    self.x = x
    self.y = y
    self.z = z
    self.w = w
end

Button = class()

function Button:init(name, x, y, action, w)
    if x == nil or y == nil then x = 0 y = 0 end
    if name == nil then name = "Nil" end
    if action == nil then action = function() print("Using a Non-Function Button") end end
    self.x = x self.y = y self.name = name self.action = action
    self.color = color(255, 255, 255, 255) self.w = w
end

function Button:draw()
    fill(self.color) rect(self.x, self.y, self.w, 75) fill(0, 0, 0, 255)
    font("AmericanTypewriter") fontSize(25) textMode(CENTER)
    text(self.name, self.x + self.w/2, self.y + 35)
end

function Button:touched(t)
    if t.state == BEGAN and self:hit(vec2(t.y,t.x)) then self.color = color(187, 187, 187, 255)
        self.action() else self.color = color(255, 255, 255, 255) end
    if t.state == ENDED then self.color = color(255, 255, 255, 255) end
end

function Button:hit(p)
    local t = self.x + self.w local b = self.x - 1
    local l = self.y - 1 local r = self.y + 75
    if p.x > l and p.x < r and p.y > b and p.y < t then return true end return false
end

Boalen = class()

function Boalen:init(x, y, value)
    self.x = x self.y = y self.value = value self.size = 22.5
    if self.value == true then self.elx = self.x + 50 self.color = color(255, 255, 255, 255) else self.elx = self.x + 2.5 self.color = color(127, 100) end
end

function Boalen:draw()
    blendMode(NORMAL)
    strokeWidth(50)
    stroke(self.color)
    line(self.x, self.y, self.x + 50, self.y)
    
    fill(225, 220, 0, 255)
    ellipseMode(RADIUS)
    strokeWidth(0)
    ellipse(self.elx, self.y, self.size)
    
    if self.value == true then
        self.elx = self.x + 50
        self.color = color(255, 255, 255, 255)
    else
        self.elx = self.x + 2.5
        self.color = color(127, 127, 127, 100)
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

TextParagraph = class()

function TextParagraph:init(x, y, w, h, txt, ph, ml)
    -- nil into number
    if x == nil then x = 0 end
    if w == nil then w = 450 end
    if h == nil then h = 250 end
    if y == nil then y = 0 end
    if txt == nil then txt = "Any Text..." end
    if ph == nil then ph = "Text Box by TokOut. The place holder is a nil value" end
    if ml == nil then ml = 50 end
    -- the self values
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.text = txt
    self.placeholder = ph
    self.maximumlines = ml
end

function TextParagraph:draw()
    -- Official Look 
    fill(255, 255, 255, 255)
    stroke(160, 160, 160, 255)
    strokeWidth(5)
    rect(self.x, self.y, self.w, self.h)
    
    -- Text Settings
    fontSize(25)
    font("AmericanTypewriter")
    textMode(CORNER)
    textWrapWidth(0)
    
    -- The Color of the Info Text
    fill(94, 255, 0, 255)
    if string.len(self.text) >= self.maximumlines then
        fill(255, 0, 0, 255)
    end
    
    -- Info Text
    text("Letters: " .. string.len(self.text) .. "/" .. self.maximumlines, self.x, self.y + self.h)
    
    -- Text
    fill(0, 0, 0, 255)
    self.ww,self.hh = textSize(self.text)
    text(self.text, self.x + 20, self.y + self.h - 20 - self.hh)
    
    -- Place holder
    fill(127, 127, 127, 255)
    if string.len(self.text) == 0 then
        text(self.placeholder, self.x + self.w/3, self.y + self.h/2)
    end
end

function TextParagraph:touched(t)
    if t.state == ENDED and self:hit(vec2(t.x,t.y)) then showKeyboard()
    elseif not self:hit(vec2(t.x,t.y)) and t.state == BEGAN then hideKeyboard() end
end

function TextParagraph:hit(p)
    local t = self.y + self.h
    local b = self.y
    local r = self.x + self.w
    local l = self.x
    if p.x > l and p.x < r and p.y > b and p.y < t then
        return true
    end
    return false
end

function TextParagraph:keyboard(key)
    if key == BACKSPACE then
        print("Backspace")
        if string.len(self.text) > 0 then
            self.text = string.sub(self.text, 1, string.len(self.text) - 1)
        end
    elseif key == RETURN then
        if string.len(self.text) < self.maximumlines then
            self.text = self.text .. "\n"
        end
    else
        print(key)
        if string.len(self.text) < self.maximumlines then
            self.text = self.text .. key
        end
    end
end

