projectile = class("projectile")

function projectile:init()
	-- body
	x = love.math.random(50, 300)
	self.body = love.physics.newBody(GAME_WORLD, x, 5, "dynamic")
	self.shape = love.physics.newRectangleShape(20, 20)
	self.fixture = love.physics.newFixture(self.body, self.shape)
	self.fixture:setUserData({name = "projectile"})

	self.body:setGravityScale(.125)
end

function projectile:update(dt)
	
end

function projectile:draw()
	love.graphics.setColor(15,7,3)
	love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end
