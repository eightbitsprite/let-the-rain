print("cloud.lua loaded")
require "love.graphics"

local image = love.graphics.newImage("assets/cloud.png")
local width = image:getWidth()
local height = image:getHeight()

return {
  serialization_version = 1.0,
  
  sprite_sheet = "assets/cloud.png",
  sprite_name = "cloud",
  
  frame_duration = .75,
  
  animations_names = {
    "float"
  },
  
  animations = {
    float = {
      love.graphics.newQuad(0,0,16,16,width,height),
      love.graphics.newQuad(16,0,16,16,width,height),
      love.graphics.newQuad(32,0,16,16,width,height),
      love.graphics.newQuad(48,0,16,16,width,height)
    }
  }
}
