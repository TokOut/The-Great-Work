
--[[
------------------------------------------ Locals ------------------------------------------

Constant() -- Includes pi and e and very big numbers
Vec(x, y, z, w) -- Its just a vector from vec2() to vec3() till vec4()
Button(name) -- Buttons
Boolean(name) -- Booaleans
Triangle(x, y, x2, y2, x3, y3, color) -- Creates a TriAngle
factorial( value ) -- returns 1 * 2 * 3 * ... * value -- possible till 65, if bigger returns nil
col( value ) -- You can set easy and fast set the colors

------------------------------------------ RoadMap ------------------------------------------

Version 1.0 [Major]
- Created Some classes

Version 1.4 [Minor]
- Removed TextParagraph-class
- Created factorials function
- Created a body where you can set many items (Gravity, Move, Body- Asset)
- Created more numbers for CONSTANT (class)
- The Button is looking better

Version 1.6 [Minor, Current]
- Renamed boalen with Boolean class
- Booleans look better
- Created a "col" function which includes many colors

-------------------------------- Latest Important Updates --------------------------------

Main:      The boalen is now a boolean class
Graphics:  The booalean is now looking as an activateable button
New:       Created a function where you can specify colors fast

-------------------------------- Notes for working --------------------------------

WatchParameter(value, global)
- Please set "wpr = WatchParameter(v, g)" in draw, to update the value automatically
- This are styled in codea-colors, you can change them.

Button(name)
- This buttons are very nice looking.

Boolean(name)
- Its a button which is activatable by ended touch.


]]

function factorial(value)
    local id = value
    if id == 0 then
        return 1
    else
        return id * factorial(id - 1)
    end
end

function col(value)
    if value == "GREEN" then
        return color(0, 255, 0, 255)
    elseif value == "BLUE" then
        return color(0, 0, 255, 255)
    elseif value == "YELLOW" then
        return color(255, 255, 0, 255)
    elseif value == "RED" then
        return color(255, 0, 0, 255)
    elseif value == "CYAN" then
        return color(0, 255, 255, 255)
    elseif value == "PINK" then
        return color(255, 0, 255, 255)
    elseif value == "GOLD" then
        return color(255, 200, 0, 255)
    elseif value == "GREY" then
        return color(135 , 255)
    elseif value == "WHITE" then
        return color(255, 255, 255, 255)
    elseif value == "BLACK" then
        return color(0, 0, 0, 255)
    elseif value == "PURPLE" then
        return color(150, 0, 255, 255)
    elseif value == "ORANGE" then
        return color(255, 150, 0, 255)
    elseif value == "DARK_BLUE" then
        return color(0, 100, 255, 255)
    elseif value == "BROWN" then
        return color(100, 50, 25, 255)
    elseif value == "SAND" then
        return color(200, 150, 100, 255)
    elseif value == "STONE_ROSA" then
        return color(175, 125, 125, 255)
    elseif value == "ROSA" then
        return color(200, 100, 175, 255)
    elseif value == "LIGHT_GREEN" then
        return color(50, 255, 100, 255)
    elseif value == "DIAMOND" then
        return color(150, 150, 255, 255)
    elseif value == "DIAMOND_DARK" then
        return color(125, 100, 150, 255)
    elseif value == "COAL" then
        return color(60, 255)
    elseif value == "LIGHT_GREY" then
        return color(150, 255)
    else
        return color(127, 127, 127, 255)
    end
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

TriAngle = class()

function TriAngle:init(x, y, x2, y2, x3, y3)
    self.xa = x
    self.xb = x2
    self.xc = x3
    self.ya = y
    self.yb = y2
    self.yc = y3
    self.color = col("BLACK")
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
    self.color = col("CYAN")
end

function Button:draw()
    fill(col("COAL"))
    if self.touch then fill(col("GREY")) end
    strokeWidth(2)
    stroke(self.color)
    rect(self.pos.x, self.pos.y, self.size.x, self.size.y)
    fill(self.color)
    text(self.display, self.pos.x + self.size.x/2, self.pos.y + self.size.y/2)
end

function Button:touched(p)
    local r = self.pos.x + self.size.x
    local l = self.pos.x
    local b = self.pos.y
    local t = self.pos.y + self.size.y
    if p.x>l and p.x<r and p.y>b and p.y<t then
        self.touch = true
    else
        self.touch = false
    end
    if p.state == ENDED then
        self.touch = false
        if p.x>l and p.x<r and p.y>b and p.y<t and self.action then
            self.action()
        end
    end
end

Boolean = class()

function Boolean:init(name, en)
    if en == nil then en = false end
    self.pos = Vec(0, 0)
    self.size = Vec(200, 50)
    self.display = name
    self.enabled = en
    self.color = col("CYAN")
end

function Boolean:draw()
    fill(col("COAL"))
    if self.enabled then fill(col("GREY")) end
    strokeWidth(2)
    stroke(self.color)
    rect(self.pos.x, self.pos.y, self.size.x, self.size.y)
    fill(self.color)
    text(self.display, self.pos.x + self.size.x/3, self.pos.y + self.size.y/2)
    if self.enabled then fill(col("GOLD")) else fill(col("BLACK")) end
    ellipse(self.pos.x + self.size.x * 9/12, self.pos.y + self.size.y/2, 40)
end

function Boolean:touched(p)
    local l = self.pos.x
    local r = self.pos.x + self.size.x
    local t = self.pos.y + self.size.y
    local b = self.pos.y
    if p.x > l and p.x < r and p.y > b and p.y < t and p.state == ENDED then
        if self.enabled then
            self.enabled = false
        else
            self.enabled = true
        end
    end
end

WatchParameter = class()

function WatchParameter:init(value, des)
    if value == nil then value = "nil" end
    self.pos = Vec(0, 0)
    self.value = value
    self.size = Vec(200, 50)
    self.description = des
end

function WatchParameter:draw()
    if self.description == nil then
        self.description = "{Value is a nil value}"
    elseif self.description == true then
        self.description = "true"
    elseif self.description == false then
        self.description = "false"
    elseif self.description == TEXT then
        self.description = self.description
    end
    stroke(col("CYAN"))
    fill(col("COAL"))
    rect(self.pos.x, self.pos.y, self.size.x, self.size.y)
    fill(col("CYAN"))
    text(self.value, self.pos.x + self.size.x/2, self.pos.y + self.size.y/12*9)
    fill(col("LIGHT_GREY"))
    text(self.description, self.pos.x + self.size.x/2, self.pos.y + self.pos.y /12*0.75)
end
