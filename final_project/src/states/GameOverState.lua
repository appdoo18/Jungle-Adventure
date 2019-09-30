

GameOverState = Class{__includes = BaseState}

function GameOverState:enter(params)
	-- taking the timer to display as length of time played
	self.timer = params.time
end

function GameOverState:update(dt)
	-- can press enter to play again
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('play')
	end
end

function GameOverState:render()
	love.graphics.push()
	love.graphics.draw(gTextures['background'], gFrames['background'][1], 0, 0, 0, 
        VIRTUAL_WIDTH / (gTextures['background']:getWidth() / 2),
        VIRTUAL_HEIGHT / (gTextures['background']:getHeight() / 2), -0.5)

	love.graphics.print('You lost! Press enter to play again!', VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 2)

	love.graphics.print('You lasted: ' .. tostring(self.timer) .. ' seconds', VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 2 - 20)
	love.graphics.pop()
end