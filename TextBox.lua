TextBox = class()

function TextBox:init(x,y,width,height,initText,hint,introCallback, changeCallback)
    -- you can accept and set parameters here
    textvalue = self.text
    self.x = x
    self.y = y
    self.width=width
    self.height=height
    if initText then self.text=initText else self.text="" end
    if hint then self.hint=hint else self.hint="" end
    self.focus=false
    self.intro=introCallback
    self.change=changeCallback
    self.lastinput=""
end

function TextBox:draw()
    if isKeyboardShowing()==false and self.focus==true then
        self.focus=false
    end
    pushStyle()
    stroke(240)
    lineCapMode(ROUND)
    strokeWidth(self.height)
    line(self.x+self.height/2,(self.y*2+self.height)/2,self.x+self.width-self.height/2,(self.y*2+self.height)/2)
    strokeWidth(0)
    fill(240)
    --rect(self.x+self.height/2,self.y,self.width-(self.height/2)*2,self.height)
    font("AmericanTypewriter-Bold")
    fontSize(self.height-25)
    textWrapWidth(self.width)
    local t=""
    if self.text=="" then
        fill(170)
        t=self.hint
    else
        fill(0)
        t=self.text
    end
    text(t,(self.x*2+self.width)/2,(self.y*2+self.height)/2)
    stroke(72, 91, 195, 255)
    strokeWidth(3)
    lineCapMode(SQUARE)
    if blink() and self.focus==true then
        a=(self.x*2+self.width)/2+textSize(self.text)/2 
        b=self.y+10
        c=self.y+self.height-10
        line(a,b,a,c)
    end
    if self.text~="" and self.focus==true then
        fill(170)
        ellipseMode(CENTER)
        strokeWidth(0)
        ellipse(self.x+self.width-25,(self.y*2+self.height)/2,self.height-25)
        fill(240)
        text("x",self.x+self.width-25,(self.y*2+self.height)/2+2)
    end
    popStyle()
end
function TextBox:setText(t)
    textvalue = self.text
    self.text=t
end
function TextBox:setHint(h)
    self.hint=h
end
function TextBox:getText()
    textvalue = self.text
    return self.text
end
function TextBox:getLastInput()
    textvalue = self.text
    return self.lastinput
end
function TextBox:touched(touch)
    textvalue = self.text
    if touch.x>self.x and touch.x<(self.x+self.width) and touch.y>self.y and touch.y<(self.y+self.height) and (touch.state==BEGAN or touch.state==ENDED)  then
        if touch.x>self.x+self.width-50 and self.text~="" and self.focus==true and touch.state==BEGAN then
            self.text=""
            self.lastinput="CLEAR"
            if self.change then self.change() end
        end
        self.focus=true
        showKeyboard()
    else
        self.focus=false
        hideKeyboard()
    end
end

function TextBox:keyboard(key)
    if key==BACKSPACE then
        if string.len(self.text)>0 then
            self.text=string.sub(self.text,1,string.len(self.text)-1)
        end
        self.lastinput="BACKSPACE"
    elseif key==RETURN then
        hideKeyboard()
        self.focus=false
        self.intro()
        self.lastinput="RETURN"
        self.text = ""
    else
        self.text = self.text .. key
        self.lastinput=key
    end
    if self.change then self.change() end
end

function blink()
    local int,fract=math.modf(ElapsedTime)
    if fract>=0.5 then return true else return false end
end
