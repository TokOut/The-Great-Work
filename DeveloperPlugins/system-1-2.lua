
-- Constant() -- Includes pi and e and very big numbers

-- Vec(x, y, z, w) -- Its a vector that you needn't specify to 2, 3 or 4 (Cannot use for specified arrays (mesh with vec3))

-- Button(name, x, y, action, w) -- Buttons

-- Boalen(x, y, value) -- Boalens

-- Triangle(x, y, x2, y2, x3, y3, color) -- Creates a TriAngle

-- factorial( value ) -- returns 1 * 2 * 3 * ... * value

function factorial(value)
    local id = value
    if id == 0 then
        return 1
    else
        return id * factorial(id - 1)
    end
end

Constant = class()

function Constant:init()
    self.pi = 3.14159265358979
    self.e = 2.71828182845904
    self.mil = 10 ^ 6
    self.mir = 10 ^ 9
    self.bil = 10 ^ 12
    self.bir = 10 ^ 15
    self.tri = 10 ^ 18
    self.trir = 10 ^ 21
    self.nums1 = 1/9
    self.nums2 = 2/9
    self.nums3 = 3/9
    self.nums4 = 4/9
    self.nums5 = 5/9
    self.nums6 = 6/9
    self.nums7 = 7/9
    self.nums8 = 8/9
    self.nums9 = 1 - 0.00000000000001
    self.inf = self.trir ^ self.trir
    self.myNum = {}
    self.myNum.num1 = math.pi * 2 / 5 + math.pi / 2
    self.myNum.num2 = math.pi * 3
    self.myNum.num3 = math.pi ^ math.pi
    self.myNum.num4 = math.pi / 10
    self.myNum.num5 = 31415926535897.9
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

TriAngle = class()

function TriAngle:init(x, y, x2, y2, x3, y3)
    self.xa = x
    self.xb = x2
    self.xc = x3
    self.ya = y
    self.yb = y2
    self.yc = y3
    self.color = color(0, 0, 0, 255)
    self.body = mesh()
    self.body.vertices = {vec3(self.xa, self.ya, 0), vec3(self.xb, self.yb, 0), vec3(self.xc, self.yc, 0)}
    self.body.colors = {color(self.color), color(self.color), color(self.color)}
end

function TriAngle:draw()
    self.body:draw()
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
    
    if self.value then self.elx = self.x + 50 self.color = color(255, 255, 255, 255) else self.elx = self.x + 2.5 self.color = color(127, 127, 127, 100) end
end

function Boalen:touched(t)
    if t.state == BEGAN and self:hit(vec2(t.x, t.y)) then
        if self.value then
            self.value = false
        else
            self.value = true
        end
    end
end

function Boalen:hit(p)
    if self.x < p.x and self.y + 10 > p.y and self.x + 50 > p.x and self.y - 10 < p.y then
        return true
    end
    return false
end
