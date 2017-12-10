projectile = class("projectile")

function projectile:init()
	-- body
	x = love.math.random(50,550)
	self.body = love.physics.newBody(GAME_WORLD,x,5,"dynamic")
	self.shape = love.physics.newRectangleShape(20,20)
	self.fixture = love.physics.newFixture(objects.Projectile.body,objects.Projectile.shape)
	self.body:setGravityScale(.125)

end

function projectile:update(dt)
	
end

function projectile:draw()
	love.graphics.setColor(15,7,3)
	love.graphics.rectangle("fill",objects.Projectile.body:getX(),objects.Projectile.body:getY(),20,20,90)
end
