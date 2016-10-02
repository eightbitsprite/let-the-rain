require "lib/AnimatedSprite"
require "lib/misc"
require "control"
local CScreen = require "lib/CScreen"

screenWidth = 160
screenHeight = 144

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  love.graphics.setBackgroundColor(155, 188, 15)
  CScreen.init(screenWidth,screenHeight,true)
  love.window.setMode(screenWidth*3,screenHeight*3)
  CScreen.update(screenWidth*3,screenHeight*3)
  
  testImage = CScreen.newImage("assets/test_tile.png")
  x = 10
  y = 0
  
  --cloud = GetInstance("../assets/sprite_luas/cloud.lua")
  cloud = {x = 30, y = 20, speed = 20, dim = {16,24}, img = nil}
  cloud.img = GetInstance("assets/sprite_luas/cloud.lua")
  
  flower = {x = 64, y = 64, speed = 0, dim = {16,16}, img = nil}
  flower.img = GetInstance("assets/sprite_luas/flower.lua")
  
  groundImg = CScreen.newImage("assets/ground.png")

end

function love.update(dt)
  --UpdateInstance(cloud.img,dt)
  playerControl(dt, cloud)
  
  if love.keyboard.isDown("space") then
    UpdateInstance(cloud.img,dt,"rain")
  else
    UpdateInstance(cloud.img,dt,"float")
  end 
  
  if y < 100 then
    y = y+1
  elseif y < 200 then
    y = y+1
    UpdateInstance(flower.img,dt,"stalks")
  else 
    UpdateInstance(flower.img,dt,"flowers")
  end
  
  
end

function love.draw()
  CScreen.apply()
    love.graphics.draw(groundImg,0,0)
    love.graphics.draw(groundImg,16,32)
    love.graphics.draw(groundImg,64,96)
    love.graphics.draw(groundImg,112,16)
    love.graphics.draw(groundImg,80,48)
    love.graphics.draw(groundImg,32,112)
    love.graphics.draw(groundImg,112,128)
    --love.graphics.draw(testImage,0,0)
    --love.graphics.draw(testImage,x,15)
    DrawInstance(flower.img, flower.x, flower.y)
    DrawInstance(cloud.img, cloud.x, cloud.y)
    --love.graphics.print(cloud.x, 0, 0)
  CScreen.cease()
end

function love.resize(width, height)
  CScreen.update(width, height)
end
