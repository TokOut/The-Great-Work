
--[[
------------------------------------------ Classes ------------------------------------------

Constant() -- Includes pi and e and very big numbers
Vec(x, y, z, w) -- Its just a vector from vec2() to vec3() till vec4()
Button(name) -- Buttons
Boalen(x, y, value) -- Boalens
Triangle(x, y, x2, y2, x3, y3, color) -- Creates a TriAngle
factorial( value ) -- returns 1 * 2 * 3 * ... * value -- possible till 65, if bigger returns nil

------------------------------------------ RoadMap ------------------------------------------

Version 1.0
- Created Some classes

Version 1.4 [Current]
- Removed TextParagraph-class
- Created factorials function
- Created a body where you can set many items (Gravity, Move, Body- Asset)
- Created more numbers for CONSTANT (class)
- The Button is looking better

-------------------------------- Latest Important Updates --------------------------------

Main:      Removed **  TextParagraph()  ** class
NEW:       Added a body-class with using **  Vec()  ** class of this project
Graphics:  The button is looking more (but not same as) Codeas-styling

------------------------------------- How to work? -------------------------------------
Constant
So first connect many numbers by writing "c = Constant()"
so then replace the "self" with "c" so the number pi is "c.pi"
You can also use buttons normal looking with "b = Button(display, x, y, action)"

Button
For example we create an object and set the position to the middle.:
***
-- We set "but" to an button object
but = Button("Press me!")
-- We set the positions
but.pos = Vec(50, 50)
-- We set the callback on finish of the touch to print "Pressed!"
but.action = function() print("Pressed!") end
***
]]

function factorial(value)
    local id = value
    if id == 0 then
        return 1
    else
        return id * factorial(id - 1)
    end
end

Body = class()

function Body:init()
    self.pos = Vec(0, 0, 50, 100)
    self.body = readImage("Planet Cute:Character Horn Girl")
end

function Body:draw()
    spriteMode(CORNER)
    sprite(self.body, self.pos.x, self.pos.y, self.pos.z, self.pos.w)
end

function Body:move(directionX, directionY)
    self.pos.x = self.pos.x + directionX
    self.pos.y = self.pos.y + directionY
end

function Body:gravity(groundX, speed_points)
    if self.pos.y >= groundX then
        self.pos.y = self.pos.y - speed_points
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

function Button:init(name)
    self.display = name
    self.pos = Vec(0, 0)
    self.size = Vec(200, 50)
    self.action = nil
    self.touch = false
end

function Button:draw()
    fill(60, 255)
    if self.touch then fill(135, 255) end
    if self.touch then end
    strokeWidth(2)
    stroke(0, 255, 255, 255)
    rect(self.pos.x, self.pos.y, self.size.x, self.size.y)
    fill(0, 255, 255, 255)
    text(self.display, self.pos.x + self.size.x/2, self.pos.y + self.size.y/2)
end

function Button:touched(p)
    local r = self.pos.x + self.size.x
    local l = self.pos.x
    local b = self.pos.y
    local t = self.pos.y + self.size.y
    if p.x>l and p.x<r and p.y>b and p.y<t then
        self.touch = true
    end
    if p.state == ENDED then
        self.touch = false
        if p.x>l and p.x<r and p.y>b and p.y<t and self.action then
            self.action()
        end
    end
end

Boalen = class()

function Boalen:init(x, y, value)
    self.x = x self.y = y self.value = value self.size = 22.5
    if self.value == true then
        self.elx = self.x + 50
        self.color = color(255, 255, 255, 255)
    else
        self.elx = self.x + 2.5
        self.color = color(127, 100)
    end
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
    
    if self.value then
        self.elx = self.x + 50
        self.color = color(255, 255, 255, 255)
    else
        self.elx = self.x + 2.5
        self.color = color(127, 127, 127, 100)
    end
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
