--Create world
function love.load()
	-- body
	love.physics.setMeter(64)
	world = love.physics.newWorld(0,9.81*64,true)

	--Table containing all the objects
	objects = {} 
	--Ground object where the game will take place
	objects.Ground = {}
	objects.Ground.body = love.physics.newBody(world,650/2,650/2,"static")
	objects.Ground.shape = love.physics.newRectangleShape(650,250)
	objects.Ground.fixture = love.physics.newFixture(objects.Ground.body,objects.Ground.shape)
	--Create the Player object
	objects.Player = {}
	objects.Player.body = love.physics.newBody(world,650/2,650/2,"dynamic")
	objects.Player.body:setLinearDamping(0.1)
	--temporarily a circle until we have a finalized design
	objects.Player.shape = love.physics.newCircleShape(6,0,20)
	objects.Player.fixture = love.physics.newFixture(objects.Player.body,objects.Player.shape)
	--set the background color to a nice blue
	love.graphics.setBackgroundColor(104, 136, 248) 
  	love.window.setMode(650, 650)
  	--Create Projectile object
  	objects.Projectile = {}
  	objects.Projectile.body = love.physics.newBody(world,20,5,"dynamic")
  	objects.Projectile.shape = love.physics.newRectangleShape(50,5,20,20,90)
  	objects.Projectile.fixture = love.physics.newFixture(objects.Projectile.body,objects.Projectile.shape)
  	objects.Projectile.body:setGravityScale(.125)
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
  --Destroys the player object if they happen to be in the same spot
  if objects.Player.body:getPosition() == objects.Projectile.body:getPosition() then
  		objects.Player.fixture:destroy()
  end
  --Destroys the projectile object when it hits the ground
  if objects.Ground.body:getY() == objects.Projectile.body:getY() then
  		objects.Projectile.fixture:destroy()
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
	--Draws the projectile object
	love.graphics.setColor(15,7,3)
	love.graphics.rectangle("fill",objects.Projectile.body:getX(),objects.Projectile.body:getY(),20,20,90)
	--Borders
	love.graphics.setColor(0,0,0)
	love.graphics.line(-3,-6,-3,-12)
end





