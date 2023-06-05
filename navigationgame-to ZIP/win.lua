W = love.graphics.getWidth()
H = love.graphics.getHeight()

local T = {}
local room = {}
local background= {}
local sound = {}
T.soundplayed = false
function T.load()
background = love.graphics.newImage("assets/backgrounds/win.png")
sound = love.audio.newSource("assets/sounds/win.wav", "static")
end

function T.draw()
love.graphics.draw(background,0,0)
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
