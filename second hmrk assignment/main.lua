--main.lua
W = love.graphics.getWidth();
state = 2 -- intro

local intro = require("intro")
local ingame = require("ingame")
local states = {intro, ingame}

-- states[state]

function love.load()
  intro.load()
  ingame.load()
end

function love.draw()
  --love.graphics.rectangle("fill", 0, 100, 80, 80)
  if(state == 1) then
    intro.draw()
  elseif(state == 2) then
    ingame.draw()
  end
end

function love.update(dt)
  if(state == 1) then
    intro.update(dt)
  elseif(state == 2) then
    ingame.update(dt)
  end
end
