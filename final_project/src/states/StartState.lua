--[[
StartState class 
]]

StartState = Class{__includes = BaseState}
function StartState:init()
	
end

function StartState:update(dt)
	-- pressing enter to play
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('play')
	end
end

function StartState:render()
	love.graphics.draw(gTextures['background'], gFrames['background'][1], 0, 0, 0, 
        VIRTUAL_WIDTH / (gTextures['background']:getWidth() / 2),
        VIRTUAL_HEIGHT / (gTextures['background']:getHeight() / 2), -0.5)

	love.graphics.printf('Jungle Egg Rescue', 1, VIRTUAL_HEIGHT / 2 - 40, VIRTUAL_WIDTH, 'center')
	love.graphics.printf('Press Enter to Play', 1, VIRTUAL_HEIGHT / 2 + 17, VIRTUAL_WIDTH, 'center')
end