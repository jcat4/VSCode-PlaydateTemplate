local pd <const> = playdate
local gfx <const> = pd.graphics

class("Enemy").extends(gfx.sprite)

---@param x number The starting x coordinate of the enemy
---@param y number The starting y coordinate of the enemy
---@param moveSpeed number The speed that the enemy will move
---@return Enemy
function Enemy:init(x, y, moveSpeed)
    local enemyImage = gfx.image.new("images/goblin")
    self:setImage(enemyImage)
    self:moveTo(x, y)
    self:add()

    self:setCollideRect(0, 0, self:getSize())

    self.moveSpeed = moveSpeed
end

function Enemy:update()
    self:moveBy(-self.moveSpeed, 0)
end

function Enemy:collisionResponse()
    -- return gfx.sprite.kCollisionTypeOverlap
    return "overlap"
end