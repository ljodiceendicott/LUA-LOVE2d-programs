W = love.graphics.getWidth()
H = love.graphics.getHeight()

 function makeDoor(r,g,b,x, isdoorlocked, isgo)
    local door ={}
    door.r = r
    door.g = g
    door.b = b
    door.x = x
    door.y = H/2
    door.w = 100
    door.h = 150
    door.isdoorlocked = isdoorlocked
    door.isGO = isgo


    function door.draw()
        love.graphics.setColor(door.r,door.g,door.b, 1)
        love.graphics.rectangle("fill", door.x, door.y, door.w, door.h)
        if door.isdoorlocked then
          if hasKey == false then
            love.graphics.setColor(1,0,0,1)
            love.graphics.print("Door is Locked: Find key", door.x, door.y-20)
          end
          if hasKey == true then
            love.graphics.setColor(0,1,0,1)
            love.graphics.print("Key Aquired: can now go through door", door.x, door.y-20)
          end
        end
    end

    return door
end
