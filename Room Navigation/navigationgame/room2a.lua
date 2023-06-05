require("door")
W = love.graphics.getWidth()
H = love.graphics.getHeight()

local T = {}
local room = {}

function T.load()
  doorl = makeDoor(1,0,1,0, false,true)
  doorc = makeDoor(1,.5,1,W/2-50,false,false)
  doorr = makeDoor(1,0,0,W-100, false,false)
  table.insert(room, doorl)
  table.insert(room,doorc)
  table.insert(room,doorr)
end

function T.draw()
  for i = 1, #room do
      room[i].draw()
    end
    love.graphics.print("room2a",20,20)
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line", W/4, H/4, 400, 300)
    love.graphics.line(0, 0,W/4,H/4)
    love.graphics.line(W/4+400,H/4,W,0)
    love.graphics.line(0,H,W/4,H/4+300)
    love.graphics.line(W/4+400, H/4+300, W,H)
end
function love.mousepressed(x, y, button, isTouch)
  if x>room[1].x and x<room[1].x+room[1].w then
    --GAME OVER
  end
  if x>room[2].x and x<room[2].x+room[2].w then
    state = 5
  end
  if x>room[3].x and x<room[3].x+room[3].w then
    state = 3
  end

  -- if x< 2/3*W and x>1/3*W and y<then
  --   state = 2
  -- end
end

function T.update(dt)

end
return T
