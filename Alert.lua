Alert = class() function Alert:init(txt, head, action)
    if action == nil then action = function() print(self, "Used the action for the accepting alert") end end
    if txt == nil or head == nil then
    if txt == nil then txt = "Any Text has to be here" end
    if head == nil then head = "Alert" end end
    self.title = head
    self.text = txt
    self.alertdraw = true
    self.action = action
    self.alertclose = function() self.alertdraw = false end
    okbutton = AlertButton("OK", 250, 285, function() self.action() self.alertclose() end)
    dismissbutton = AlertButton("Dismiss", 675, 285, function() self.alertdraw = false print(self, "The Alert was dismissed") end, 100)
end function Alert:draw()
    if self.alertdraw == true then
        fill(255, 255, 255, 255)
        rectMode(CENTER)
        rect(WIDTH/2, HEIGHT/2, 550, 200)
        rectMode(CORNER)
        okbutton:draw()
        dismissbutton:draw()
        textAlign(CENTER)
        fontSize(25)
        font("AmericanTypewriter")
        text(self.text, WIDTH/2, HEIGHT/2 + 30)
        fontSize(50)
        font("AmericanTypewriter-Bold")
        text(self.title, WIDTH/2, HEIGHT/2 + 75)
    end end function Alert:touched(t)
    if self.alertdraw == true then okbutton:touched(t) dismissbutton:touched(t) end end
AlertButton = class() function AlertButton:init(name, x, y, action, w)
    if x == nil or y == nil then x = 0 y = 0 end
    if name == nil then name = "Nil" end
    if action == nil then action = function() print("These buttons are alert") end end
    if w == nil then w = 75 end
    self.width = w self.x = x self.y = y self.name = name self.action = action
    self.color = color(255, 255, 255, 255)
end

function AlertButton:draw()
    fill(self.color)
    rect(self.x, self.y, self.width, 75)
    fill(0, 0, 0, 255)
    font("AmericanTypewriter")
    fontSize(25)
    textMode(CENTER)
    text(self.name, self.x + self.width - 45, self.y + 35)
end

function AlertButton:touched(t)
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

function AlertButton:hit(p)
    local t = self.x + 75
    local b = self.x - 1
    local l = self.y - 1
    local r = self.y + 75
    if p.x > l and p.x < r and p.y > b and p.y < t then
        return true
    end
        return false
end
