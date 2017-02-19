
--require("love.filesystem")
--require("love.timer")
--require("love.thread")
require("gameutils")


function thread_main()
	local sightPlayerNodeChannel = love.thread.getChannel("sightPlayerChan")
	local sightNodesChannel = love.thread.getChannel("sightNodesChan")
	local sightVisibleNodes = love.thread.getChannel("sightVisibleChan")
	local playerNode = sightPlayerNodeChannel:demand()
	local nodes = sightNodesChannel:demand()
	
	sightVisibleNodes:push(getVisibleNodes(playerNode,nodes))
end

function getVisibleNodes(playerNode, nodes)
	local visibleNodes = {}

	local totalRays = 100
	local dTheta = 360 / 150
	local rayNumber = 1
	
	--f = love.filesystem.newFile("sightlog.txt")
	--f:open("w")
	--f:write("start raycast \r\n")
	
	local neighbors = getNeighbors(nodes,playerNode)
	local c1 = (next(getNodesAt(nodes,playerNode.x - 1, playerNode.y)) and getNodesAt(nodes,playerNode.x - 1, playerNode.y)[1].type == 0) or 
				(next(getNodesAt(nodes,playerNode.x,playerNode.y + 1)) and getNodesAt(nodes,playerNode.x,playerNode.y + 1)[1].type == 0)
	local c2 = (next(getNodesAt(nodes,playerNode.x + 1, playerNode.y)) and getNodesAt(nodes,playerNode.x + 1, playerNode.y)[1].type == 0) or 
				(next(getNodesAt(nodes,playerNode.x,playerNode.y + 1)) and getNodesAt(nodes,playerNode.x,playerNode.y + 1)[1].type == 0)
	local c3 = (next(getNodesAt(nodes,playerNode.x - 1, playerNode.y)) and getNodesAt(nodes,playerNode.x - 1, playerNode.y)[1].type == 0) or 
				(next(getNodesAt(nodes,playerNode.x,playerNode.y - 1)) and getNodesAt(nodes,playerNode.x,playerNode.y - 1)[1].type == 0)
	local c4 = (next(getNodesAt(nodes,playerNode.x + 1, playerNode.y)) and getNodesAt(nodes,playerNode.x + 1, playerNode.y)[1].type == 0) or 
				(next(getNodesAt(nodes,playerNode.x,playerNode.y - 1)) and getNodesAt(nodes,playerNode.x,playerNode.y - 1)[1].type == 0)
	
	for i=1,4 do
		local cornerX = 0
		local cornerY = 0
		if i == 1 and c1 then
			cornerX = .2
			cornerY = .8
			--f:write("1\r\n")
		elseif i == 2 and c2 then
			cornerX = .8
			cornerY = .8
			--f:write("2\r\n")
		elseif i == 3 and c3 then
			cornerX = .2
			cornerY = .2
			--f:write("3\r\n")
		elseif i == 4 and c4 then
			cornerX = .8
			cornerY = .2
			--f:write("4\r\n")
		end
		local x0 = playerNode.x + cornerX
		local y0 = playerNode.y + cornerY
		--f:write("Ray starting at: (" .. x0 .. "," .. y0 .. ")\r\n")
		local sin = math.sin
		local cos = math.cos
		while rayNumber * dTheta < 360 do
			local theta = rayNumber * dTheta * math.pi / 180
			
			local dx = cos(theta)
			local dy = sin(theta)
			local dt = 1/16
			--f:write("Ray with theta: " .. theta * 180 / math.pi .. " degrees starting at (" .. x0 .. "," .. y0 .. ")\r\n")
			for t=0,30 do
				local x = x0 + t*dx
				local y = y0 + t*dy
				local vNodes = {}
				local node = {}
				vNodes = getNodesAt(nodes,math.floor(x),math.floor(y))
				if next(vNodes) then
					node = vNodes[1]
					if not elementOf(node,visibleNodes) then
						table.insert(visibleNodes,node)
					end
					if node.type == 0 then
						--f:write(nodeToString(node) .. " is visible " .. "\r\n")
					else	
						--f:write(nodeToString(node) .. " is vision blocker. stopping " .. "\r\n")
						break
					end
					
				end
				
				
			end
			
		
			rayNumber = rayNumber + 1
		end
		rayNumber = 1
	end
	
	return visibleNodes
	
end

thread_main()