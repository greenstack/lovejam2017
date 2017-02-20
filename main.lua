-- main.lua to test git

require("mapDrawing")
require("entityhandler")
require("spriteManager")
require("uimanager")

level = 0
playlist = {}
songTime = {}
levelTransitionTime = 1
transitionScreen = false

contact_goal = 0
contacts = 0

nextLevel = false

function love.load()
  love.math.setRandomSeed(os.time())
  math.randomseed(os.time())
  
  --doLevelSetupStuff(level)
  
  playlist[1] = love.audio.newSource("resources/sound/Theme A.ogg")
  songTime[1] = 226
  playlist[1]:setVolume(.6)
  playlist[2] = love.audio.newSource("resources/sound/Theme B.ogg")
  songTime[2] = 150
  playlist[3] = love.audio.newSource("resources/sound/Theme C.ogg")
  songTime[3] = 187
  elapsedSongTime = 0
  songIndex = math.random(1,3)
    love.audio.stop()
    love.audio.play(playlist[songIndex])
  
  -- love.graphics.setFont(12)
  
  
end

function doLevelSetupStuff(level)
  contact_goal = 0
  setupMap(level)
  initEntityHandler(level)
  setupMapView()
  setupTileSet()
  setupCharacterSprites()
  obedience_meter = 100
  contacts = 0
  lost = false
end


function lose()
  lost = true
  space = false
  level = 1
end

function love.update(dt)
  if level > 0 then
    if not lost then
      if not transitionScreen then
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
        updateEntities(dt, space)
      end
      moveMap()
      updateUI()
    else
      if space then
        level = 0
        doLevelSetupStuff(level)
      end
    end

    if contacts >= contact_goal then
      nextLevel = true
      contacts = 0
      level = level + 1
    end
  else
    if space then
      level = 1
      doLevelSetupStuff(level)
    end
  end
  
  if elapsedSongTime >= songTime[songIndex] then
    elapsedSongTime = 0
    songIndex = math.random(1,3)
    love.audio.stop()
    love.audio.play(playlist[songIndex])
  else
    elapsedSongTime = elapsedSongTime + dt
  end
  
  if nextLevel then
    if levelTransitionTime <= 0 then
      transitionScreen = false
      nextLevel = false
      levelTransitionTime = 1
      doLevelSetupStuff(level)
    else
      levelTransitionTime = levelTransitionTime - dt
      transitionScreen = true
    end
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
  if level > 0 then
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
    love.graphics.print("Tile ID: ".. isOnNode(getNodes(),player).tile, 10,60)
    --love.graphics.print("Node Type: "..isOnNode(getNodes(), player).type, 10,70)
    --love.graphics.print("PlayerIceCream: "..tostring(player.iceCream), 10, 80)
    love.graphics.setColor(200,200,200,100)
    local visibleNodes = getVisibleNodes()
    local companionHidden = false
    for k,v in pairs(hiddenNodes) do
      if v.x == companion.nodeX and v.y == companion.nodeY then
        companionHidden = true
      end
      local sp = worldToScreenPos(v.x, v.y,mapX,mapY,tileSize)
      local shadowId = getShadowId(v, hiddenNodes)
      local shadowIndex = getShadowIndex(shadowId)
      love.graphics.draw(tilesetImage,tileQuads[shadowIndex],sp.x,sp.y)
      --love.graphics.print(shadowIndex, sp.x, sp.y)
      --love.graphics.print(tostring(companionHidden),10,90)
    end
    love.graphics.reset()
    local entityHitboxOffsetX = 10
    local entityHitboxOffsetY = 15
    local entityScale = 1.5
    love.graphics.draw(characterSetImage, characterQuads[playerQPos][player.direction], playerScreenPos.x - entityHitboxOffsetX, playerScreenPos.y - entityHitboxOffsetY, 0, entityScale, entityScale)
    if companionHidden == false then
      love.graphics.draw(characterSetImage, characterQuads[companionQPos][companion.direction], companionScreenPos.x - entityHitboxOffsetX, companionScreenPos.y - entityHitboxOffsetY, 0, entityScale, entityScale)
    end

    love.graphics.setColor(0,255,255)
    for i=1,contactc do
    local sp = worldToScreenPos(entities[i].x,entities[i].y,mapX,mapY,tileSize)
      love.graphics.circle("fill",sp.x,sp.y,5)
    end
   
    drawUI()
  else
    love.graphics.setColor(10,10,180)
    love.graphics.rectangle("fill", 10,10,780,580)
    
    love.graphics.setColor(10,100,80)
    love.graphics.rectangle("fill", 80,80,650,460)
    
    love.graphics.setColor(255,0,0)
    love.graphics.print("TITLE SCREEN",200,100,0,5)
    
    love.graphics.setColor(255,255,255)
    love.graphics.print("\" ... STAY TOGETHER. Never be alone. [...] Staying together means staying within sight and hearing of each other.\" ",30,30)
    love.graphics.print("~ The Missionary Handbook, page 30",50,50)
    
    love.graphics.setColor(255,200,200)
    love.graphics.print("",40,300)
    love.graphics.print("Talk to people by pressing spacebar. Try to fulfil your goal for daily contacts",50,50)
  end
end

function love.threaderror(thread,err)
	local f = love.filesystem.newFile("threaderr.txt")
	f:open("w")
	f:write(err .. "\r\n")
	f:close()
end