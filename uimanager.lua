require("spriteManager")

function drawUI()
	
	local windowX, windowY = love.graphics.getDimensions()
	love.graphics.setColor(102, 102, 153)
	love.graphics.rectangle("fill",0,0,windowX,20,10,10)
  love.graphics.rectangle("fill",0,windowY - 30,windowX,30,10,10)
  
	love.graphics.setColor(240, 240, 240)
	love.graphics.print("Obedi-ometer",3,3)
  
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill",14,windowY - 26,140,20,10,10)
  love.graphics.setColor(240, 240, 240)
  love.graphics.print("Contacts: " .. contacts,24,windowY - 23)
  
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill",160,windowY - 26,140,20,10,10)
  love.graphics.setColor(240, 240, 240)
  love.graphics.print("Today's Goal: " .. contact_goal,174,windowY - 23)
  
	local r = 255 - math.min(255,obedience_meter*255/50)
	local g = math.min(255,obedience_meter*255/50)
	local b = 0
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle("fill",100,4,100*6,10,10,10)
	love.graphics.setColor(r, g, b)
	love.graphics.rectangle("fill",100,4,obedience_meter * 6,10,10,10) 
  if getPlayer().iceCream then
    love.graphics.setColor(255,200,200)
    love.graphics.circle("fill",465,windowY - 16,8,8)
  end
  
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill",304,windowY - 26,140,20,10,10)
  love.graphics.setColor(240, 240, 240)
  love.graphics.print("Allowance: $" .. getPlayer().cash,318,windowY - 23) --getPlayer().cash
  
  if next(getInteraction()) then
    local interaction = getInteraction()
    local screenPos = worldToScreenPos(interaction.entity.x,interaction.entity.y,mapX,mapY,tileSize)
    local ix = screenPos.x
    local iy = screenPos.y
    
    local bubbleWidth = 128
    local bubbleHeight = 60
    local borderWidth = 3
    local pieRadius = 20
    local verticalBuffer = 30
    
    love.graphics.setColor(153, 204, 255)
    love.graphics.rectangle("fill",ix - borderWidth,iy - bubbleHeight - borderWidth - verticalBuffer,bubbleWidth + borderWidth,bubbleHeight + borderWidth,15,15)
    love.graphics.setColor(245,245,245)
    love.graphics.rectangle("fill",ix,iy - bubbleHeight - verticalBuffer,bubbleWidth - borderWidth,bubbleHeight - borderWidth,15,15)
    
    love.graphics.reset()
    love.graphics.draw(characterPortraitImage, portraitQuads[interaction.entity.pid], ix - borderWidth + portraitSize, iy - bubbleHeight - borderWidth - verticalBuffer)
    
    love.graphics.setColor(0,0,0)
    love.graphics.circle("fill",ix + bubbleWidth / 4, iy - bubbleHeight / 2 - verticalBuffer - 2,pieRadius + borderWidth)
    if interaction.complete then
      if interaction.success then
        love.graphics.setColor(103, 204, 105)
      else
        love.graphics.setColor(230, 46, 0)
      end
    else
      love.graphics.setColor(153, 204, 255)
    end
    love.graphics.arc("fill",ix + bubbleWidth / 4, iy - bubbleHeight / 2 - verticalBuffer - 2,pieRadius,0, (getInteraction().progress / getInteraction().duration ) * (2 * math.pi))
  
    
  end
end

function updateUI()
	if obedience_meter < 2 then
		lose = true
		
	end

end