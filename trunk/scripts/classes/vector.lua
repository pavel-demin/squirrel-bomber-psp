--requires:

Vector = {}
Vector.__index = Vector

function Vector.create(position, rotation)
	local vec = {}
	setmetatable(vec, Vector)
	
	vec.position = position or {}
	vec.rotation = rotation or {}
	
	return vec
end

function Vector:setPosition(x, y, z)
	self.position[1] = x
	self.position[2] = y
	self.position[3] = z
end

function Vector:setRotation(x, y, z)
	self.rotation[1] = x
	self.rotation[2] = y
	self.rotation[3] = z
end

function Vector:rotateTowards(vector)
	local angleXZ = math.atan2(vector.position[3] - self.position[3], vector.position[1] - self.position[1])
	local angleYZ = math.atan2(vector.position[2] - self.position[2], vector.position[3] - self.position[3])
	
	self.rotation[1] = angleXZ
	self.rotation[2] = angleYZ
	self.rotation[3] = angleXZ
	
	--Now that I've done that... I'm kinda wondering why we didn't just set the camera's lookAt to the objects position :P
end