TextPanel = class()

function TextPanel:init(x, y, w, h, input, enbl, returnaction, retact)
    -- x or y are nil
    if x == nil or y == nil then
        x = 0
        y = 0
    end
    -- width or height is nil
    if w == nil or h == nil then
        w = 500
        h = 65
    end
    -- The Input value is nil
    if input == nil then
        input = ""
    end
    
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.input = input
    self.size = self.h/2 - 5
    -- It can disable the text box and its action
    self.enabled = enbl
    self.action = retact
    self.returnaction = returnaction
    self.currenttextbox = false
end

function TextPanel:draw()
    fill(255, 255, 255, 255)
    rect(self.x, self.y, self.w, self.h)
    if self.enabled == true then
        fill(0, 0, 0, 255)
    else
        fill(154, 154, 154, 255)
    end
    font("AmericanTypewriter")
    fontSize(self.size)
    text(self.input, self.x + self.w/2, self.y + self.h/2)
end

function TextPanel:touched(t)
    if self:hit(vec2(t.x, t.y)) and t.state == BEGAN then
        print("Touched! The table self is: ", self)
        showKeyboard()
        self.currenttextbox = true
    elseif not self:hit(vec2(t.x,t.y)) then
        hideKeyboard()
        self.currenttextbox = false
    end
end

function TextPanel:hit(p)
    local t = self.y + self.h
    local b = self.y - 1
    local l = self.x - 1
    local r = self.x + self.w
    if p.x > l and p.x < r and p.y > b and p.y < t then
        return true
    end
    return false
end

function TextPanel:keyboard(key)
    if self.enabled == true and self.currenttextbox == true then
        if key == BACKSPACE then
            if string.len(self.input)>0 then
                self.input = string.sub(self.input,1,string.len(self.input)-1)
            elseif string.len(self.input)==0 then
                sound(DATA, "ZgBAJghAQEBAGkBAikuGPFBxyTzNzMw+AwBAf0BAQEBAQEBA")
            end
        elseif key == RETURN then
            if self.returnaction == true then
                self.action()
            end
        else
            self.input = self.input .. key
        end
    end
end
