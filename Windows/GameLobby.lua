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
