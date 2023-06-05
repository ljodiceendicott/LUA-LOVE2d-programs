W = love.graphics.getWidth()
H = love.graphics.getHeight()

 function makeDoor(r,g,b,x, isdoor, isdoorlocked, isgo, room2draw)
    local door ={}
    door.r = r
    door.g = g
    door.b = b
    door.x = x
    door.y = H/2
    door.w = 100
    door.h = 150
    door.isdoor = isdoor
    door.isdoorlocked = isdoorlocked
    door.room2draw = room2draw --is the state will move game along

    function door.draw()
      if door.isdoor then
        love.graphics.setColor(door.r,door.g,door.b, 1)
        love.graphics.rectangle("fill", door.x, door.y, door.w, door.h)
      end
    end

    return door
end
