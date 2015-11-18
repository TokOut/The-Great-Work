Button = class()

function Button:init(displayName)
    -- you can accept and set parameters here
    self.displayName = displayName
    
    self.pos = vec2(0,0)
    self.size = vec2(100,100)
    self.action = nil
    self.color = color(255, 255, 255, 255)
    self.isTextButton = false
end

function Button:draw()
    -- Codea does not automatically call this method
    pushStyle()
    fill(self.color)
    
    font("AmericanTypewriter-Bold")
    fontSize(22)
    
    local w,h = textSize(self.displayName)
    if(self.isTextButton) then
        -- use longest sound name for size
        w = w + 20
        h = h + 30
        self.size = vec2(w,h)
    else
        w=self.size.x
        h=self.size.y
    end
    rectBox(self.pos.x - w/2,self.pos.y - h/2,w,h)
    -- rect(self.pos.x,self.pos.y,w,h)
            
    -- self.size = vec2(w,h)
            
    textMode(CENTER)
    fill(63, 63, 63, 255)
    text(self.displayName,self.pos.x+2,self.pos.y-2)
    fill(0, 0, 0, 255)
    text(self.displayName,self.pos.x,self.pos.y)
    
    popStyle()
end

function Button:hit(p)
    local l = self.pos.x - self.size.x/2
    local r = self.pos.x + self.size.x/2
    local t = self.pos.y + self.size.y/2
    local b = self.pos.y - self.size.y/2
    if p.x > l and p.x < r and
       p.y > b and p.y < t then
        return true
    end
    
    return false
end

function Button:touched(touch)
    -- Codea does not automatically call this method
    if touch.state == ENDED and self:hit(vec2(touch.x, touch.y)) then
        if self.action then
            self.action()
        end
    end
end

    function rectBox(x,y,w,h)
    pushStyle()
    
    insetPos = vec2(x,y)
    insetSize = vec2(w,h)
    
    --Copy fill into stroke
    local red,green,blue,a = fill()
    stroke(red,green,blue,a)
    
    noSmooth()
    rectMode(CORNER)
    rect(insetPos.x,insetPos.y,insetSize.x,insetSize.y)
    
    popStyle()
    end
