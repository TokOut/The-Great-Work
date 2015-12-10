TextParagraph = class()

function TextParagraph:init(x, y, w, h, txt)
    -- nil into number
    if x == nil then x = 0 end
    if w == nil then w = 450 end
    if h == nil then h = 250 end
    if y == nil then y = 0 end
    if txt == nil then txt = "" end
    -- the self values
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.text = txt
    self.placeholder = "This is a TextBox\nMade by TokOut.\nStart to write and\nremove this Add."
    self.enabled = false
end

function TextParagraph:draw()
    -- Official Look
    fill(255, 255, 255, 255)
    stroke(160, 160, 160, 255)
    strokeWidth(5)
    rect(self.x, self.y, self.w, self.h)
    -- Text Settings
    fontSize(25)
    font("AmericanTypewriter")
    textMode(CORNER)
    textWrapWidth(0)
    -- Text
    fill(0, 0, 0, 255)
    ww,hh = textSize(self.text)
    text(self.text, self.x + 20, self.y + self.h - 20 - hh)
    -- Place holder
    fill(127, 127, 127, 255)
    if string.len(self.text) == 0 then
        text(self.placeholder, self.x + self.w/2, self.y + self.h/2)
    end
end

function TextParagraph:touched(t)
    if t.state == ENDED and self:hit(vec2(t.x,t.y)) then
        showKeyboard()
        self.enabled = true
    elseif not self:hit(vec2(t.x,t.y)) and t.state == BEGAN then
        hideKeyboard()
        self.enabled = false
    end
end

function TextParagraph:hit(p)
    local t = self.y + self.h
    local b = self.y
    local r = self.x + self.w
    local l = self.x
    if p.x > l and p.x < r and p.y > b and p.y < t then
        return true
    end
    return false
end

function TextParagraph:keyboard(key)
    if self.enabled == true then
        if key == BACKSPACE and self.enabled == true then
            if string.len(self.text) > 0 then
                self.text = string.sub(self.text, 1, string.len(self.text) - 1)
            end
        elseif key == RETURN then
            self.text = self.text .. "\n"
        else
            self.text = self.text .. key
        end
    end
end
