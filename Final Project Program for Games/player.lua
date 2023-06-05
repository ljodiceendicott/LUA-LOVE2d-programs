local T = {}

function T.load()
  local player = {}
function make

  function player.load()
  player.x = 100
  player.y = H - 50
  player.w = 30
  player.h = 30
  player.facing = "top"
end
function player.update
if (love.keyboard.isDown("a")) then
    if (player.x > (W * 0.1)) then
        if (love.keyboard.isDown("w") or love.keyboard.isDown("s")) then
            player.x = player.x - (200 * dt * .59)
        end
        if (not love.keyboard.isDown("w") and not love.keyboard.isDown("s")) then
            player.x = player.x - (200 * dt)
        end
    end
end
-- RIGHT PLAYER KEYf
if (love.keyboard.isDown("d")) then
    if (player.x < (W * .75)) then
        if (love.keyboard.isDown("w") or love.keyboard.isDown("s")) then
            player.x = player.x + (200 * dt * .59)
        end
        if (not love.keyboard.isDown("w") and not love.keyboard.isDown("s")) then
            player.x = player.x + (200 * dt)
        end
    end
end
if (love.keyboard.isDown("w")) then
    if (love.keyboard.isDown("a") or love.keyboard.isDown("d")) then
        player.y = player.y - (200 * dt * .59)
    end
    if (not love.keyboard.isDown("a") and not love.keyboard.isDown("d")) then
        player.y = player.y - (200 * dt)
    end
end
if (love.keyboard.isDown("s")) then
    if (love.keyboard.isDown("a") or love.keyboard.isDown("d")) then
        player.y = player.y + (200 * dt * .59)
    end
    if (not love.keyboard.isDown("a") and not love.keyboard.isDown("d")) then
        player.y = player.y + (200 * dt)
    end
end
end
return T
