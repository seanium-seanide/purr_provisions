local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(Object)

function Player:init(upImage, downImage, leftImage, rightImage)
  Player.super.init(self)

  self.images = {upImage, downImage, leftImage, rightImage}

  self.sprite = gfx.sprite.new(self.images[1])
  self.sprite:moveTo(200, 120)
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
end
