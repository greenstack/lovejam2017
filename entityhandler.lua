require("gameutils")
require("spriteManager")
local entities = {}
local player = {}
local companion = {}

--[[ structure of entity, companion, and player tables
entity.x = 0
entity.y = 0
entity.sprite = {left.jpg,right.jpg,up.jpg,down.jpg}
entity.dir = 0
]]

local newSightNeeded = true
local visibleNodes = {}

local sightPlayerNodeChannel
local sightNodesChannel
local sightVisibleNodes
local sightThread

local pathTargetChannel
local pathFinalPathChannel
local pathNodesChannel
local pathThread

local companionPath = {}

function initEntityHandler(initialPlayerPos, level)
	player.x = initialPlayerPos.x + .5
	player.y = initialPlayerPos.y + .5
	player.speed = .2
	player.width = 16
	player.height = 16
	player.direction = dFront
	player.iceCream = false
	player.cash = 25

	local node = isOnNode(getNodes(),player)
	player.nodeX = node.x
	player.nodeY = node.y
	
	companion.x = initialPlayerPos.x + .5 - 1
	companion.y = initialPlayerPos.y + .5
	companion.speed = .2	
	companion.timer = 0
	companion.direction = dFront
	
	sightPlayerNodeChannel = love.thread.getChannel("sightPlayerChan")
	sightNodesChannel = love.thread.getChannel("sightNodesChan")
	sightVisibleNodes = love.thread.getChannel("sightVisibleChan")
	sightThread = love.thread.newThread("sightthread.lua")
	
	pathTargetChannel = love.thread.getChannel("targetChan")
	pathFinalPathChannel = love.thread.getChannel("finalPathChan")
	pathNodesChannel = love.thread.getChannel("nodesChan")
	pathThread = love.thread.newThread("pathfindthread.lua")

	entities['shop'] = {
		x = 5,
		y = 15
	}

end

function isOnNode(nodes,entity)
	local node = {}
	for k,v in pairs(nodes) do
		if v.x == math.floor(entity.x) and v.y == math.floor(entity.y) then
			node = v
			return node
		end
	end
	
	return node
end

function getEntities()
	return entities
end

function getPlayer()
	return player
end

function getCompanion()
	return companion
end

function movePlayer(dx,dy)

	local node = isOnNode(getNodes(),player)
	--local neighbors = getNeighbors(getNodes(), node)
	local u = getNodesAt(getNodes(),node.x,node.y - 1)	
	local d = getNodesAt(getNodes(),node.x,node.y + 1)
	local l = getNodesAt(getNodes(),node.x - 1,node.y)
	local r = getNodesAt(getNodes(),node.x + 1,node.y)
	
	if dy < 0 and next(u) and u[1].type == 1 then
		dy = -math.min(math.abs(dy),math.abs(player.y - (player.height / 2 / tileSize) - u[1].y - 1))
	end
	if dy > 0 and next(d) and d[1].type == 1 then
		dy = math.min(dy,d[1].y - player.y - (player.height / 2 / tileSize))
	end
	if dx < 0 and next(l) and l[1].type == 1 then
		dx = -math.min(math.abs(dx),math.abs(player.x - (player.width / 2 / tileSize) - l[1].x - 1))
	end
	if dx > 0 and next(r) and r[1].type == 1 then
		dx = math.min(dx,r[1].x - player.x - (player.width / 2 / tileSize))
	end
	

	player.x = player.x + dx
	player.y = player.y + dy
	
	local node = isOnNode(getNodes(),player)
	if node.x ~= player.nodeX or node.y ~= player.nodeY then
		player.nodeX = node.x
		player.nodeY = node.y
		newSightNeeded = true
	end
end

function updateEntities(dt, isSpacePressed)

	local los = false
	local cNode = isOnNode(getNodes(),companion)
	for k,v in pairs(visibleNodes) do
		if cNode.x == v.x and cNode.y == v.y then
			los = true
			break
		else
			los = false
		end
	end
	if los then
		obedience_meter = math.min(100,obedience_meter + 1 * dt)
	else
		obedience_meter = math.max(0,obedience_meter - 10 * dt)
	end
	
	--also handle companion AI
	companion.timer = companion.timer - dt
	if companion.timer <= 0 then -- find new place to wander
		companion.timer = math.random(4,8)
		local nPathfindTo = {}
		local eHiddenNodes = {}
		local eHiddenCount = 0
		local eVisibleNodes = {}
		local eVisibleCount = 0
		local nodes = getNodes()
		for k,v in pairs(nodes) do
			if distance(v,player) < 14 then
				local hidden = false
				for k2,v2 in pairs(visibleNodes) do
					if v.x == v2.x and v.y == v2.y then
						hidden = false
						break
					else
						hidden = true
					end
				end
				if hidden then
					table.insert(eHiddenNodes,v)
					eHiddenCount = eHiddenCount + 1
				else
					table.insert(eVisibleNodes,v)
					eVisibleCount = eVisibleCount + 1
				end
			end
		end
		
		if eHiddenCount > 0 or math.random(0,3) == 3 then
			nPathfindTo = eHiddenNodes[math.random(1,eHiddenCount)]
		elseif eVisibleCount > 0 then
			nPathfindTo = eVisibleNodes[math.random(1,eVisibleCount)]
		end
		
		local f = love.filesystem.newFile("ncount.txt")
		f:open("w")
		f:write(eHiddenCount .. "," .. eVisibleCount .. "," .. "\r\n")
		f:close()
		
			
		if nPathfindTo then -- companion has found a new place he wants to be...
			pathTargetChannel:clear()
			pathNodesChannel:clear()
			pathThread:start()
			local target = {}
			target[1] = isOnNode(getNodes(),companion)
			target[2] = nPathfindTo
			pathTargetChannel:push(target)
			pathNodesChannel:push(nodes)
			newPathNeeded = false
		end
			
	end
	
	if pathFinalPathChannel:getCount() > 0 then
		companionPath = pathFinalPathChannel:pop()
		
		local f = love.filesystem.newFile("path.txt")
		f:open("w")
		if companionPath.head then
			for i = companionPath.head,1,-1 do
				f:write(nodeToString(companionPath[i]) .. "\r\n")
			end
		else
			f:write("nil path")
		end
		
		f:close()
	end
	
	if companionPath[companionPath.head] then
		--move towards companionPath[companionPath.head]
		local tNode = companionPath[companionPath.head]
		local dx = tNode.x - (companion.x - .5)
		local dy = tNode.y - (companion.y - .5)
		
		--local f = love.filesystem.newFile("dxdy.txt")
		--f:open("w")
		--f:write("dx: " .. dx .. "  dy: " .. dy .. "\r\n" .. nodeToString(tNode) .. "," .. nodeToString(companion))
		--f:close()
		
		if dx > 0 then
			dx = math.min(tNode.x - (companion.x - .5), .1 * tileSize *  dt)
		elseif dx < 0 then
			dx = -math.min(math.abs(tNode.x - (companion.x - .5)), .1 * tileSize * dt)
		end
		
		if dy > 0 then
			dy = math.min(tNode.y - (companion.y - .5), .1 * tileSize *  dt)
		elseif dy < 0 then
			dy = -math.min(math.abs(tNode.y - (companion.y - .5)), .1 * tileSize * dt)
		end
		companion.direction = getEntityNewDirection(dx, dy)
		companion.x = companion.x + dx
		companion.y = companion.y + dy
		companionGridPos = {}
		companionGridPos.x = companion.x - .5
		companionGridPos.y = companion.y - .5
		
		local dis = distance(companionGridPos,tNode)
		
		if dis < .1 then
			companionPath.head = companionPath.head - 1
		end
		--then check if the node you're on is companionPath[companionPath.head]
		-- if so decrement companionPath.head
		
	end
	
	--handle line-of-sight calculation results
	if sightVisibleNodes:getCount() > 0 then
		visibleNodes = sightVisibleNodes:pop()
		sightVisibleNodes:clear()
	end
	
	--spin up a new thread for sight calculations if needed
	if newSightNeeded then
		newSightNeeded = false
		sightPlayerNodeChannel:clear()
		sightNodesChannel:clear()
		sightThread:start()
		local playerNode = {}
		playerNode.x = player.nodeX
		playerNode.y = player.nodeY
		sightPlayerNodeChannel:push(playerNode)
		sightNodesChannel:push(getNodes())
	end

	updateNonCompanionEntities(dt, isSpacePressed)
end

function updateNonCompanionEntities(dt, isSpacePressed)
	if isSpacePressed == true then
		for k,v in pairs(entities) do
			if k == "shop" then
				shop(level)
			end
		end
	end
end

function getVisibleNodes()
	return visibleNodes
end

function shop(level)
	local iceCreamCost = 3 + level * 2
	player.iceCream = true
	player.cash = player.cash - iceCreamCost
end