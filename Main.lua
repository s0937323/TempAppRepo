class = require 'middleclass'
require 'player'
require 'projectile'

function love.load()
	-- body
	love.physics.setMeter(64)
	GAME_WORLD = love.physics.newWorld(0, 9.81 * 64, true)

	--Table containing all the objects
	objects = {} 
	--Ground object where the game will take place
	objects.Ground = {}
	objects.Ground.body = love.physics.newBody(GAME_WORLD,650/2,650/2,"static")
	objects.Ground.shape = love.physics.newRectangleShape(650,250)
	objects.Ground.fixture = love.physics.newFixture(objects.Ground.body,objects.Ground.shape)

	--set the background color to a nice blue
	love.graphics.setBackgroundColor(104, 136, 248) 

	PROJECTILE = projectile:new()
	[[--i = 1
	while(i <= 2) do
		p = objects.Projectile:new()

		i = i + 1
	end
	--]]

	PLAYER = player:new(10, 10)
end

function love.update(dt)
	dt = math.min(1 / 60, dt)
	
	GAME_WORLD:update(dt)
	PLAYER:update(dt)

	--here we are going to create some keyboard events

	
	--[[--Destroys the player object if they happen to be in the same spot
	if objects.Player.body:getPosition() == objects.Projectile.body:getPosition() then
		objects.Player.fixture:destroy()
	end
	--Destroys the projectile object when it hits the ground
	if objects.Ground.body:getY() == objects.Projectile.body:getY() then
		objects.Projectile.fixture:destroy()
	end]]

end

function love.draw()
	-- body
	--Draws the ground object
	love.graphics.setColor(72,160,14)
	love.graphics.polygon("fill", objects.Ground.body:getWorldPoints(objects.Ground.shape:getPoints()))

	PLAYER:draw()

	--Draws the projectile object
	PROJECTILE:draw()
	
	--Borders
	love.graphics.setColor(0,0,0)
	love.graphics.line(-3,-6,-3,-12)
end

function love.keypressed(key)
	if key == "right" then --press the right arrow key to push the ball to the right
		PLAYER:move(50, 0)
	elseif key == "left" then --press the left arrow key to push the ball to the left
		PLAYER:move(-50, 0)
	end
end

function love.keyreleased(key)
	if key == "right" or key == "left" then
		PLAYER:move(0, 0)
	end
end
