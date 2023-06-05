require("door")
W = love.graphics.getWidth()
H = love.graphics.getHeight()

local T = {}
local room = {}
local background = {}

function T.load()

  --background= love.graphics.newImage("assets/backgrounds/background1.png")
  --doorl = makeDoor(0,0,0,0,false,false)
  doorc = makeDoor(1,0,1,W/2,false,false)
  doorr = makeDoor(1,0,0,W-200,false,false)
  --table.insert(room,doorl)
  table.insert(room,doorc)
  table.insert(room,doorr)
end

function T.draw()
  love.graphics.draw(backgrounds[1], 0,0)
  for i = 1, #room do
      room[i].draw()
    end
    -- love.graphics.print("room1",20,20)
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line", W/4, H/4, 400, 300)
    love.graphics.line(0, 0,W/4,H/4)
    love.graphics.line(W/4+400,H/4,W,0)
    love.graphics.line(0,H,W/4,H/4+300)
    love.graphics.line(W/4+400, H/4+300, W,H)
end

function T.update(dt)
    if love.mouse.isDown(1) then
      local x = love.mouse.getX()
      local y = love.mouse.getY()
      -- if (x>room[1].x and x<room[1].x+room[1].w) and y>H/2 and y<H/2+room[1].h then
      --   --GAME OVER
      -- end
      if x>room[1].x and x<room[1].x+room[1].w then
        state = 2
      end
      if x>room[2].x and x<room[2].x+room[2].w then
        state = 3
      end
    end
    --   for i =1, #room do
    --     local door = room[i]
    --     if x < door.x and x>door.x + door.w and y<door.y and y>door.y+door.h then
    --       state = 2
    --     end
    --   end
    -- end
end
return T
