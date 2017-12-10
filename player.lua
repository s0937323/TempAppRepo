player = class("player")

function player:init(x, y)
	self.body = love.physics.newBody(GAME_WORLD, x, y,"dynamic")
	self.body:setMass(100)

	self.shape = love.physics.newCircleShape(20)
	self.fixture = love.physics.newFixture(self.body, self.shape, 1)

	self.fixture:setRestitution(0.4)
	
	self.speedx = 0
	self.speedy = 0

	self.rightkey = false
	self.leftkey = false
end

function player:update(dt)
	if self.rightkey then
		self.body:applyForce(50, 0)
	elseif self.leftkey then
		self.body:applyForce(-50, 0)
	end
	
	if not self.leftkey and not self.rightkey then
		if not self.leftkey then
			self.speedx = math.min(self.speedx + 30 * dt, 0)
		elseif not self.rightkey then
			self.speedx = math.max(self.speedx - 30 * dt, 0)
		end
	end
end

function player:draw()
	love.graphics.setColor(193,47,14)
	love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end

function player:moveRight(move)
	self.rightkey = move
end

function player:moveLeft(move)
	self.leftkey = move
end