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
	objects.Ground.fixture = love.physics.newFixture(body,shape)
	--set the background color to a nice blue
	love.graphics.setBackgroundColor(104, 136, 248) 
  	love.window.setMode(650, 650)
end

function love.update(dt)
	-- body
end

function love.draw()
	-- body
end


--the Player object and all methods related to it
--Player = Object:new()
--[[
function Player:new(body,shape,fixture)
	setmetatable({},Object)
	self.body = body
	self.shape = shape
	self.fixture = fixture
	return self
end
Player.is_Hit = false
--Decides what happens the player comes into contact with another object
function Player:Collision( event)
	-- body
	if event.phase == "play" then
		local target = event.other
		if target.is_Hit then
		end
	end
end
--Lets the user control what direction the ragdoll goes
function Player:Controls(event)
	--body
	

	end

--The methods and potential subclasses for the projectiles
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
