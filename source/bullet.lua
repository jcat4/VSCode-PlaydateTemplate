local pd <const> = playdate
local gfx <const> = pd.graphics

class("Bullet").extends(gfx.sprite)

---@param x number The starting x coordinate of the Bullet
---@param y number The starting y coordinate of the Bullet
---@param speed number The speed that the Bullet will travel
---@return Bullet
function Bullet:init(x, y, speed)
    local bulletSize = 4 -- radius
    local bulletDiameter = bulletSize * 2
    local bulletImage = gfx.image.new(bulletDiameter, bulletDiameter)
    gfx.pushContext(bulletImage)
        -- TODO: why did he use bulletSize as the x and y?
        gfx.drawCircleAtPoint(bulletSize, bulletSize, bulletSize)
    gfx.popContext()
    self:setImage(bulletImage)

    self:setCollideRect(0, 0, self:getSize())
    self.speed = speed
    self:moveTo(x, y)
    self:add()
end

function Bullet:update()
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.speed, self.y)

    if length > 0 then
        for index, collisions in pairs(collisions) do

        end
    end
end