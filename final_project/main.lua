--[[Alex Park's CS50 Game Development Final Project
Name: Jungle Adventure
Utilizing logic and states learned from the course to develop a game
where the player must go through the jungle while avoiding the monkeys.]]


require 'src/Dependencies'

function love.load()
    math.randomseed(os.time())
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Jungle Adventure')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true,
        canvas = false
    })

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['end'] = function () return GameOverState() end
    }
    gStateMachine:change('start')


    love.keyboard.keysPressed = {}


    paused = false
end

function push.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'p' then
        paused = not paused
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    if not paused then
        gStateMachine:update(dt)

        love.keyboard.keysPressed = {}
    end
end

function love.draw()
    push:start()
    gStateMachine:render()
    push:finish()
end