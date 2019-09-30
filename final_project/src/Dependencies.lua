--libraries

Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

-- Utility
require 'src/Util'
require 'src/constants'
require 'src/StateMachine'

-- states 
require 'src/states/BaseState'
require 'src/states/PlayState'
require 'src/states/StartState'
require 'src/states/GameOverState'

-- general
require 'src/Entity'
require 'src/Player'
require 'src/Monkey'
require 'src/MonkeyArmy'

gTextures = {
	['background'] = love.graphics.newImage('graphics/jungle2.jpg'),
	['dragon'] = love.graphics.newImage('graphics/dragon.png')
}

gFrames = {
	['background'] = genQuads(gTextures['background'], 720, 405.5), 
}