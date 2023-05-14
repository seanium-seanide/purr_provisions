local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(Object)

function Player:init(upImage, downImage, leftImage, rightImage)
  Player.super.init(self)

  self.images = {upImage, downImage, leftImage, rightImage}

  self.sprite = gfx.sprite.new(self.images[1])
  self.sprite:moveTo(16, 16)
  self.sprite:add()
  self.direction = 'up'
  self.speed = 100
end

--direction = 'up'

function Player:update()
  dt = pd.getElapsedTime()
  pd.resetElapsedTime()

  -- Set sprite

  if pd.buttonJustPressed(pd.kButtonUp) then
    direction = 'up'
    self.sprite:setImage(self.images[1])
  end

  if pd.buttonJustPressed(pd.kButtonDown) then
    direction = 'down'
    self.sprite:setImage(self.images[2])
  end

  if pd.buttonJustPressed(pd.kButtonLeft) then
    direction = 'left'
    self.sprite:setImage(self.images[3])
  end

  if pd.buttonJustPressed(pd.kButtonRight) then
    direction = 'right'
    self.sprite:setImage(self.images[4])
  end

  -- Button press

  if pd.buttonIsPressed(pd.kButtonUp) then
    if direction == 'up' then
      self.sprite:moveBy(0, -self.speed * dt)
    end
  end

  if pd.buttonIsPressed(pd.kButtonDown) then
    if direction == 'down' then
      self.sprite:moveBy(0, self.speed * dt)
    end
  end

  if pd.buttonIsPressed(pd.kButtonLeft) then
    if direction == 'left' then
      self.sprite:moveBy(-self.speed * dt, 0)
    end
  end

  if pd.buttonIsPressed(pd.kButtonRight) then
    if direction == 'right' then
      self.sprite:moveBy(self.speed * dt, 0)
    end
  end

  -- Button release

  if pd.buttonJustReleased(pd.kButtonUp) then
    local x, y = self.sprite:getPosition()

    n = (y - 16) // 32
    y = 16 + n * 32

    self.sprite:moveTo(x, y)
  elseif pd.buttonJustReleased(pd.kButtonDown) then
    local x, y = self.sprite:getPosition()

    n = (y - 16) // 32 + 1
    y = 16 + n * 32

    self.sprite:moveTo(x, y)
  elseif pd.buttonJustReleased(pd.kButtonLeft) then
    local x, y = self.sprite:getPosition()

    n = (x - 16) // 32
    x = 16 + n * 32

    self.sprite:moveTo(x, y)
  elseif pd.buttonJustReleased(pd.kButtonRight) then
    local x, y = self.sprite:getPosition()

    n = (x - 16) // 32 + 1
    x = 16 + n * 32

    self.sprite:moveTo(x, y)
  end
end
