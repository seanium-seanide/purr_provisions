import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
import "Player"

local pd <const> = playdate
local gfx <const> = pd.graphics

function init()
  local playerUpImage = gfx.image.new("images/playerUp")
  local playerDownImage = gfx.image.new("images/playerDown")
  local playerLeftImage = gfx.image.new("images/playerLeft")
  local playerRightImage = gfx.image.new("images/playerRight")
  assert(playerUpImage)
  assert(playerDownImage)
  assert(playerLeftImage)
  assert(playerRightImage)

  player = Player(playerUpImage, playerDownImage, playerLeftImage, playerRightImage)

  local backgroundImage = gfx.image.new("images/background")
  assert(backgroundImage)

  drawBackgroundCallback = function( x, y, width, height )
    backgroundImage:draw( 0, 0 )
  end
  gfx.sprite.setBackgroundDrawingCallback(drawBackgroundCallback)
end

init()

function playdate.update()
  player:update()

  --print(player.sprite.x)

  gfx.sprite.update()
  pd.timer.updateTimers()
end
