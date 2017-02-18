-- main.lua to test git

require("mapDrawing")

function love.load()
  setupMap()
  setupMapView()
  setupTileSet()
  -- love.graphics.setFont(12)
end

function love.update(dt)
  if love.keyboard.isDown("up") then
    moveMap(0, -0.2 * tileSize * dt)
  end
  if love.keyboard.isDown("down") then
    moveMap(0, 0.2 * tileSize * dt)
  end
  if love.keyboard.isDown("left") then
    moveMap(-0.2 * tileSize * dt ,0)
  end
  if love.keyboard.isDown("right") then
    moveMap(0.2 * tileSize * dt, 0)
  end
end

function love.draw()
  love.graphics.draw(tilesetBatch,
    math.floor(-(mapX%1)*tileSize), math.floor(-(mapY%1)*tileSize)
  )
  love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
end