
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
      characterQuads[i][j] = love.graphics.newQuad(j*12, (i-1)*characterSizeY, characterSizeX, characterSizeY, characterSetImage:getWidth(), characterSetImage:getHeight())
    end
  end
  playerQuadFront = characterQuads[1][1]
end
