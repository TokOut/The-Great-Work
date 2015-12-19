Window.AlertOnlyOkay = class()

function Window.AlertOnlyOkay:init(x, y, h, v)
    if x==nil or y==nil then x=0 y=0 end
    if h==nil then h="Alert" end
    if v==nil then v="Alert Text\nCreate three lines maximal" end
    self.x = x
    self.y = y
    self.alertdraw = true
    self.title = h
    self.value = v
    self.alertdraw = true
end

function Window.AlertOnlyOkay:draw()
    if self.alertdraw == true then
        textAlign(CENTER)
        fill(255, 255, 255, 255)
        rect(self.x, self.y, 250, 150)
        fill(0, 0, 0, 255)
        rect(self.x+12.5, self.y+12.5, 225, 45)
        fill(255, 255, 255, 255)
        fontSize(25)
        font("AmericanTypewriter")
        text("Okay!", self.x+125, self.y+35)
        fill(0, 0, 0, 255)
        font("AmericanTypewriter-Bold")
        text(self.title, self.x + 125, self.y + 125)
        font("AmericanTypewriter")
        fontSize(15)
        text(self.value, self.x + 125, self.y + 90)
    end
end

function Window.AlertOnlyOkay:touched(t)
    -- rect(self.x+12.5, self.y+12.5, 225, 45)
    if self.alertdraw==true and t.x>self.x+12.5 and t.x<self.x+237.5 and t.y>self.y+12.5 and t.y<self.y+57.5 and t.state==BEGAN then
        print("Alert Only_Okay «Dismiss»")
        self.alertdraw = false
    end
end
