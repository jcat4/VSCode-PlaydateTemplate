import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "enemy"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
end

Player(30, 120)
Enemy(400, 120, 1)

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
	pd.drawFPS(380, 10)
end