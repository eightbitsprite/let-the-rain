print("cloud.lua loaded")
require "love.graphics"

local image = love.graphics.newImage("assets/flower.png")
local width = image:getWidth()
local height = image:getHeight()

return {
  serialization_version = 1.0,
  
  sprite_sheet = "assets/flower.png",
  sprite_name = "flower",
  
  frame_duration = .75,
  
  animations_names = {
    "sprouts",
    "stalks",
    "flowers"
  },
  
  animations = {
    sprouts = {
      love.graphics.newQuad(0,0,16,16,width,height)
    },
    stalks = {
      love.graphics.newQuad(16,0,16,16,width,height)
    },
    flowers = {
      love.graphics.newQuad(32,0,16,16,width,height)
    }
  }
}
