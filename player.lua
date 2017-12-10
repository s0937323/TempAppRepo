player = class("player")

function player:init(x, y)
	self.char = {}

	self.char.head = {}
	self.char.head.body = love.physics.newBody(GAME_WORLD, x, y, "dynamic")
	self.char.head.shape = love.physics.newCircleShape(10)
	self.char.head.fixture = love.physics.newFixture(self.char.head.body, self.char.head.shape, 1)
	
	self.char.body = {}
	self.char.body.body = love.physics.newBody(GAME_WORLD, x, y + 20, "dynamic")
	self.char.body.shape = love.physics.newRectangleShape(1, 30)
	self.char.body.fixture = love.physics.newFixture(self.char.body.body, self.char.body.shape, 1)
	
	self.char.leftLeg = {}
	self.char.leftLeg.body = love.physics.newBody(GAME_WORLD, x, y + 40, "dynamic")
	self.char.leftLeg.shape = love.physics.newRectangleShape(0, 0, 1, 30, math.pi / 4)
	self.char.leftLeg.fixture = love.physics.newFixture(self.char.body.body, self.char.body.shape, 1)

	love.physics.newMotorJoint(self.char.head.body, self.char.body.body, 0.3, true)

	--[[{
		head = 
		{
			shape = ,
			fixture = 
		},
		body =
		{
			shape = love.physics.newRectangleShape(1, 10),
			
		}
	}]]

	self.speedx = 0
	self.speedy = 0

	self.rightkey = false
	self.leftkey = false
end

function player:update(dt)
	if self.rightkey then
		self.char.head.body:applyForce(50, 0)
	elseif self.leftkey then
		self.char.head.body:applyForce(-50, 0)
	elseif love.keyboard.isDown("space") then
		self.char.head.body:applyForce(0, -200)
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
	for k, v in pairs(self.char) do
		if v.shape:getType() == "circle" then
			love.graphics.setColor(255, 255, 255)
			love.graphics.circle("fill", v.body:getX(), v.body:getY(), 10)
		elseif v.shape:getType() == "polygon" then
			love.graphics.setColor(0, 0, 0)
			love.graphics.polygon("fill", v.body:getWorldPoints(v.shape:getPoints()))
		end
	end
end

function player:moveRight(move)
	self.rightkey = move
end

function player:moveLeft(move)
	self.leftkey = move
end