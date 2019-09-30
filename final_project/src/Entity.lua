

Entity = Class{}

function Entity:init(def)
	-- position
	self.x = def.x
	self.y = def.y

	--velocity
	self.dx = 0
	self.dy = 0

	-- dimensions
	self.width = def.width
	self.height = def.height
	self.texture = def.texture
	self.stateMachine = def.stateMachine
end

function Entity:changeStates(state, params)
	self.stateMachine:change(state, params)
end

function Entity:update(dt)
end

function Entity:collides(entity)
    return not (self.x > entity.x + entity.width or entity.x > self.x + self.width or
                self.y > entity.y + entity.height or entity.y > self.y + self.height)
end

function Entity:render()
    love.graphics.draw(gTextures[self.texture],
        math.floor(self.x) + 8, math.floor(self.y))
end