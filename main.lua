-- main.lua to test git

require("mapDrawing")
require("entityhandler")
require("spriteManager")


function love.load()
  setupMap()
  setupMapView()
  setupTileSet()
  -- love.graphics.setFont(12)
  local initialPlayerPos = {}
  initialPlayerPos.x = 5
  initialPlayerPos.y = 5
  
  initEntityHandler(initialPlayerPos)
  
  local f = love.filesystem.newFile("init.txt")
  f:open("w")
  f:write("hey" .. "\r\n")
  f:close()
  
  setupCharacterSprites()
end

function love.update(dt)
  local playerSpeed = getPlayer().speed
  if up then
    --moveMap(0, -0.2 * tileSize * dt)
	movePlayer(0, -1 * playerSpeed * tileSize * dt)
  end
  if down then
    movePlayer(0, playerSpeed * tileSize * dt)
  end
  if left then
    movePlayer(-1 * playerSpeed * tileSize * dt, 0)
  end
  if right then
    movePlayer(playerSpeed * tileSize * dt, 0)
  end
  moveMap()
  updateEntities(dt)
end

function love.keypressed(key,scancode,isrepeat)
  player = getPlayer()
	if key == "up" then
		up = true
    player.direction = dBack
	elseif key == "down" then
		down = true
    player.direction = dFront
	elseif key == "left" then
		left = true
    player.direction = dLeft
	elseif key == "right" then
		right = true
    player.direction = dRight
	end
end

function love.keyreleased(key,scancode)
	if key == "up" then
		up = false
	elseif key == "down" then
		down = false
	elseif key == "left" then
		left = false
	elseif key == "right" then
		right = false
	end
end

function love.draw()
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(tilesetBatch,
    0,0, 0, zoomX, zoomY
  )
  love.graphics.draw(blockingTilesetBatch, 0,0,0, zoomX, zoomY)
  love.graphics.draw(decorationTilesetBatch, 0,0,0, zoomX, zoomY)
  
  local player = getPlayer()
  local playerScreenPos = worldToScreenPos(player.x,player.y,mapX,mapY,tileSize)
  love.graphics.setColor(0,0,0)
  love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
  love.graphics.print("MapX: "..mapX, 10, 30)
  love.graphics.print("MapY: "..mapY, 10, 40)
  love.graphics.print("PlayerNode: (" .. getPlayer().nodeX .. "," .. getPlayer().nodeY .. ")", 10, 50)
  love.graphics.print("Tile ID: ".. isOnNode(getNodes(),player).tile, 10,60)
  love.graphics.print("Node Type: "..isOnNode(getNodes(), player).type, 10,70)
  love.graphics.setColor(200,200,200,100)
  local visibleNodes = getVisibleNodes()
  for k,v in pairs(visibleNodes) do
    local sp = worldToScreenPos(v.x + .5,v.y + .5,mapX,mapY,tileSize)
	love.graphics.circle("fill",sp.x,sp.y,3)
  end
  love.graphics.reset()
  love.graphics.draw(characterSetImage, characterQuads[playerQPos][player.direction], playerScreenPos.x - 10, playerScreenPos.y - 15, 0, 1.5, 1.5)
  
end

function love.threaderror(thread,err)
	local f = love.filesystem.newFile("threaderr.txt")
	f:open("w")
	f:write(err .. "\r\n")
	f:close()
end