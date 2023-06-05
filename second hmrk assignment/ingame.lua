local T = {}
score = 0
xclick = -1
yclick = -1

local function getRandx()
randxval = love.math.random(40,love.graphics.getWidth()-40)
return randxval
end

local function getRandy()
    randheight = love.math.random(40,love.graphics.getHeight()-40)
  return randheight
end



local function makeThing(x, y, w, h, dx, dy, type)
  local thing = {}
  thing.x = x
  thing.y = y
  thing.w = w
  thing.h = h
  thing.farx = thing.w+thing.x
  thing.fary = thing.h+thing.y
  thing.dx = dx
  thing.dy = dy
  thing.type = type

  function thing.clickedOn(xval,yval)
    if (xval> thing.x and xval<thing.farx) and (yval> thing.y and yval<thing.fary) then
      return true
    else
      return false
    end
  end

  function thing.draw()
    if thing.type == "redSquares" then
      love.graphics.setColor(1,0,0,1)
      love.graphics.rectangle("fill", thing.x, thing.y, thing.w, thing.h)
    elseif thing.type =="yellowSquares" then
      love.graphics.setColor(1,1,0,1)
      love.graphics.rectangle("fill", thing.x, thing.y, thing.w, thing.h)
    elseif(thing.type =="greenSquares") then
      love.graphics.setColor(0,1,0,1)
      love.graphics.rectangle("fill", thing.x, thing.y, thing.w, thing.h)
    else
      love.graphics.print("logging")
  end
  love.graphics.setColor(1,1,1,1)
end

  function thing.update(dt)
  end

  return thing
end


-- this runs once, when the project is first loaded
function T.load()
  W = love.graphics.getWidth()
  H = love.graphics.getHeight()

  knownObjects = {}
t = makeThing(0,0,W,H,0,0,"Background")
table.insert(knownObjects,t)
  redx = {}
  redy = {}
  for i=1,3 do
    x = getRandx()
    y = getRandy()
    t =  makeThing(x,y,40,40,0,0,"redSquares")
table.insert(redx,x)
table.insert(redy,y)
table.insert(knownObjects,t)
end -- ends loading of red blocks

 yellowx = {}
 yellowy = {}
for i=4,6 do
  x = getRandx()
  y = getRandy()
  t =  makeThing(x,y,40,40,0,0,"yellowSquares")
  table.insert(yellowx,x)
  table.insert(yellowy,y)
table.insert(knownObjects,t)
end -- ends loading of yellow blocks

greenx = {}
greeny = {}
for i=7,9 do
  x = getRandx()
  y = getRandy()
  t =  makeThing(x,y,40,40,0,0,"greenSquares")
  table.insert(greenx,x)
  table.insert(greeny,y)
table.insert(knownObjects,t)
end --ends loading of green blocks

end -- end of load

function love.mousepressed(x,y,button)
  if button == 1 then
    xclick = x
    yclick = y
  end
  isyellow = false
  isgreen = false
  isred = false
  for i = 2, #knownObjects do
    theThing = knownObjects[i]
    if xclick>theThing.x and xclick < theThing.farx then
      if yclick>theThing.y and yclick < theThing.fary then
        type = theThing.type
        for i = 2, #knownObjects do
          move = knownObjects[i]
        move.x = love.math.random(0,love.graphics.getWidth()-40)
        move.y = love.math.random(0,love.graphics.getHeight()-40)
      end
        if type == "redSquares" then
          --do nothing
          isred=true
        elseif type == "yellowSquares" then
            isyellow =true
        elseif type == "greenSquares" then
           isgreen =true
          end
      end
    end
  end
   --end of the loop
  if isgreen then
    score = score+2
    xclick = -1
elseif isyellow then
  score = score+1
xclick = -1
elseif not isgreen and not isyellow and not isred and xclick>0 then
    score = score -5
  for i = 2, #knownObjects do
    move = knownObjects[i]
  move.x = love.math.random(0,love.graphics.getWidth()-40)
  move.y = love.math.random(0,love.graphics.getHeight()-40)
end

  xclick = -1
end
--
end
function T.update(dt)
-- for i=1, 9 do
--   knownObjects[i+1].x = newx[i]
--   knownObjects[i+1].y = newy[i]
-- end

end -- end of the function

function T.draw()
bg = knownObjects[1]
love.graphics.setColor(0,0,1,1)
love.graphics.rectangle("fill", 0, 0,love.graphics.getWidth(),love.graphics.getHeight())
love.graphics.setColor(1,1,1,1)
love.graphics.print("Score:"..score)
love.graphics.print("x:"..xclick.."Y:"..yclick, 10, 10)
  for i = 2, #knownObjects do
    theThing = knownObjects[i]
    theThing.draw()
  end
end

return T
