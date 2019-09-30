--[[
	Used as the base class for all the states so empty methods 
	don't need to be defined in each state.
]]

BaseState = Class{}

function BaseState:init() end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end