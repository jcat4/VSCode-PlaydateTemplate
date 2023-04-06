local pd <const> = playdate
local gfx <const> = pd.graphics

import "healthbar"

class('Circle').extends(gfx.sprite)

function Circle:init(x, y, r)
    Circle.super.init(self)
    self:moveTo(x, y)

    local circleImage = gfx.image.new(r * 2, r * 2)
    gfx.pushContext(circleImage)
        gfx.fillCircleAtPoint(r, r, r)
    gfx.popContext()
    self:setImage(circleImage)

    self.speed = 5
    self.healthBar = Healthbar(x, y - 30, 30)
    self:setCollideRect(0, 0, self:getSize())
end

function Circle:damage(amount)
    self.healthBar:damage(amount)
end

function Circle:update()
    Circle.super.update(self)
    if pd.buttonIsPressed(pd.kButtonUp) then
        self:moveBy(0, -self.speed)
    end
    if pd.buttonIsPressed(pd.kButtonRight) then
        self:moveBy(self.speed, 0)
    end
    if pd.buttonIsPressed(pd.kButtonDown) then
        self:moveBy(0, self.speed)
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self:moveBy(-self.speed, 0)
    end
end

function Circle:moveBy(x, y)
    Circle.super.moveBy(self, x, y)
    self.healthBar:moveBy(x, y)
end
