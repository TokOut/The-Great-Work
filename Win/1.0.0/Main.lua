
supportedOrientations(WIDTH)
displayMode(OVERLAY)
displayMode(FULLSCREEN)

function setup()
    testwindow = Window()
    testwindow.pos = vec2(575, 500)
    testalert = Alert("A one button alert\nwith some lines\nand no buttons and\ncloseable with the\nX-Button", "Test Alert", 50, 50)
    game = Game(25, 350)
end

function draw()
    background(0, 0, 0, 255)
    testwindow:draw()
    testalert:draw()
    game:draw()
end

function touched(t)
    testwindow:touched(t)
    testalert:touched(t)
    game:touched(t)
end
