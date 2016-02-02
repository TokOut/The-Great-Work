
--[[
------------------------------------------ Globals ------------------------------------------

Boolean(name) -- Booaleans in a button form
Button(name) -- Buttons in a very nice NEON style
col( value ) -- You can set easy and fast set the colors
Constant() -- Includes pi and e and very big numbers
http.connect( website ) -- This is currently nothing but i plan to use this to develop bots
http.readHTML( website ) -- This returns the data of website after being connected
Integer(name, a, b, currentScore) -- An Integer class
math.factor( value ) -- returns 1 * 2 * 3 * ... * value -- possible till 65, if bigger returns nil
Triangle(x, y, x2, y2, x3, y3, color) -- Creates a TriAngle
Vec(x, y, z, w) -- Its just a vector from vec2() to vec3() till vec4()
WatchParameter(name, data) -- An watch parameter -- Cannot set to userdata or tables

----- Special -----
pluginDATA (.version, .major, .minor)

------------------------------------------ RoadMap ------------------------------------------

Version 1.0 [First, Small]
- Created Some classes

Version 1.4 [Minor]
- Removed TextParagraph-class
- Created factorials function
- Created a body where you can set many items (Gravity, Move, Body- Asset)
- Created more numbers for CONSTANT (class)
- The Button is looking better

Version 1.6 [Minor, Small]
- Renamed boalen with Boolean class
- Booleans look better
- Created a "col" function which includes many colors

Version 2.0 [Major, Important] -- Current
- Added more colors to the "col" function
- WatchParameter is now yellow instead grey. Userdata and tables arent still supported, but won't result error
- Created some http functions
- Also created a "projectDATA" for this plugin to use the information from this plugin
- Created a "projectDATA" sub tag and function from the demo
- Added an Integer class
- Created some math formulas (with "math.formula" and subtags)

-----------|---------------------------- Latest Updates ---------------------------------------

Graphics:   WatchParameters description for the tag is now in yellow
Renamed:    The factorial function is now in the math tag as "math.factor"
REMOVED:    Removed the Information of use for this globals
NEW:        An Integer class
NEW:        An math formels class
]]

pluginDATA = {}
pluginDATA.version = "2.0"
pluginDATA.major = true
if pluginDATA.major then pluginDATA.minor = false else pluginDATA.minor = true end

http.connect = function(website)
    local function s(data, status, head)
        print("Sucess while connecting to " .. website)
    end
    
    local function f(e)
        print("Failed to connect URL!")
        print(e)
    end
    
    -- Requestion
    local h = http.request(website, s, f)
end

http.readHTML = function(website)
    local function s(data, status, head)
        print("Sucess connecting to " .. website .. " (Status: " .. status .. ")")
        return data
    end
    
    local function f(e)
        print("Error connecting to " .. website .. " for this reason:\n\n" .. e)
    end
    
    -- Requestion
    local h = http.request(website, s, f)
end

math.factor = function(value)
    local id = value
    if id == 0 then
        return 1
    else
        return id * math.factor(id - 1)
    end
end

col = function(value)
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
    elseif value == "LIGHT_BLUE" then
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
    elseif value == "GREEN_GREY" then
        return color(100, 125, 100, 255)
    elseif value == "MAGIC1" then
        return color(100, 75, 125, 255)
    elseif value == "MAGIC2" then
        return color(150, 100, 125, 255)
    elseif value == "MAGIC3" then
        return color(75, 50, 125, 255)
    elseif value == "MAGIC4" then
        return color(175, 150, 175, 255)
    elseif value == "MAGIC5" then
        return color(125, 25, 125, 255)
    elseif value == "LAVA1" then
        return color(255, 75, 0, 255)
    elseif value == "LAVA2" then
        return color(255, 200, 0, 255)
    elseif value == "LAVA3" then
        return color(255, 255, 0, 255)
    elseif value == "LAVA4" then
        return color(100, 50, 50, 255)
    elseif value == "LAVA5" then
        return color(200, 200, 0, 255)
    elseif value == "DARK_BLUE" then
        return color(50, 75, 125, 255)
    else
        return color(127, 127, 127, 255)
    end
end

math.formula = {}
math.formula.stringN = {}
math.formula.action = {}
math.formula.graphs = {}
math.formula.stringN.factorial = "1 * 2 * 3 * ... * (n - 1) * n"
math.formula.stringN.random = "1, 2, 3, ... , (n - 1) or n"
math.formula.stringN.natural = "N = {-n; ...; -3; -2; -1; 0; 1; 2; 3; ...; n}"
math.formula.stringN.aplb = "(a+b)(a+b) = aa + 2ab + bb"
math.formula.stringN.aplmib = "(a+b)(a-b) = aa - bb"
math.formula.stringN.amib = "(a-b)(a-b) = aa + bb - 2ab"
math.formula.action.aplb = function(a, b) local z = (a + b) ^ 2 return z end -- a plus b
math.formula.action.aplmib = function(a, b) local z = (a + b) * (a - b) return z end -- a plus minus b
math.formula.action.amib = function(a, b) local z = (a - b) ^ 2 return z end -- a minus b
math.formula.graphs.vfe = function(v, f, e) local z = v + f - e return z end -- v + f - e

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
    fontSize(15)
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
    fontSize(15)
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
    
    if p.state == ENDED and p.x>l and p.x<r and p.y>b and p.y<t then
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
    if des == nil then des = "NIL" end
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
    elseif type(self.description) == "userdata" then
        self.description = "Error: Got USERDATA"
    elseif type(self.description) == "table" then
        self.description = #self.description .. " table data"
    elseif type(self.description) == "function" then
        self.description = "Error: Got FUNCTION"
    end
    strokeWidth(2)
    stroke(col("CYAN"))
    fill(col("COAL"))
    rect(self.pos.x, self.pos.y, self.size.x, self.size.y)
    fontSize(15)
    fill(col("CYAN"))
    text(self.value, self.pos.x + self.size.x/2, self.pos.y + self.size.y/12*9)
    fill(col("GOLD"))
    text(self.description, self.pos.x + self.size.x/2, self.pos.y + self.pos.y /12*0.75)
end

Integer = class()

function Integer:init(name, minimum, maximum, currentNumber)
    self.value = name
    self.min = minimum
    self.max = maximum
    self.cur = currentNumber
    self.pos = Vec(0, 0)
    self.size = Vec(200, 50)
end

function Integer:draw()
    strokeWidth(2)
    stroke(col("CYAN"))
    fill(col("COAL"))
    rect(self.pos.x, self.pos.y, self.size.x, self.size.y)
    fill(col("CYAN"))
    text(self.value, self.pos.x + self.size.x/2, self.pos.y + self.size.y/12*9)
    fill(col("LAVA1"))
    fontSize(20)
    text("-           " .. self.cur .. "           +", self.pos.x + self.size.x/2, self.pos.y + 15)
end

function Integer:touched(t)
    local xy = Vec(self.pos.x, self.pos.y)
    local wh = Vec(self.pos.x + self.size.x, self.pos.y + self.size.y)
    local mid = Vec(self.pos.x + self.size.x/2, self.pos.y + self.size.y/2)
    if t.state == BEGAN and t.x > xy.x and t.y > xy.y and t.x < wh.x and t.y < wh.y then
        if t.x<mid.x and self.cur > self.min then
            self.cur = self.cur - 1
        elseif t.x>mid.x and self.cur < self.max then
            self.cur = self.cur + 1
        end
    end
end
