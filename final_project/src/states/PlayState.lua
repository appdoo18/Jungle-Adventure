

PlayState = Class{__includes = BaseState}

function PlayState:init()
	-- timer to display
	self.timer = 0

	-- gravity so dragon drops a bit
	self.gravity = true
	self.gravityValue = 10

	-- initialize empty table for pair of monkeys
	self.monkeyArmy = {}

	-- timer to spawn monkey pair
	self.spawnTimer = 0
	math.randomseed(os.time())

	-- increment timer by 1
	Timer.every(1, function()
		self.timer = self.timer + 1
	end)

	-- increment spawntimer by 1
	Timer.every(1, function()
		self.spawnTimer = self.spawnTimer + 1
	end)

	-- initialize setY so monkeys don't spawn too far up or down
	self.setY = 20
end

function PlayState:enter(params)
	
	-- initialize player
    self.player = Player({
        x = VIRTUAL_WIDTH / 4, y = VIRTUAL_HEIGHT / 2,
        width = 16, height = 20,
        texture = 'dragon',
    })

end

function PlayState:update(dt)

	-- player movement keys
	if love.keyboard.wasPressed('space') then
		self.player.dy = -3
	elseif love.keyboard.isDown('left') then
		self.player.x = self.player.x - 3
	elseif love.keyboard.isDown('right') then 
		self.player.x = self.player.x + 3
	end

	-- gravity acting on player
	self.player.dy = self.player.dy + self.gravityValue * dt
	self.player.y = self.player.y + self.player.dy

	-- bounds for the player so dragon doesn't go off screen
	if self.player.x <= 0 then
		self.player.x = 0
	elseif self.player.x >= VIRTUAL_WIDTH - 60 then
		self.player.x = VIRTUAL_WIDTH - 60
	end
	if self.player.y <= 0 then
		self.player.y = 0
	elseif self.player.y >= VIRTUAL_HEIGHT - 40 then
		self.player.y = VIRTUAL_HEIGHT - 40
	end

	-- spawn pair of monkeys between 2.1 and 8 seconds
	if self.spawnTimer > math.random(2, 8) then 
		local y = math.max(80, self.setY + math.random(-40, 40))
		self.setY = y
		table.insert(self.monkeyArmy, MonkeyArmy(y))
		self.spawnTimer = 0
	end

	-- mainly to update the monkeys locations
    for i, pair in pairs(self.monkeyArmy) do
        if not pair.passed then
            if pair.x <= self.player.x then
            end
        end
        pair:update(dt)
    end

    -- remove the monkeys
	for i, pair in pairs(self.monkeyArmy) do
		if pair.remove then
			table.remove(self.monkeyArmy, i)
		end
	end

	-- collision between player and monkey
	for i, pair in pairs(self.monkeyArmy) do
		for j, monkey in pairs(self.monkeyArmy) do
			if self.player:collides(monkey) then
				gStateMachine:change('end', {
					time = self.timer
				})
			end
		end
	end

	-- end the game if player hits the floor
	if self.player.y > VIRTUAL_HEIGHT - 41 then
		gStateMachine:change('end', {
			time = self.timer
			})
	end

	-- update player and timer
	self.player:update(dt)
	Timer.update(dt)
end

function PlayState:render()
	love.graphics.push()
	love.graphics.draw(gTextures['background'], gFrames['background'][1], 0, 0, 0, 
        VIRTUAL_WIDTH / (gTextures['background']:getWidth() / 2),
        VIRTUAL_HEIGHT / (gTextures['background']:getHeight() / 2), -0.5)

	for i, pair in pairs(self.monkeyArmy) do
		pair:render()
	end
	self.player:render()
	love.graphics.print('Timer: ' .. tostring(self.timer), 8, 8, 0)
	love.graphics.pop()
end


