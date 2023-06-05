require("door")
W = love.graphics.getWidth()
H = love.graphics.getHeight()

local T = {}
local background ={}
local sound = {}
T.soundplayed = false
function T.load()
 background= love.graphics.newImage("assets/backgrounds/gameoverbg.png")
 sound = love.audio.newSource("assets/sounds/lose.wav", "static")
end

function T.draw()
love.graphics.draw(background,0,0)
love.graphics.print("Press (esc) to exit the game",W/2-80,H/2)
end


function T.update(dt)
  if not T.soundplayed then
    sound:play()
    T.soundplayed = true
  end
  if love.keyboard.isDown("escape")then
    love.event.quit()
  end
end
return T
