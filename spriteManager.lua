
local characterSizeX = 12
local characterSizeY = 16
playerQPos = 1
companionQPos = 2
dFront = 0
dLeft = 1
dRight = 3
dBack = 2


local stills = 4
local charCount = 7
function setupCharacterSprites()
  characterSetImage = love.graphics.newImage("resources/images/characters.png")

  characterSetImage:setFilter("nearest","linear")
  characterQuads = {}
  for i=1, charCount do
    characterQuads[i] = {}
    for j=0, stills - 1 do
      characterQuads[i][j] = love.graphics.newQuad(j*12, (i-1)*characterSizeY+1, characterSizeX, characterSizeY, characterSetImage:getWidth(), characterSetImage:getHeight())
    end
  end

  portraitQuads = {}
  characterPortraitImage = love.graphics.newImage("resources/images/portrates.png")
  characterPortraitImage:setFilter("nearest","linear")
  local cols = 7
  local rows = 2 -- Update this as (if?) I add more portraits
  local portraitCount = 8 -- Update this as I add more portraits
  local currentPortrait = 1
  portraitSize = 64
  for j=1, rows do
    for i=1, cols do
      portraitQuads[currentPortrait] = love.graphics.newQuad((i-1)*portraitSize, (j-1)*portraitSize, portraitSize,portraitSize, characterPortraitImage:getWidth(), characterPortraitImage:getHeight())
      currentPortrait = currentPortrait + 1
    end
  end
end

function getEntityNewDirection(dx, dy)
  if (0 < dx) then
    newDirection = dRight
    return dRight
  elseif (dx < 0) then
    newDirection = dLeft
    return dLeft
  elseif (0 > dy) then
    newDirection = dBack
    return dBack
  elseif (0 < dy) then
    newDirection = dFront
    return dFront
  end
  return newDirection
end

function getEntityPortrait(entityId)

end