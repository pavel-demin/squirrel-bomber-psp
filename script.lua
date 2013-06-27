dofile('scripts/load.lua')

mainmenu = Menu.create(1)
mainmenu:addItem('Test', 'scripts/test.lua')
mainmenu:addItem('Test2', 'scripts/test2.lua')
mainmenu:addItem('Test3', 'scripts/test3.lua')

math.atan2(90 - 60, 130 - 30)

while true do
	controls.read()
	
	if controls.press("up") then
		mainmenu:moveUp()
	end
	if controls.press("down") then
		mainmenu:moveDown()
	end
	if controls.press("cross") then
		mainmenu:executeSelected()
	end
	
	mainmenu:drawFrame()
	screen.flip()
	screen.waitvblankstart()
end