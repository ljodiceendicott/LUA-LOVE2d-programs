-- a starter main.lua for Love2D
-- it defines the three main "callback" functions
-- (these are functions that Love2D expects you to
-- define to make the game actually do things)

function love.load()
  -- this runs once, when the project is first loaded
  x=100
  gem = love.graphics.newImage("assets/gems/gem-1.png")
end

function love.update()
  x= x+5
  -- this runs as part of the game's update loop
  -- you can think of this as being called once
  -- per frame.  Put stuff in here that will
  -- update the state of your game variables
end

function love.draw()
  -- this is the function that gets called on
  -- every frame.  Put stuff in here to actually
  -- draw the game.  Better to separate update
  -- logic from draw logic.  This should really
  -- just do the draw stuff.
  love.graphics.print("Hello World!", 400, 300)
  love.graphics.rectangle("fill", 100, 200, 50, 80)
  love.graphics.rectangle("line",x,50,200,150)

  -- draw the gem at 300,200, rotation = 0, scale of 20%
  love.graphics.draw(gem, 300, 200, 0, 0.20, 0.20)
end
