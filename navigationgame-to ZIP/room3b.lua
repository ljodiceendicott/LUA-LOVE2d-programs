require("door")
W = love.graphics.getWidth()
H = love.graphics.getHeight()

local T = {}
local room = {}

function T.load()
  doorl = makeDoor(1,1,0,0, true,false)
  doorr = makeDoor(1,0,0,W-100, false,true)
  table.insert(room, doorl)
  table.insert(room,doorr)
end

function T.draw()
  love.graphics.draw(backgrounds[4],0,0)
  for i = 1, #room do
      room[i].draw()
    end
    -- love.graphics.print("room3b",20,20)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", W/4, H-80, W/2, 30)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Go Back",W/2-10,H-80)
end

function love.mousepressed(x, y, button, isTouch)
    if x>room[1].x and x<room[1].x+room[1].w then
      if hasKey then
      state = 4
      end
      --winning
    end
    if x>room[2].x and x<room[2].x+room[2].w then
      state = 6
    end
    if x>W/4 and x<3*W/4 and y>H-80 and y<H-50 then
      state = 2
    end
  -- if x< 2/3*W and x>1/3*W and y<then
  --   state = 2
  -- end
end

function T.update(dt)
    -- if love.mouse.isDown(1) then
    --   local x = love.mouse.getX()
    --   local y = love.mouse.getY()
    --   for i =1, #room do
    --     local door = room[i]
    --     if x < door.x and x>door.x + door.w and y<door.y and y>door.y+door.h then
    --       state = 2
    --     end
    --   end
    -- end
end
return T
