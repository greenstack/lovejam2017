-- main.lua to test git

require("mapDrawing")
require("entityhandler")
require("spriteManager")
require("uimanager")
require("screenInit")

level = 0
playlist = {}
songTime = {}
levelTransitionTime = 1
transitionScreen = false

contact_goal = 0
contacts = 0
last_level = 1

nextLevel = false

function love.load()
  
  love.math.setRandomSeed(os.time())
  math.randomseed(os.time())
  
  --doLevelSetupStuff(level)
  love.audio.setVolume(0)
  playlist[1] = love.audio.newSource("resources/sound/Theme A.ogg")
  songTime[1] = 226
  playlist[2] = love.audio.newSource("resources/sound/Theme B.ogg")
  songTime[2] = 150
  playlist[3] = love.audio.newSource("resources/sound/Theme C.ogg")
  songTime[3] = 187
  playlist[4] = love.audio.newSource("resources/sound/Title Theme.ogg")
  songTime[4] = 37
  elapsedSongTime = 0
  songIndex = 4
    love.audio.stop()
    love.audio.play(playlist[songIndex]) 
  
  screens.initialize()
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
        level = 1
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
    if level > last_level then
      win = true
    else
      if levelTransitionTime <= 0 then
        transitionScreen = false
        nextLevel = false
        levelTransitionTime = 2
        doLevelSetupStuff(level)
      else
        levelTransitionTime = levelTransitionTime - dt
        transitionScreen = true
      end
    end
  end
end

function love.keypressed(key,scancode,isrepeat)
  player = getPlayer()
  if key == "space" then
    space = true
    if win then
      win = false
      level = 0
    end
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
  if level > 0  and not win then
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

    screens.drawDebugInfo()

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
    end
    
    love.graphics.reset()
    local entityHitboxOffsetX = 10
    local entityHitboxOffsetY = 15
    local entityScale = 1.5
    love.graphics.draw(characterSetImage, characterQuads[playerQPos][player.direction], playerScreenPos.x - entityHitboxOffsetX, playerScreenPos.y - entityHitboxOffsetY, 0, entityScale, entityScale)
    if companionHidden == false then
      love.graphics.draw(characterSetImage, characterQuads[companionQPos][companion.direction], companionScreenPos.x - entityHitboxOffsetX, companionScreenPos.y - entityHitboxOffsetY, 0, entityScale, entityScale)
    end
    
    for i=1,contactc do
      for k,v in pairs(hiddenNodes) do
        if v.x == math.floor(entities[i].x - .5) and v.y == math.floor(entities[i].y - .5) then
          entities[i].hidden = true
          break
        end
          entities[i].hidden = false
      end
      if not entities[i].hidden then
        local sp = worldToScreenPos(entities[i].x,entities[i].y,mapX,mapY,tileSize)
        love.graphics.draw(characterSetImage, characterQuads[entities[i].pid][1], sp.x - entityHitboxOffsetX, sp.y - entityHitboxOffsetY, 0, entityScale, entityScale)
      end
    end
    drawUI()
  elseif not win then
    screens.drawStartScreen()
  elseif win then
    screens.drawWinScreen()
  end
end

function love.threaderror(thread,err)
	--local f = love.filesystem.newFile("threaderr.txt")
	--f:open("w")
	--f:write(err .. "\r\n")
	--f:close()
end