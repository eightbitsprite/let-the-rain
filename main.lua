require "lib/AnimatedSprite"
require "control"
local CScreen = require "lib/CScreen"

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  love.graphics.setBackgroundColor(155, 188, 15)
  CScreen.init(160,144,true)
  love.window.setMode(160*3,144*3)
  CScreen.update(160*3,144*3)
  
  testImage = CScreen.newImage("assets/test_tile.png")
  x = 10
  y = 0
  
  --cloud = GetInstance("../assets/sprite_luas/cloud.lua")
  cloud = {x = 30, y = 20, speed = 20, dim = {16,16}, img = nil}
  cloud.img = GetInstance("assets/sprite_luas/cloud.lua")

end

function love.update(dt)
  UpdateInstance(cloud.img,dt)
  playerControl(dt, cloud)
  
end

function love.draw()
  CScreen.apply()
    love.graphics.draw(testImage,0,0)
    love.graphics.draw(testImage,x,15)
    DrawInstance(cloud.img, cloud.x, cloud.y)
  CScreen.cease()
end

function love.resize(width, height)
  CScreen.update(width, height)
end
