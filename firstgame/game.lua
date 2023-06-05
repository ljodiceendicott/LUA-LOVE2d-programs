local T = {}
player_score= 0
xclick = -1
yclick = -1
bclick = false

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
  thing.dx = dx
  thing.dy = dy
  thing.type = type


  function thing.draw()
  if(thing.type =="redSquares") then
        love.graphics.setColor(1,0,0,1)
        love.graphics.rectangle("fill", thing.x, thing.y, thing.w, thing.h)
      elseif(thing.type =="yellowSquares") then
          love.graphics.setColor(1,1,0,1)
          love.graphics.rectangle("fill", thing.x, thing.y, thing.w, thing.h)
      elseif(thing.type =="greenSquares") then
          love.graphics.setColor(0,1,0,1)
          love.graphics.rectangle("fill", thing.x, thing.y, thing.w, thing.h)
      else
        love.graphics.print("logging")
      end --ends conditional
    love.graphics.setColor(1, 1, 1, 1)
  end --ends thing.draw
  function T.load()

    W = love.graphics.getWidth()
    H = love.graphics.getHeight()

    knownObjects = {}
    --local function makeThing(x, y, w, h, dx, dy, type)
    for i=1,3 do
      t =  makeThing(getRandx(),getRandy(),40,40,0,0,"redSquares")
  table.insert(knownObjects,t)
  end --ends red load
  for i=4,6 do
    t =  makeThing(getRandx(),getRandy(),40,40,0,0,"yellowSquares")
  table.insert(knownObjects,t)
  end -- ends yellow load
  for i=7,9 do
    t =  makeThing(getRandx(),getRandy(),40,40,0,0,"greenSquares")
  table.insert(knownObjects,t)
  end --ends green load

  end -- ends T.load func

  function T.update(dt)
    function love.mousepressed(x,y,button)
      if button == 1 then
        xclick= x
        yclick= y
      end -- ends cond mouse pressed
  end-- end of mousepressed
  local BoxPressed = false
    for i=1,#knownObjects do
      knownObjects[i].update(dt)
  end --end of the for loop
    if bclick then -- this would mean that the mouse was clicked
      bclick = false -- changing to false so that it does not continously run
      --redraw screen with new values for the positions for blocks
      --manually change the values found in knownObjects and set it to a new value
    end--end of bclick
  end -- end of update

  function T.draw()
  --  love.graphics.print("Player dx:" .. player.dx, 0, 0)
  love.graphics.setColor(1,1,1,1)
  love.graphics.print("Score:"..player_score,0,0)


  for i = 1, #knownObjects do
    theThing = knownObjects[i]
    theThing.draw()
    end
  end

  return T
