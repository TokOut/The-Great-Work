Window = class()

function Window:init(x, y, w, h)
    if x==nil or y==nil then x=0 y=0 end
    if w==nil then w=500 end
    if h==nil then h=200 end
    self.logo = readImage("SpaceCute:Icon")
    self.w = w
    self.h = h
    self.x = x
    self.y = y
    self.name = "Test Window"
    self.drawing = true
end

function Window:draw()
    if self.drawing == true then
        self.tw, self.th = textSize(self.name)
        fill(255, 255, 255, 255)
        rect(self.x, self.y, self.w, self.h)
        -- Panel [[
        rect(self.x, self.y + self.h, self.w, 75)
        -- Logo
        sprite(self.logo, self.x + 40, self.y + self.h + 37.5, 55, 55)
        -- Name
        fill(0, 0, 0, 255)
        fontSize(30)
        font("Baskerville")
        text(self.name, self.x + self.w/2, self.y + self.h + 35)
        -- Close Button
        fill(0, 0, 255, 255)
        rect(self.x + self.w - 65, self.y + self.h + 10, 55, 55)
        fill(255, 0, 0, 255)
        font("AmericanTypewriter-Bold")
        fontSize(50)
        text("X", self.x + self.w - 36.5, self.y + self.h + 35)
        -- Panel ]]
    end
end

function Window:touched(t)
    if self.drawing == true then
        if t.state == BEGAN and t.x> -60+self.x+self.w and t.x<-10+self.w+self.x and t.y>15+self.y+self.h and t.y<75+self.h+self.y then
            print("Window «Closed»")
            self.drawing = false
        end
    end
end
