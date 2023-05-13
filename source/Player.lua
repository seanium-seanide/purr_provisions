local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(Object)

function Player:init(upImage, downImage, leftImage, rightImage)
  Player.super.init(self)

  self.images = {upImage, downImage, leftImage, rightImage}

  self.sprite = gfx.sprite.new(self.images[1])
  self.sprite:moveTo(16, 16)
  self.sprite:add()
end

function Player:update()
  if pd.buttonIsPressed(pd.kButtonUp) then
    self.sprite:setImage(self.images[1])
    self.sprite:moveBy(0, -2)
  elseif pd.buttonIsPressed(pd.kButtonDown) then
    self.sprite:setImage(self.images[2])
    self.sprite:moveBy(0, 2)
  elseif pd.buttonIsPressed(pd.kButtonLeft) then
    self.sprite:setImage(self.images[3])
    self.sprite:moveBy(-2, 0)
  elseif pd.buttonIsPressed(pd.kButtonRight) then
    self.sprite:setImage(self.images[4])
    self.sprite:moveBy(2, 0)
  end

  if pd.buttonJustReleased(pd.kButtonUp) then
    local x, y = self.sprite:getPosition()

    y //= 32
    y *= 32
    y -= 16

    self.sprite:moveTo(x, y)
  elseif pd.buttonJustReleased(pd.kButtonDown) then
    local x, y = self.sprite:getPosition()

    y //= 32
    y += 1
    y *= 32
    y += 16

    self.sprite:moveTo(x, y)
  elseif pd.buttonJustReleased(pd.kButtonLeft) then
    local x, y = self.sprite:getPosition()

    x //= 32
    x *= 32
    x -= 16

    self.sprite:moveTo(x, y)
  elseif pd.buttonJustReleased(pd.kButtonRight) then
    local x, y = self.sprite:getPosition()

    x //= 32
    x += 1
    x *= 32
    x += 16

    self.sprite:moveTo(x, y)
  end

end
