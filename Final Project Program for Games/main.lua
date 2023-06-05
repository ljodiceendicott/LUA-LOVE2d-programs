

H = love.graphics.getHeight()
W = love.graphics.getWidth()

local player = {}
local projectiles = {}

local fire = false
local firex = 0
local firey = 0
local player = {}
local fireobj = {}
local playeri = require("player")
function love.load()
  fireobj.speed = 2
  fireobj.dx = 0
  fireobj.dy = 0
  fireobj.x = 0
  fireobj.y = 0
  player.x = 100
  player.y = H - 50
  player.w = 30
  player.h = 30
  player.facing = "top"
end


function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h);
    love.graphics.rectangle("fill", fireobj.x, fireobj.y, 10, 10)
    if fire then
      makeproj(firex,firey)
    end
end

local function touchingAnyEnemy()
    local alhs = player.x
    local arhs = player.x + 30
    local atop = player.y
    local abottom = player.y + 30

    for i = 1, #ghosts do
        local blhs = ghosts[i].x
        local brhs = ghosts[i].x + ghosts[i].w
        local btop = ghosts[i].y
        local bbottom = ghosts[i].y + ghosts[i].h

        if ((alhs <= brhs and arhs >= blhs) and
            (atop <= bbottom and abottom >= btop)) then
            bgcolor = {0.7, 0.1, 0.1}
            if not playerHitByGhost then playerhit:play() end
            playerHitByGhost = true
            txtx = W / 2 - 60
            txty = H / 2
            for i = 1, #ghosts do ghosts[i].dx = 0 end
            return true
        end
    end

    return false
end

function makeproj(x,y)
love.graphics.rectangle("fill", x+30, y+30,10, 10)
end

function love.update(dt)
  love.graphics.setColor({1,0,1,1})
  for i =1, #projectiles do
    obj = projectiles[i]
    if obj.direction == "up" then
      obj.y = obj.y+obj.dy
    end
  --  projectiles[i].update()
  --  love.graphics.rectangle("fill", projectiles[i].x, projectiles[i].y, 10, 10)
  end
    -- LEFT KEY
    -- if (love.keyboard.isDown("a")) then
    --     if (player.x > (W * 0.1)) then
    --         if (love.keyboard.isDown("w") or love.keyboard.isDown("s")) then
    --             player.x = player.x - (200 * dt * .59)
    --         end
    --         if (not love.keyboard.isDown("w") and not love.keyboard.isDown("s")) then
    --             player.x = player.x - (200 * dt)
    --         end
    --     end
    -- end
    -- -- RIGHT PLAYER KEYf
    -- if (love.keyboard.isDown("d")) then
    --     if (player.x < (W * .75)) then
    --         if (love.keyboard.isDown("w") or love.keyboard.isDown("s")) then
    --             player.x = player.x + (200 * dt * .59)
    --         end
    --         if (not love.keyboard.isDown("w") and not love.keyboard.isDown("s")) then
    --             player.x = player.x + (200 * dt)
    --         end
    --     end
    -- end
    -- if (love.keyboard.isDown("w")) then
    --     if (love.keyboard.isDown("a") or love.keyboard.isDown("d")) then
    --         player.y = player.y - (200 * dt * .59)
    --     end
    --     if (not love.keyboard.isDown("a") and not love.keyboard.isDown("d")) then
    --         player.y = player.y - (200 * dt)
    --     end
    -- end
    -- if (love.keyboard.isDown("s")) then
    --     if (love.keyboard.isDown("a") or love.keyboard.isDown("d")) then
    --         player.y = player.y + (200 * dt * .59)
    --     end
    --     if (not love.keyboard.isDown("a") and not love.keyboard.isDown("d")) then
    --         player.y = player.y + (200 * dt)
    --     end
    -- end
    if(love.keyboard.isDown("up")) then
     fireobj.x = player.x
     fireobj.y = player.y
     fireobj.dy = -fireobj.speed
     fireobj.direction = "up"
     table.insert(projectiles,fireobj)
end
end
