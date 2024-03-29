--[[ This is Messy. It needs organized ]]--


forest1splash = LoaderScreen.create(0)
forest1splash:setFadeSpeed(8.5)
forest1splash:setSplash(image.load('images/splash/game_splash.png'))
forest1splash:setObjects(46)

SquirAnim = AnimationObject.create()
	forest1splash:incrementPercent()

Outline = 0.1
	forest1splash:incrementPercent()

Player = TPSController.create(SquirAnim)
	forest1splash:incrementPercent()
Player.object.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
	forest1splash:incrementPercent()
Player.object:update()
	forest1splash:incrementPercent()
Player:setForwardWidth(4)
	forest1splash:incrementPercent()
Player:setBackwardWidth(4)
	forest1splash:incrementPercent()
Player:setRightWidth(4)
	forest1splash:incrementPercent()
Player:setLeftWidth(4)
	forest1splash:incrementPercent()
Player.object:addModel(model.load("objects/animations/swt.obj", Outline, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
Player.object:addModel(model.load("objects/animations/swn.obj", Outline, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
Player.object:addModel(model.load("objects/animations/swm.obj", Outline, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
Player.object:addModel(model.load("objects/animations/swr.obj", Outline, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
Player.object:addModel(model.load("objects/animations/swl.obj", Outline, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
Player.object:addModel(model.load("objects/animations/swj.obj", Outline, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
Player.object:setSpeed(4)
	forest1splash:incrementPercent()
	

TreeModel = model.load("objects/treebase.obj", 0.15, color.new(0, 0, 0))
	forest1splash:incrementPercent()
TreeMap = {{-30,0,0},{30,0,0},{0,0,30}}
	forest1splash:incrementPercent()
Trees = {}

for a = 1, #TreeMap, 1 do
	table.insert(Trees, Object.create(TreeModel))
	Trees[a].position:setPosition(TreeMap[a][1], TreeMap[a][2], TreeMap[a][3])
	Trees[a].collider:setType(2) -- Cylinder
	Trees[a].collider:setData({{-(9)/2, 0, -(9)/2}, {9, 15, 9}})
	Trees[a].collider:setRadius(5.8)
	Trees[a]:update()
	
	--Add to collider:
	Player:addCollider(Trees[a].collider)
end
	forest1splash:incrementPercent()

Floor = Object.create(model.load("objects/forestfloor.obj"))
	forest1splash:incrementPercent()
Floor.position:setPosition(2, 0, 0)
	forest1splash:incrementPercent()
Floor:update()
	forest1splash:incrementPercent()
	
Atmosphere = Environment.create()
	forest1splash:incrementPercent()
Atmosphere:setLights(true) --Enables lights
	forest1splash:incrementPercent()
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
	forest1splash:incrementPercent()
Atmosphere:setSpecular(4.04) --sets the specular strength
	forest1splash:incrementPercent()
Atmosphere:setFogNear(20) --Sets where fog starts
	forest1splash:incrementPercent()
Atmosphere:setFogFar(30) --And where it ends
	forest1splash:incrementPercent()
Atmosphere:setFogColor(color.new(0, 0, 61)) --And the color of fog ?? WHITE?
	forest1splash:incrementPercent()
Atmosphere:update()
	forest1splash:incrementPercent()

light = Light.create()
	forest1splash:incrementPercent()
light:setId(1)
	forest1splash:incrementPercent()
light:enable()
	forest1splash:incrementPercent()
light:setType(2)
	forest1splash:incrementPercent()
light:setDiffuse(color.new(0,0,0))
	forest1splash:incrementPercent()
light:setAmbient(color.new(255,255,255))
	forest1splash:incrementPercent()
light.position:setPosition(0,10,0)
	forest1splash:incrementPercent()
light:update()
	forest1splash:incrementPercent()

controls.analogtodigital(50)
	forest1splash:incrementPercent()

	
--Tree Screen
treeScreen = Object.create(model.load("objects/treescreen.obj", 0.15, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
treeScreenColliders = {CollisionData.create({{-(250)/2, 0, -(15)/2}, {250, 15, 15}}),
					   CollisionData.create({{-(15)/2, 0, -(250)/2}, {15, 15, 250}}),
					   CollisionData.create({{-(250)/2, 0, (15)/2}, {250, 15, 15}}),
					   CollisionData.create({{-(15)/2, 0, -(250)/2}, {15, 15, 250}})}
	forest1splash:incrementPercent()
treeScreenColliders[1].position:setPosition(0, 0, 110)
	forest1splash:incrementPercent()
treeScreenColliders[2].position:setPosition(110, 0, 0)
	forest1splash:incrementPercent()
treeScreenColliders[3].position:setPosition(0, 0, -110)
	forest1splash:incrementPercent()
treeScreenColliders[4].position:setPosition(-110, 0, 0)
	forest1splash:incrementPercent()
for a = 1, 4 do
	Player:addCollider(treeScreenColliders[a])
end
forest1splash:incrementPercent()

forest1splash:fadeOut()
forest1splash:clearSplash()

world.update()

while true do
	screen.clear(color.new(0, 0, 61))
	controls.read()
	
	world.update()
	
	Player.camera:setView()
	
	Player.object:update()
	Player.object:blit()
	
	APos = Player.object.position.position
	BPos = Player.camera.position.position
	--CCPos = Player.cameraCollider.position.position -- Should be the same as the camera position -_-
	
	Floor:update()
	Floor.model:blit()
	treeScreen:update()
	treeScreen.model:blit()
	
	for a = 1, #Trees, 1 do
		Trees[a]:update()
		Trees[a].model:blit()
	end
		
	screen.print(0, 2, "FPS: " .. screen.fps(), color.new(255, 255, 255))
	screen.print(0, 16, "Player: (" .. APos[1] .. ", " .. APos[2] .. ", " .. APos[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 30, "Camera: (" .. BPos[1] .. ", " .. BPos[2] .. ", " .. BPos[3] .. ")", color.new(255, 255, 255))
	
	Player:update()
	
	if controls.select() then
		error("USB Mode")
	end
	
	screen.flip()
	screen.waitvblank()
end