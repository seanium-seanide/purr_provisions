import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"

local gfx <const> = playdate.graphics
local playerSprite = nil

function init()
  --[[
  -- Load images
  
  local playerImage = gfx.image.new("images/playerImage")
  assert(playerImage) -- make sure the image was where we thought

  local backgroundImage = gfx.image.new("images/background")
  assert(backgroundImage)

  -- Create player sprite 

  playerSprite = gfx.sprite.new( playerImage )
  playerSprite:moveTo( 200, 120 ) 
  playerSprite:add()

  -- Register draw background callback

  drawBackgroundCallback = function( x, y, width, height )
    backgroundImage:draw( 0, 0 )
  end
  gfx.sprite.setBackgroundDrawingCallback(drawBackgroundCallback)
  --]]

  -- MyClass = class('PeePee').extends(Object)
end

init()

function playdate.update()
  --[[
  if playdate.buttonIsPressed( playdate.kButtonUp ) then
    playerSprite:moveBy( 0, -2 )
  end

  if playdate.buttonIsPressed( playdate.kButtonRight ) then
    playerSprite:moveBy( 2, 0 )
  end

  if playdate.buttonIsPressed( playdate.kButtonDown ) then
      playerSprite:moveBy( 0, 2 )
  end

  if playdate.buttonIsPressed( playdate.kButtonLeft ) then
      playerSprite:moveBy( -2, 0 )
  end
  --]]

  -- Update sprite
  gfx.sprite.update()

  -- Update time
  playdate.timer.updateTimers()
end
