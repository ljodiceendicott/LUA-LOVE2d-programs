W = love.graphics.getWidth()
H = love.graphics.getHeight()

local bgcolor = {0.3, 0.3, 0.3}
local x = 100
local y = H-50
local ghosts = {}
local time = 0
local frames = 0
local fps = .25
local score = 0
local gameOver = false
local txtx = -100
local txty = -100
local playerHitByGhost = false
local player = {}


function love.load()
  bg = love.graphics.newImage("img/background.png")
  ghostsound = love.audio.newSource("sound/respawn.wav","static")
  playerhit = love.audio.newSource("sound/Ouche.wav", "static")
  bgsound = love.audio.newSource("sound/bgsound.wav", "static")
  player.x  = 100
  player.y= H-50
  player.w = 30
  player.h = 30
  for i = 1,6 do
    ghosts[i] = {}
    ghosts[i].x = W
    ghosts[i].dx = love.math.random(100, 200)
    ghosts[i].w = love.math.random(20,50)
    ghosts[i].h = love.math.random(30,60)
    ghosts[i].y = love.math.random(0,H-ghosts[i].h)
  end
end

function love.draw()
  if not playerHitByGhost then
    love.graphics.setColor(0,1,0)
    love.graphics.draw(bg,0,0)
  end
  love.graphics.setColor({1,1,1,1})
  love.graphics.print(score,0,0)
  love.graphics.setBackgroundColor(bgcolor)
  -- PLAYER
  love.graphics.setColor({0,0.5,1,1})
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h);

  love.graphics.setColor(1,1,1,.4)
    for i = 1, #ghosts do
      love.graphics.rectangle("fill", ghosts[i].x, ghosts[i].y, ghosts[i].w, ghosts[i].h);
    end
  love.graphics.setColor(0,0,0,1)
--  love.graphics.rectangle(mode, x, y, width, height)
 love.graphics.rectangle("fill", txtx-40, txty-25, 250, 60)
 love.graphics.setColor(1,0,0,1)
 love.graphics.print("Your Final Score was: ".. score, txtx,txty)
end


local function touchingAnyEnemy()
  local alhs = player.x
  local arhs = player.x + 30
  local atop = player.y
  local abottom = player.y+30

  for i =1, #ghosts do
    local blhs = ghosts[i].x
    local brhs = ghosts[i].x + ghosts[i].w
    local btop = ghosts[i].y
    local bbottom = ghosts[i].y+ghosts[i].h

    if((alhs <= brhs and arhs >= blhs) and (atop <= bbottom and abottom >= btop)) then
      bgcolor = {0.7, 0.1, 0.1}
      if  not playerHitByGhost then
      playerhit:play()
    end
    playerHitByGhost = true
      txtx = W/2-60
      txty = H/2
      for i =1, #ghosts do
        ghosts[i].dx = 0
      end
      return true
    end
  end

  return false
end
function scoreCalc(dt)
  if ghosts[1].dx > 0 then
  time = time + dt
  if(time > fps) then
    time = time - fps
    score = score + 1
    if(score % 5 == 0) then
      for i = 1, #ghosts do
        ghosts[i].dx = ghosts[i].dx + 20
      end
    end
  end
end
end
function love.update(dt)
  bgsound:play()
    scoreCalc(dt)
  for i =1 , #ghosts do
    ghosts[i].x =ghosts[i].x-(ghosts[i].dx*dt)
    if ghosts[i].x<-5 then
      ghostsound:play()
      ghosts[i].x = W

      --ghosts[i].dx = ghosts[i].dx + 5
      ghosts[i].y = love.math.random(0,H-ghosts[i].w)
    end
  end

  local notTouchingEnemy = not touchingAnyEnemy()
  -- LEFT KEY
  if(love.keyboard.isDown("a") and notTouchingEnemy) then
    if(player.x > (W*0.1)) then
      if(love.keyboard.isDown("w") or love.keyboard.isDown("s"))then
        player.x = player.x - (200*dt*.59)
      end
      if(not love.keyboard.isDown("w") and not love.keyboard.isDown("s"))then
          player.x = player.x - (200*dt)
      end
    end
  end
  -- RIGHT PLAYER KEY
  if(love.keyboard.isDown("d") and notTouchingEnemy) then
    if( player.x < (W * .75) ) then
      if(love.keyboard.isDown("w") or love.keyboard.isDown("s"))then
        player.x = player.x + (200*dt*.59)
      end
      if(not love.keyboard.isDown("w") and not love.keyboard.isDown("s"))then
          player.x = player.x + (200*dt)
      end
    end
  end
if(love.keyboard.isDown("w") and notTouchingEnemy) then
  if(love.keyboard.isDown("a") or love.keyboard.isDown("d"))then
    player.y = player.y-(200*dt*.59)
  end
  if(not love.keyboard.isDown("a") and not love.keyboard.isDown("d"))then
    player.y = player.y-(200*dt)
  end
end
if(love.keyboard.isDown("s") and notTouchingEnemy) then
  if(love.keyboard.isDown("a") or love.keyboard.isDown("d"))then
    player.y = player.y+(200*dt*.59)
  end
  if(not love.keyboard.isDown("a") and not love.keyboard.isDown("d"))then
    player.y = player.y+(200*dt)
  end
end
end
