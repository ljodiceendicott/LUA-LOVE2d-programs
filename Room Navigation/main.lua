hasKey = false
state = 1
local start = require("startRoom")
local room2b = require("room2b")
local room2a = require("room2a")
local room3a = require("room3a")
local room3b = require("room3b")
local room3c = require("room3c")
local states = {start, room2a, room2b, room3a, room3b,room3c}

function love.load()
start.load()
room2b.load()
room2a.load()
room3a.load()
room3b.load()
room3c.load()
end

function love.draw()
  if state==1 then
    start.draw()
  elseif state ==2 then
    room2a.draw()
  elseif state ==3 then
    room2b.draw()
  elseif state ==4 then
    room3a.draw()
  elseif state == 5 then
    room3b.draw()
  elseif state == 6 then
    room3c.draw()
  end
end

function love.update()
  if state==1 then
    start.update()
  elseif state ==2 then
    room2a.update()
  elseif state ==3 then
    room2b.update()
  elseif state ==4 then
    room3a.update()
  elseif state == 5 then
    room3b.update()
  elseif state == 6 then
    room3c.update()
  end
end
