import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "knight"
import "giant"
import "wizard"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	local playerInstance = Wizard(200, 200)
	playerInstance:add()
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end