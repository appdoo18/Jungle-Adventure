--[[
	Monkey Class

	The monkeys will be flying across the screen which will be started 
	off the screen to the right.
]]

Monkey = Class{}

-- just loading the picture once and not per instantiation
local monkey_picture = love.graphics.newImage('graphics/monkey.png')

function Monkey:init(y)
	self.x = VIRTUAL_WIDTH
	self.y = y
end

function Monkey:update(dt)
    
end

function Monkey:render()
	love.graphics.draw(monkey_picture, self.x, self.y)
end