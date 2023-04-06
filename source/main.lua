import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

local pd <const> = playdate
local gfx <const> = pd.graphics

import "circle"
import "spike"

local function initialize()
    local circleSprite = Circle(200, 120, 20)
    circleSprite:add()

    local circleSprite2 = Circle(200, 220, 10)
    circleSprite2:add()

    local spike = Spike(300, 120)
    spike:add()
end

initialize()

function pd.update()
    gfx.sprite.update()
end
