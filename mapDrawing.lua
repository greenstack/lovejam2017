-- Contains the functions needed for map making and drawing

local mapNodes -- stores tiledata
local mapWidth, mapHeight -- width and height in tiles

local tilesDisplayWidth, tilesDisplayHeight -- number of tiles to show
local zoomX, zoomY

local tilesetImage
local tileQuads = {} -- parts of the tileset used for different tiles
local tilesetSprite

function setupMap() 
  mapWidth = 60
  mapHeight = 40
  
  mapNodes = {}
  for x=1,mapWidth do
    for y=1, mapHeight do
	  local n = {}
	  n.x = x
	  n.y = y
	  n.type = 0
	  n.tile = love.math.random(0,1)
	  if x == 1 and y == 1 then
		n.tile = 2
	  end
	  if x == 1 and y == 40 then
		n.tile = 2
	  end
	  if x == 60 and y == 1 then
		n.tile = 2
	  end
	  if x == 60 and y == 40 then
		n.tile = 2
	  end
	  table.insert(mapNodes,n)
    end
  end
end

function setupMapView()
  mapX = 1
  mapY = 1
  tilesDisplayWidth = 26
  tilesDisplayHeight = 22

  zoomX = 1
  zoomY = 1
end

function setupTileSet()
  tilesetImage = love.graphics.newImage("resources/images/tilesheet.png")
  tilesetImage:setFilter("nearest", "linear") -- this "linear filter" removes some artifacts if we were to scale the tiles
  tileSize = 32

  tileQuads = {}

  --grass
  tileQuads[0] = love.graphics.newQuad(0 * tileSize, 20 * tileSize, tileSize, tileSize, tilesetImage:getWidth(), tilesetImage:getHeight())
  --kitchen floor tile
  tileQuads[1] = love.graphics.newQuad(2 * tileSize, 0 * tileSize, tileSize, tileSize, tilesetImage:getWidth(), tilesetImage:getHeight())
  -- parquet flooring
  tileQuads[2] = love.graphics.newQuad(4 * tileSize, 0 * tileSize, tileSize, tileSize, tilesetImage:getWidth(), tilesetImage:getHeight())
  -- middle of red carpet
  tileQuads[3] = love.graphics.newQuad(3 * tileSize, 9 * tileSize, tileSize, tileSize, tilesetImage:getWidth(), tilesetImage:getHeight())

  tilesetBatch = love.graphics.newSpriteBatch(tilesetImage, tilesDisplayWidth * tilesDisplayHeight)

  updateTilesetBatch()
end

function moveMap(dx, dy)
  oldMapX = mapX
  oldMapY = mapY
  mapX = math.max(math.min(mapX + dx, mapWidth - tilesDisplayWidth + 2), 1)
  mapY = math.max(math.min(mapY + dy, mapHeight - tilesDisplayHeight + 2), 1)
  
  updateTilesetBatch()
  
end

function updateTilesetBatch()
  tilesetBatch:clear()

  
  for k,v in pairs(mapNodes) do
	local sp = worldToScreenPos(v.x,v.y,mapX,mapY,tileSize)
	if sp.x >= -1 * tileSize and sp.x < tilesDisplayWidth * tileSize and sp.y >= -1 * tileSize and sp.y < tilesDisplayHeight * tileSize then
		tilesetBatch:add(tileQuads[v.tile],sp.x,sp.y)
	end
	
	--if v.x >= mapX and v.x - mapX <= tilesDisplayWidth + 1 and v.y >= mapY and v.y - mapY <= tilesDisplayHeight then
	--	tilesetBatch:add(tileQuads[v.tile],(v.x - mapX)*tileSize,(v.y - mapY)*tileSize)
	--end
  end
  
  tilesetBatch:flush()
end

function worldToScreenPos(wx,wy,mx,my,scale)
	local sp = {}
	sp.x = (wx - mx) * scale
	sp.y = (wy - my) * scale

	return sp
end
