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
