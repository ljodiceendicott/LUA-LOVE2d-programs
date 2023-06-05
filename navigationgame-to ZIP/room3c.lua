require("door")
W = love.graphics.getWidth()
H = love.graphics.getHeight()

local T = {}
local room = {}
local keyx = W/2-40
local keyy =H/2-200
function T.load()

  key = love.graphics.newImage("assets/key.png")
  doorl = makeDoor(1,1,0,200,false, false)
  table.insert(room, doorl)
end

function T.draw()
  love.graphics.draw(backgrounds[3],0,0)
  for i = 1, #room do
      room[i].draw()
    end
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", W/4, H-50, W/2, 30)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Go Back",W/2-10,H-40)
    --put key in
    love.graphics.draw(key,keyx,keyy,0,0.2,0.2)
end


function T.update(dt)
    if love.mouse.isDown(1) then
      local x = love.mouse.getX()
      local y = love.mouse.getY()
      if x>room[1].x and x<room[1].x+room[1].w then
        state = 5
      end
      if x>W/4 and x<3*W/4 and y>H-50 and y<H-20 then
        state = 3
      end
      local imgW = 251
      local imgH = 200
      if x>keyx and x<keyx+imgW and y>keyy and y<keyy+imgH then
        --remove img
        hasKey = true
        keyy = H
        keyx = W
      end
    end
end
return T
