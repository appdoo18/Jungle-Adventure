--[[
    Player Class using the Entity Class 
]]

Player = Class{__includes = Entity}

function Player:init(def)
    Entity.init(self, def)
end

function Player:update(dt)
    Entity.update(self, dt)
end

function Player:render()
    Entity.render(self)
end

-- simple aabb collision with the monkeys that will be flying from right to left
-- on the screen
function Player:collides(monkey)
    if self.x + self.width >= monkey.x and self.x <= monkey.x then
        if self.y + self.height >= monkey.y and self.y <= monkey.y then 
            return true
        end
    end
end