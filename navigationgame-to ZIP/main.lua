hasKey = false
state = 2

local room1 = require("room1")
local room2a = require("room2a")
local room2b = require("room2b")
local win = require("win")
local room3b = require("room3b")
local room3c = require("room3c")
local gameover = require("gameover")
backgrounds = {}

function love.load()
  room1.load()
  room2a.load()
  room2b.load()
  win.load()
  room3b.load()
  room3c.load()
  gameover.load()

  background1= love.graphics.newImage("assets/backgrounds/background1.png")
  background2= love.graphics.newImage("assets/backgrounds/background2.png")
  background3= love.graphics.newImage("assets/backgrounds/background3.png")
  background4= love.graphics.newImage("assets/backgrounds/background4.png")
  table.insert(backgrounds,background1)
  table.insert(backgrounds,background2)
  table.insert(backgrounds,background3)
  table.insert(backgrounds,background4)
end

function love.draw()
  if state == 1 then
    room1.draw()
  end
  if state ==2 then
    room2a.draw()
  end
  if state ==3  then
    room2b.draw()
  end
  if state == 4 then
    win.draw()
  end
  if state == 5 then
    room3b.draw()
  end
  if state == 6 then
    room3c.draw()
  end
  if state ==7 then
    gameover.draw()
  end
end


function love.update()
  if state == 1 then
    room1.update()
  end
  if state ==2 then
    room2a.update()
  end
  if state == 3 then
    room2b.update()
  end
  if state == 4 then
    win.update()
  end
  if state == 5 then
    room3b.update()
  end
  if state == 6 then
    room3c.update()
  end
  if state == 7 then
    gameover.update()
  end
end
