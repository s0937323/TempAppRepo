--Create world
function love.load()
	-- body
	love.physics.setMeter(64)
	world = love.physics.newWorld(0,9.81*64,true)

	--Table containing all the objects
	objects = {} 
	--Ground object where the game will take place
	objects.Ground = {}
	objects.Ground.body = love.physics.newBody(world,650/2,650/2)
	objects.Ground.shape = love.physics.newRectangleShape(650,50)
	objects.Ground.fixture = love.physics.newFixture(objects.Ground.body,objects.Ground.shape)
	--Create the Player object
	objects.Player = {}
	objects.Player.body = love.physics.newBody(world,650/2,650/2,"dynamic")
	--temporarily a circle until we have a finalized design
	objects.Player.shape = love.physics.newCircleShape(0,-6,20)
	objects.Player.fixture = love.physics.newFixture(objects.Player.body,objects.Player.shape)
	--set the background color to a nice blue
	love.graphics.setBackgroundColor(104, 136, 248) 
  	love.window.setMode(650, 650)
end

function love.update(dt)
	-- body
	world:update(dt)

	--here we are going to create some keyboard events
  if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    objects.Player.body:applyForce(50, 0)
  elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
    objects.Player.body:applyForce(-50, 0)
  end
end

function love.draw()
	-- body
	--Draws the ground object
	love.graphics.setColor(72,160,14)
	love.graphics.polygon("fill", objects.Ground.body:getWorldPoints(objects.Ground.shape:getPoints()))
	--Draws the player object
	love.graphics.setColor(193,47,14)
	love.graphics.circle("fill",objects.Player.body:getX(), objects.Player.body:getY(),objects.Player.shape:getRadius())
end




--The methods and potential subclasses for the projectiles
--[[
Projectile = Object:new()

function Projectile:new(body,shape,fixture)
	setmetatable({},Object)
	self.body = body
	self.shape = shape
	self.fixture = fixture
	return self
end

function Projectile:Fall( ... )
	-- body
end
]]
