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
  love.graphics.setColor(255,255,255)
  love.graphics.draw(tilesetBatch,
    0,0, 0, zoomX, zoomY
  )
  love.graphics.setColor(0,0,0)
  love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
  love.graphics.print("MapX: "..mapX, 10, 30)
  love.graphics.print("MapY: "..mapY, 10, 40)
end