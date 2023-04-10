local pd <const> = playdate
local gfx <const> = pd.graphics

class("Ball").extends(gfx.sprite)

---@param x number
---@param y number
---@return Ball
function Ball:init(x, y)
    local ballRadius = 16
    local ballImage = gfx.image.new(ballRadius * 2, ballRadius * 2)
    gfx.pushContext(ballImage)
        gfx.fillCircleAtPoint(ballRadius, ballRadius, ballRadius)
    gfx.popContext()
    self:setImage(ballImage)
    self:moveTo(x, y)
    self:add()
end