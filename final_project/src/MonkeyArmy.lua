--[[
	MonkeyArmy Class 
	Where the pairs of monkeys will stay together as 
	they move across the screen and must 
	maneuver around them to continue
]]

MonkeyArmy = Class{}

function MonkeyArmy:init(y)

	-- flag whether we have passed the pair of monkeys
	self.passed = false

	-- pairs are spawned beyond the screen
	self.x = VIRTUAL_WIDTH

	-- using y to create the gap between the monkeys
	self.y = y

	-- the two pairs of monkeys 
	self.army = {
		['top'] = Monkey(self.y),
		['bottom'] = Monkey(self.y + math.random(50, 100))
	}

	self.remove = false
end

function MonkeyArmy:update(dt)

	-- removing the monkeys
	if self.x > 0 then
		self.x = self.x - (20 * math.random(5)) * dt 
		self.army['top'].x = self.x
		self.army['bottom'].x = self.x
	else
		self.remove = true
	end
end

function MonkeyArmy:render()
	for i, monkey in pairs(self.army) do
		monkey:render()
	end
end