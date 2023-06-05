require("door")
W = love.graphics.getWidth()
H = love.graphics.getHeight()

local T = {}
local room = {}

function T.load()
  --  background= love.graphics.newImage("assets/backgrounds/background1.png")
  doorl = makeDoor(1,1,0,100, false,false)
  doorc = makeDoor(1,0,1,W/2-50,false,false)
--  doorr = makeDoor(1,0,0,W-100, false,true)
  table.insert(room, doorl)
  table.insert(room,doorc)
  --table.insert(room,doorr)
end

function T.draw()
  love.graphics.draw(backgrounds[4], 0,0)
  for i = 1, #room do
      room[i].draw()
    end
    -- love.graphics.print("room2b",20,20)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", W/4, H-50, W/2, 30)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Go Back",W/2-10,H-40)
end


function T.update(dt)
    if love.mouse.isDown(1) then
      local x = love.mouse.getX()
      local y = love.mouse.getY()
      if x>room[1].x and x<room[1].x+room[1].w then
        state = 2
      end
      if x>room[2].x and x<room[2].x+room[2].w then
        state = 6
      end
      if x>W/4 and x<3*W/4 and y>H-50 and y<H-20 then
        state = 1
      end
    end
end
return T
