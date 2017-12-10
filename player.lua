player = class("player")

function player:init(x, y)
	self.x = x
	self.y = y

	self.body = love.physics.newBody(GAME_WORLD, x, y,"dynamic")
	self.body:setMass(100)

	self.shape = love.physics.newCircleShape(20)
	self.fixture = love.physics.newFixture(self.body, self.shape)

	self.speedx = 0
	self.speedy = 0
end

function player:update(dt)
	self.x = self.x + self.speedx * dt
	self.y = self.y + self.speedy * dt
end

function player:draw()
	love.graphics.setColor(193,47,14)
	love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end

function player:move(dx, dy)
	self.speedx = dx
	self.speedy = dy
end