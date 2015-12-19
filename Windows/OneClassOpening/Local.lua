
--# Main
-- #Main
displayMode(OVERLAY)
displayMode(FULLSCREEN)

function setup()
    win = Window(50, 50)
    al = Window.Alert(50, 350, "Special Alert", "Value is here\nMaximal 3 n-breaks because\nnot so much place in here")
    game = Window.Game(575, 50)
    al2 = Window.AlertOnlyOkay(400, 350, nil, "The Alert includes one button")
    al3 = Window.AlertOnlyOkay(700, 350, "Information", "This are only example windows.\nIf you are new to Codea, try to\nunderstand the codes. Enjoy!")
end

function draw()
    background(0, 0, 0, 255)
    win:draw()
    al:draw()
    game:draw()
    al2:draw()
    al3:draw()
end

function touched(t)
    win:touched(t)
    al:touched(t)
    game:touched(t)
    al2:touched(t)
    al3:touched(t)
end

--# Window
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

--# Alert_Okay_Cancel
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

--# Alert_Okay
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

--# Game
Window.Game = class()
-- The Game Window

function Window.Game:init(x, y)
    if x==nil or y==nil then x=0 y=0 end
    self.x = x
    self.y = y
    game_x = self.x
    game_y = self.y
    game_drawing = self.drawing
    self.drawing = true
    self.lobby = Window.Game.Lobby()
    self.game = Window.Game.World()
    self.logo = readImage("Platformer Art:Icon")
    self.currentpage = self.lobby
end

function Window.Game:draw()
    if self.drawing == true then
        fill(255, 255, 255, 255)
        rect(self.x, self.y, 400, 275)
        self.currentpage:draw()
        sprite(self.logo, self.x + 35, self.y + 240, 50, 50)
    end
end

function Window.Game:touched(t)
    if t.x>self.x and t.x<self.x+400 and t.y>self.y and t.y<self.y+275 and self.drawing==true then
        self.currentpage:touched(t)
    end
end

--# Game_World
Window.Game.World = class()

function Window.Game.World:init()
    self.x = game_x
    self.y = game_y
    self.block_id_1 = readImage("Platformer Art:Block Grass")
    self.block_id_2 = readImage("Platformer Art:Block Brick")
    self.block_id_3 = readImage("Platformer Art:Block Special Brick")
    self.block_id_4 = readImage("Platformer Art:Block Special")
    self.block_id_5 = readImage("Platformer Art:Crate")
end

function Window.Game.World:draw()
    fill(0, 0, 0, 255)
    font("AmericanTypewriter")
    fontSize(15)
    text("The Game will be installed soon.\nWait please!\nIn Forums we will inform you!", self.x + 200, self.y + 150)
end

function Window.Game.World:touched(t)
    
end

--# Game_Lobby
Window.Game.Lobby = class()

function Window.Game.Lobby:init()
    self.x = game_x
    self.y = game_y
    self.drawing = true
end

function Window.Game.Lobby:draw()
    if self.drawing == true then
        fill(100, 100, 255, 255)
        rect(self.x + 50, self.y + 25, 300, 50)
        rect(self.x + 50, self.y + 100, 300, 50)
        fill(255, 255, 255, 255)
        font("AcademyEngravedLetPlain")
        fontSize(40)
        textAlign(CENTER)
        text("Play Local!", self.x + 200, self.y + 115)
        text("Exit!", self.x + 200, self.y + 40)
        fill(255, 0, 255, 255)
        font("Inconsolata")
        fontSize(50)
        text("Mine2d", self.x + 200, self.y + 200)
    end
end

function Window.Game.Lobby:touched(t)
    if self.drawing == true and t.state == ENDED then
        if t.x>self.x+50 and t.x<self.x+350 and t.y>self.y+25 and t.y<self.y+75 then
            print("Mined «Exit»")
            self.drawing = false
            game.drawing = false
        end
        --Mined «Touched the Screen!»	 630.0	x	145.0 l, b
        --Mined «Touched the Screen!»	 925.0	x	150.0 r, b
        -- 575, 50 <=> x,y
        if t.x>self.x+50 and t.x<self.x+350 and t.y>self.y+100 and t.y<self.y+150 then
            print("Mined «Join!»")
            game.currentpage = game.game
        end
    end
end
