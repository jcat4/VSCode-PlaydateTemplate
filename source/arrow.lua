local pd <const> = playdate
local gfx <const> = pd.graphics

class("Arrow").extends(gfx.sprite)

-- TODO: this should be deceleration, or explicitly passed as negative
function Arrow:init(x, y, speed, accel)
    Arrow.super.init(self)
    local arrowImage = gfx.image.new("images/arrow")
    self:setImage(arrowImage)
    self:moveTo(x, y)
    self:setCollideRect(0, 4, 12, 8)
    self:setGroups(1)
    self.speed = speed
    self.accel = accel
    self.currSpeed = speed
    self.minSpeed = speed / 2
    self.yOffset = math.random(-10, 10) / 10
    -- TODO: this should be xDirection
    self.dir = 1
end

function Arrow:velocity()
    return self.dir * self.currSpeed
end

function Arrow:update()
    Arrow.super.update(self)
    local _actualX, _actualY, _collisions, collisionsLen = self:moveWithCollisions(self.x + self:velocity(), self.y + self.yOffset)
    self:handleBounce(collisionsLen)
    self.currSpeed -= self.dir * self.accel
    if math.abs(self.currSpeed) < self.minSpeed then
        self.currSpeed = self.dir * self.minSpeed
    end
end

function Arrow:handleBounce(collisionsLen)
    if self:collisionResponse(null) ~= "bounce" then
        return
    end

    if collisionsLen ~= 0 then
        self.dir *= -1
        self:setRotation(180)
    end
end

function Arrow:collisionResponse(other)
    return arrowCollisionResponse
end