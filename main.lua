-- main.lua to test git

require("mapDrawing")
require("entityhandler")



function love.load()
  setupMap()
  setupMapView()
  setupTileSet()
  -- love.graphics.setFont(12)
  local initialPlayerPos = {}
  initialPlayerPos.x = 5
  initialPlayerPos.y = 5
  
  initEntityHandler(initialPlayerPos)  
  
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
  love.graphics.setColor(255,255,255)
  love.graphics.draw(tilesetBatch,
    0,0, 0, zoomX, zoomY
  )
  
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
  
  love.graphics.setColor(200,80,40) -- the player's dot
  love.graphics.circle("fill",playerScreenPos.x, playerScreenPos.y,8)
  love.graphics.setColor(100,180,80) -- the companion's dot
  love.graphics.circle("fill",companionScreenPos.x, companionScreenPos.y,8)
  
end

function love.threaderror(thread,err)
	local f = love.filesystem.newFile("threaderr.txt")
	f:open("w")
	f:write(err .. "\r\n")
	f:close()
end