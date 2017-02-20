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
  level = 1
  setupMap(level)
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
	  if up and not space then
		movePlayer(0, -1 * playerSpeed * tileSize * dt)
		player.direction = dBack
	  end
	  if down and not space then
		movePlayer(0, playerSpeed * tileSize * dt)
		player.direction = dFront
	  end
	  if left and not space then
		movePlayer(-1 * playerSpeed * tileSize * dt, 0)
		player.direction = dLeft
	  end
	  if right and not space then
		movePlayer(playerSpeed * tileSize * dt, 0)
		player.direction = dRight
	  end
	  moveMap()
	  updateEntities(dt, space)
    updateUI()
  end

end

function love.keypressed(key,scancode,isrepeat)
  player = getPlayer()
  if key == "space" then
    space = true
	elseif key == "w" then
		up = true
	elseif key == "s" then
		down = true
	elseif key == "a" then
		left = true
	elseif key == "d" then
		right = true
	end
end

function love.keyreleased(key,scancode)
  if key == "space" then
    space = false
	elseif key == "w" then
		up = false
	elseif key == "s" then
		down = false
	elseif key == "a" then
		left = false
	elseif key == "d" then
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
  --love.graphics.print("MapX: "..mapX, 10, 30)
  --love.graphics.print("MapY: "..mapY, 10, 40)
  love.graphics.print("PlayerNode: (" .. getPlayer().nodeX .. "," .. getPlayer().nodeY .. ")", 10, 30)
  --love.graphics.print("Tile ID: ".. isOnNode(getNodes(),player).tile, 10,60)
  --love.graphics.print("Node Type: "..isOnNode(getNodes(), player).type, 10,70)
  --love.graphics.print("PlayerIceCream: "..tostring(player.iceCream), 10, 80)
  love.graphics.setColor(200,200,200,100)
  local visibleNodes = getVisibleNodes()
  for k,v in pairs(hiddenNodes) do
    local sp = worldToScreenPos(v.x, v.y,mapX,mapY,tileSize)
	  love.graphics.draw(tilesetImage,tileQuads[70],sp.x,sp.y)
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