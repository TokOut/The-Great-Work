Ellipse = class()

function Ellipse:init(x, y, s, red, blue, green)
    self.x = x
    self.y = y
    self.size = s
    self.r = red
    self.g = green
    self.b = blue
    
    if red == nil or green == nil or blue == nil then
        self.r = 100
        self.b = 255
        self.g = 200
    end
    
    if x == nil or y == nil then
        x = 0
        y = 0
    end
    
    if size == nil then
        size = 50
    end
    
    print("Created an ellipse on", self.x,"x", self.y, "\nThe size is setted to ", self.size)
    print("Colored with\n", self.r, "- red\n", self.g, "- green\n", self.b, "- blue")
end

function Ellipse:draw()
    -- This is the third shader
    fill(self.r * 4/7, self.g - 75.25, self.b + 2/3)
    ellipse(self.x, self.y, self.size + 15.75)
    
    -- This is the second shader
    fill(self.r + 100, self.g - 100, self.b/3 * 2.75, 250)
    ellipse(self.x, self.y, self.size + 10)
    
    -- This is the first shader
    fill(self.r + 50, self.g - 50, self.b/2 * 1.5, 250)
    ellipse(self.x, self.y, self.size + 7.5)
    
    -- This is the main circle
    fill(self.r, self.g, self.b, 255)
    ellipse(self.x, self.y, self.size)
    
    fill(255, 255, 255, 255)
    ellipse(self.x, self.y, 10)
end

function Ellipse:touched(t)
    if t.state == BEGAN then
        print("The EllipseClass makes a touch!")
    elseif t.state == ENDED then
        print("The EllipseClass touch is ended!")
    else
        print("Moved!")
    end
end
