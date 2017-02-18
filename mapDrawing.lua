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
    for y=1, mapWidth do
	  local n = {}
	  n.x = x
	  n.y = y
	  n.type = 0
	  n.tile = love.math.random(0,1)	
	
	  table.insert(mapNodes,n)
      --mapNodes[x][y] = love.math.random(0,3)
    end
  end
end

function setupMapView()
  mapX = 1
  mapY = 1
  tilesDisplayWidth = 26
  tilesDisplayHeight = 20

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
  mapX = math.max(math.min(mapX + dx, mapWidth - tilesDisplayWidth), 1)
  mapY = math.max(math.min(mapY + dy, mapHeight - tilesDisplayHeight), 1)
  --only update if we actually moved
  if math.floor(mapX) ~= math.floor(oldMapX) or math.floor(mapY) ~= math.floor(oldMapY) then
    updateTilesetBatch()
  end
end

function updateTilesetBatch()
  tilesetBatch:clear()
  --for x=0, tilesDisplayWidth-1 do
  --  for y=0, tilesDisplayHeight-1 do
  --    tilesetBatch:add(tileQuads[map[x+math.floor(mapX)][y+math.floor(mapY)]], x*tileSize, y*tileSize)
  --  end
  --end
  
  for k,v in pairs(mapNodes) do
	if v.x < tilesDisplayWidth - 1 and v.y < tilesDisplayHeight - 1 then
		tilesetBatch:add(tileQuads[v.tile],v.x*tileSize,v.y*tileSize)
	end
	
  end
  
  tilesetBatch:flush()
end
