import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

import "Ball"

-- local ballSpriteCubic = Ball(0, 100)
-- local ballSpriteLinear = Ball(0, 140)

local function initialize()
end

initialize()

local myAnimator = gfx.animator.new(2000, 0, 400)
myAnimator.repeatCount = 3

local cubicAnimator = gfx.animator.new(2000, 0, 400, pd.easingFunctions.inOutCubic)
local linearAnimator = gfx.animator.new(2000, 0, 400)

local lineSegment = pd.geometry.lineSegment.new(0, 0, 400, 240)
local linearAnimator = gfx.animator.new(2000, lineSegment, pd.easingFunctions.outBounce)
-- local ballSpriteLine = Ball(0, 0)

local lineSegment = pd.geometry.lineSegment.new(0, 0, 200, 80)
local arcSegment = pd.geometry.arc.new(200, 120, 40, 0, 180)
local polygonSegment = pd.geometry.polygon.new(200, 160, 300, 90, 390, 230)

local parts = { lineSegment, arcSegment, polygonSegment }
local durations = { 3000, 1000, 2000 }
local easingFunctions = { pd.easingFunctions.outQuart, pd.easingFunctions.inOutCubic, pd.easingFunctions.outBounce }

local partsAnimator = gfx.animator.new(durations, parts, easingFunctions)

local ballSpriteParts = Ball(0, 0)

function pd.update()
	-- if not myAnimator:ended() then
	-- 	print(myAnimator:currentValue())
	-- end

	-- local cubicX = cubicAnimator:currentValue()
	-- ballSpriteCubic:moveTo(cubicX, ballSpriteCubic.y)

	-- local linearX = linearAnimator:currentValue()
	-- ballSpriteLinear:moveTo(linearX, ballSpriteLinear.y)

	-- ballSpriteLine:moveTo(linearAnimator:currentValue())

	ballSpriteParts:moveTo(partsAnimator:currentValue())

	gfx.sprite.update()
	pd.timer.updateTimers()
	pd.drawFPS(380, 10)
end