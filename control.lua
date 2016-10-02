function playerControl(dt, player)
  if love.keyboard.isDown("escape") then
    love.event.push("quit")
  end
  
  if love.keyboard.isDown('left', 'a') then
    if canMove('left', player.dim, {player.x, player.y}) then
      player.x = player.x - (player.speed*dt)
    end
  elseif love.keyboard.isDown('right', 'd') then
    player.x = player.x + (player.speed*dt)
  end
  
  if love.keyboard.isDown('up', 'w') then
    player.y = player.y - (player.speed*dt)
  elseif love.keyboard.isDown('down', 's') then
    player.y = player.y + (player.speed*dt)
  end
end

--direction = movement direction; dim = dimension
function canMove(direction, dim, loc)
  local Width = love.graphics.getWidth()
  local Height = love.graphics.getHeight()
  local dimx, dimy = unpack(dim)
  local locx, locy = unpack(loc)
  local result = false
  
  if direction      == "up"   then result = locy > 0
  elseif direction  == "down" then result = locy < (Height - dimy)
  elseif direction  == "left" then result = locx > 0
  elseif direction  == "right"then result = locx < (Width - dimx)
  end

  return result
end

