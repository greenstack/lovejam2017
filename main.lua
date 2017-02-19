-- main.lua to test git

require("mapDrawing")
require("entityhandler")
require("spriteManager")
require("uimanager")

obedience_meter = 100
lose = false
contacts = 0
contact_goal = 10

function love.load()
  setupMap()
  setupMapView()
  setupTileSet()
  -- love.graphics.setFont(12)
  local initialPlayerPos = {}
  initialPlayerPos.x = 5
  initialPlayerPos.y = 5
  
  initEntityHandler(initialPlayerPos)
  setupCharacterSprites()
end

function love.update(dt)
  if not lose then
	  local playerSpeed = getPlayer().speed
	  if up then
		movePlayer(0, -1 * playerSpeed * tileSize * dt)
		player.direction = dBack
	  end
	  if down then
		movePlayer(0, playerSpeed * tileSize * dt)
		player.direction = dFront
	  end
	  if left then
		movePlayer(-1 * playerSpeed * tileSize * dt, 0)
		player.direction = dLeft
	  end
	  if right then
		movePlayer(playerSpeed * tileSize * dt, 0)
		player.direction = dRight
	  end
	  moveMap()
	  updateEntities(dt)
    updateUI()
  end
end

function love.keypressed(key,scancode,isrepeat)
  player = getPlayer()
	if key == "up" then
		up = true
	elseif key == "down" then
		down = true
	elseif key == "left" then
		left = true
	elseif key == "right" then
		right = true
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
  local companion = getCompanion()
  local companionScreenPos = worldToScreenPos(companion.x,companion.y,mapX,mapY,tileSize)
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
  local entityHitboxOffsetX = 10
  local entityHitboxOffsetY = 15
  local entityScale = 1.5
  love.graphics.draw(characterSetImage, characterQuads[playerQPos][player.direction], playerScreenPos.x - entityHitboxOffsetX, playerScreenPos.y - entityHitboxOffsetY, 0, entityScale, entityScale)
  love.graphics.draw(characterSetImage, characterQuads[companionQPos][companion.direction], companionScreenPos.x - entityHitboxOffsetX, companionScreenPos.y - entityHitboxOffsetY, 0, entityScale, entityScale)

  drawUI()
end

function love.threaderror(thread,err)
	local f = love.filesystem.newFile("threaderr.txt")
	f:open("w")
	f:write(err .. "\r\n")
	f:close()
end