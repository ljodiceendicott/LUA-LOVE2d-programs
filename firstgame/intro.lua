--intro.lua
print("hello from intro")

local T = {}

function T.load()
end

function T.draw()
  love.graphics.rectangle("fill", 20, 20, 40, 40)
  love.graphics.print("Press [SPACE] to start", 0, 0)
end

function T.update(dt)
  if(love.keyboard.isDown("space")) then
    state = 1
  end
end

return T
