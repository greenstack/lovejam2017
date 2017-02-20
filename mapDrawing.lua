-- Contains the functions needed for map making and drawing

local mapNodes -- stores tiledata
local mapWidth, mapHeight -- width and height in tiles

local tilesDisplayWidth, tilesDisplayHeight -- number of tiles to show

local tilesetImage
local tileQuads = {} -- parts of the tileset used for different tiles
local tilesetSprite
local tileSheetDim = 10

function setupMap(level)
  mapInfo = require("level"..level)
  mapWidth = mapInfo.width
  mapHeight = mapInfo.height
  
  mapNodes = {}
  blockingMap={}
  decorationMap={}
  for y=1, mapHeight do
    decorationMap[y] = {}
    blockingMap[y] = {}
    for x=1, mapWidth do
	  local n = {}
	  n.x = x
	  n.y = y
	  n.p_cost = 0
	  n.h_cost = 0
	  local tileCode = (y*mapHeight-mapWidth+x)
    local groundLayer = 1
	  local blockingLayer = 2
    local decorationLayer = 3
    n.tile = mapInfo.layers[groundLayer].data[tileCode]
	  if  mapInfo.layers[blockingLayer].data[tileCode] > 0 then
      blockingMap[y][x] = mapInfo.layers[blockingLayer].data[tileCode]
      n.type = 1
    else
      n.tile = mapInfo.layers[groundLayer].data[tileCode]
      n.type = 0
	  end
	  if mapInfo.layers[decorationLayer].data[tileCode] > 0 then
      decorationMap[y][x] = mapInfo.layers[decorationLayer].data[tileCode]
    end

	  table.insert(mapNodes,n)
    end
  end
end

function setupMapView()
  mapX = 1
  mapY = 1
  tilesDisplayWidth = 26
  tilesDisplayHeight = 21
  zoomX = 1
  zoomY = 1
end

function setupTileSet()
  tilesetImage = love.graphics.newImage("resources/images/tiles.png")
  tilesetImage:setFilter("nearest", "linear") -- this "linear filter" removes some artifacts if we were to scale the tiles
  tileSize = mapInfo.tilesize

  tileQuads = {}

  for x=1, tileSheetDim do
    for y=1, tileSheetDim do
      tileQuads[(x*tileSheetDim-10+y)] = love.graphics.newQuad((y-1)*tileSize, (x-1)*tileSize, tileSize, tileSize, tilesetImage:getWidth(), tilesetImage:getHeight())
    end
  end

  tilesetBatch = love.graphics.newSpriteBatch(tilesetImage, (tilesDisplayWidth + 1) * (tilesDisplayHeight + 1))
  blockingTilesetBatch = love.graphics.newSpriteBatch(tilesetImage, (tilesDisplayWidth + 1) * (tilesDisplayHeight + 1))
  decorationTilesetBatch = love.graphics.newSpriteBatch(tilesetImage, (tilesDisplayWidth + 1) * (tilesDisplayHeight + 1))
  updateTilesetBatch()
end

function moveMap()
  local player = getPlayer()
  local windowX,windowY = love.graphics.getDimensions()
  mapX = math.max(math.min(player.x - windowX / (2 * tileSize), mapWidth - tilesDisplayWidth + 2), 1)
  mapY = math.max(math.min(player.y - windowY / (2 * tileSize), mapHeight - tilesDisplayHeight + 4), 1)
  
  updateTilesetBatch()
end

function updateTilesetBatch()
  tilesetBatch:clear()
  
  for k,v in pairs(mapNodes) do
    local sp = worldToScreenPos(v.x,v.y,mapX,mapY,tileSize)
    if sp.x >= -1 * tileSize and sp.x < tilesDisplayWidth * tileSize and sp.y >= -1 * tileSize and sp.y < tilesDisplayHeight * tileSize then
      if tileQuads[v.tile] ~= nil then
        tilesetBatch:add(tileQuads[v.tile],sp.x,sp.y)
      end
  	end	
  end
  tilesetBatch:flush()

  blockingTilesetBatch:clear()
  for k,v in pairs(mapNodes) do
    local sp=worldToScreenPos(v.x,v.y,mapX,mapY,tileSize)
    if sp.x >= -1 * tileSize and sp.x < tilesDisplayWidth * tileSize and sp.y >= -1 * tileSize and sp.y < tilesDisplayHeight * tileSize then
      if tileQuads[blockingMap[v.y][v.x]] ~= nil then
        blockingTilesetBatch:add(tileQuads[blockingMap[v.y][v.x]],sp.x,sp.y)
      end
  	end
  end
  blockingTilesetBatch:flush()

  decorationTilesetBatch:clear()
  for k,v in pairs(mapNodes) do
    local sp=worldToScreenPos(v.x,v.y,mapX,mapY,tileSize)
    if sp.x >= -1 * tileSize and sp.x < tilesDisplayWidth * tileSize and sp.y >= -1 * tileSize and sp.y < tilesDisplayHeight * tileSize then
      if tileQuads[decorationMap[v.y][v.x]] ~= nil then
        decorationTilesetBatch:add(tileQuads[decorationMap[v.y][v.x]],sp.x,sp.y)
      end
  	end
  end
  decorationTilesetBatch:flush()
end

function worldToScreenPos(wx,wy,mx,my,scale)
	local sp = {}
	sp.x = (wx - mx) * scale
	sp.y = (wy - my) * scale
	return sp
end

function screenToWorldPos(sx,sy,mx,my,scale)
	local wp = {}
	wp.x = (sx / scale + mx)
	wp.y = (sy / scale + my)

	return sp
end

function getNodes()
	return mapNodes
end

