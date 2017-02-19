

function drawUI()
	
	local windowX, windowY = love.graphics.getDimensions()
	love.graphics.setColor(102, 102, 153)
	love.graphics.rectangle("fill",0,0,windowX,20,10,10)
	love.graphics.setColor(240, 240, 240)
	love.graphics.print("Obedi-ometer",3,3)
	local r = 255 - math.min(255,obedience_meter*255/50)
	local g = math.min(255,obedience_meter*255/50)
	local b = 0
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle("fill",100,4,100*6,10,10,10)
	love.graphics.setColor(r, g, b)
	love.graphics.rectangle("fill",100,4,obedience_meter * 6,10,10,10)
end

function updateUI()
	if obedience_meter < 5 then
		lose = true
		
	end

end