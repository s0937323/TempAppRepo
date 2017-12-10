projectile = class("projectile")

function projectile:init( ... )
	-- body
		x = love.math.random(50,550)
		objects.Projectile.body = love.physics.newBody(GAME_WORLD,x,5,"dynamic")
		objects.Projectile.shape = love.physics.newRectangleShape(20,20)
		objects.Projectile.fixture = love.physics.newFixture(objects.Projectile.body,objects.Projectile.shape)
		objects.Projectile.body:setGravityScale(.125)

end
