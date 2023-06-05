--require("roommaker")
require("makedoor")
W = love.graphics.getWidth()
H = love.graphics.getHeight()


local T = {}
  local room = {}
--makeaRoom(r1,g1,b1,isdoor1, is1locked, r2,g2,b2, isdoor2,is2locked, r3,g3,b3,is3locked,isdoor3)
function T.load()
--room = makeaRoom(0,1,0, true,true,false, 1,1,0, true, false,false, 1,0,1, true, false,false)
  doorl = makeDoor(1,0,1,0,true, false,false,0)
  doorc = makeDoor(1,.5,0,W/2-50,true,false,false,false,2)
  doorr = makeDoor(1,.25,.5,W-100,true, false,false,false,3)
  table.insert(room, doorl)
  table.insert(room,doorc)
  table.insert(room,doorr)
end

function T.draw()
    for i = 1, #room do
      room[i].draw()
    end
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line", W/4, H/4, 400, 300)
    love.graphics.line(0, 0,W/4,H/4)
    love.graphics.line(W/4+400,H/4,W,0)
    love.graphics.line(0,H,W/4,H/4+300)
    love.graphics.line(W/4+400, H/4+300, W,H)
end

function T.update(dt)
end
return T
