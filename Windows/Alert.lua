Window.Alert = class()

function Window.Alert:init(x, y, n, v, Nil)
    if x==nil or y==nil then x=0 y=0 end
    if n==nil then n="Alert" end
    if v==nil then v="Try to click Okay,\nthen reload and click Cancel\nand enjoy!" end
    if Nil==nil then Nil=function() print("Alert «Action»") end end
    self.x = x
    self.y = y
    self.name = n
    self.value = v
    self.alertdraw = true
    self.action = Nil
    
    -- Logo of the Window; Recomended: "Space Art:Green Explosion"
    self.logo = readImage("Platformer Art:Coin")
end

function Window.Alert:draw()
    if self.alertdraw == true then
        textAlign(CENTER)
        fill(255, 255, 255, 255)
        rect(self.x, self.y, 300, 150)
        fill(0, 0, 0, 255)
        font("AmericanTypewriter-Bold")
        fontSize(25)
        text(self.name, self.x + 150, self.y + 125)
        font("AmericanTypewriter")
        fontSize(15)
        text(self.value, self.x + 150, self.y + 87.5)
        -- Logo
        sprite(self.logo, self.x + 15, self.y + 135, 25, 25)
        -- The Buttons
        fill(0, 0, 0, 255)
        rect(self.x + 5, self.y + 5, 150, 50)
        rect(self.x + 160, self.y + 5, 135, 50)
        fill(255, 255, 255, 255)
        fontSize(25)
        text("OK!", self.x + 80, self.y + 27.5)
        text("Cancel", self.x + 230, self.y + 27.5)
    end
end

function Window.Alert:touched(t)
    if self.alertdraw == true then
        if t.x>self.x+5 and t.x<self.x+155 and t.y>self.y+5 and t.y<self.y+55 and t.state==BEGAN then
            print("Alert Okay_Cancel «Okay»")
            self.action()
            self.alertdraw = false
        elseif t.x>self.x+160 and t.x<self.x+295 and t.y>self.y+5 and t.y<self.y+55 and t.state==BEGAN then
            print("Alert Okay_Cancel «Cancel»")
            self.alertdraw = false
        end
    end
end
