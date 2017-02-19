

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
	love.graphics.setColor(r, g, b)
	love.graphics.rectangle("fill",100,4,obedience_meter * 6,10,10,10)
  
  if getPlayer().iceCream or true then
    love.graphics.setColor(255,200,200)
    love.graphics.circle("fill",465,windowY - 16,8,8)
  end
  
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill",304,windowY - 26,140,20,10,10)
  love.graphics.setColor(240, 240, 240)
  love.graphics.print("Allowance: $" .. "20",318,windowY - 23) --getPlayer().cash
  
  
end

function updateUI()
	if obedience_meter < 2 then
		lose = true
		
	end

end