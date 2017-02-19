require("gameutils")

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

function initEntityHandler(initialPlayerPos)
	player.x = initialPlayerPos.x + .5
	player.y = initialPlayerPos.y + .5
	player.speed = .2
	player.width = 16
	player.height = 16
	
	local node = isOnNode(getNodes(),player)
	player.nodeX = node.x
	player.nodeY = node.y
	
	companion.x = initialPlayerPos.x + .5 - 1
	companion.y = initialPlayerPos.y + .5
	companion.speed = .2	
	companion.timer = 0
	
	sightPlayerNodeChannel = love.thread.getChannel("sightPlayerChan")
	sightNodesChannel = love.thread.getChannel("sightNodesChan")
	sightVisibleNodes = love.thread.getChannel("sightVisibleChan")
	sightThread = love.thread.newThread("sightthread.lua")
	
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
	local neighbors = getNeighbors(getNodes(), node)
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
	
	

	if dx < 0 then --walking left
		
	elseif dx > 0 then --walking right
	
	end
	
	if dy < 0 then --walking up
	
	elseif dy > 0 then --walking down
	
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

function updateEntities(dt)
	--for k,v in pairs(entities) do
		-- do stuff in here
	--end
	
	
	--also handle companion AI
	companion.timer = companion.timer - dt
	if companion.timer <= 0 then -- find new place to wander
		companion.timer = math.random(3,7)
		local nPathfindTo = {}
		local eHiddenNodes = {}
		local eHiddenCount = 0
		local eVisibleNodes = {}
		local eVisibleCount
		local nodes = getNodes()
		for k,v in pairs(nodes) do
			if distance(v,player) < 10 then
				if not elementOf(visibleNodes, v) then
					table.insert(eHiddenNodes,v)
					eHiddenCount = eHiddenCount + 1
				else
					table.insert(eVisibleNodes,v)
					eVisibleCount = eVisibleCount + 1
				end
			end
		end
		
		if eHiddenCount > 0 then
			nPathfindTo = eHiddenNodes[math.random(1,eHiddenCount)]
		elseif eVisibleCount > 0 then
			nPathfindTo = eVisibleNodes[math.random(1,eVisibleCount)]
		end
		
			local f = love.filesystem.newFile("companion.txt")
			f:open("w")
			f:write(nodeToString(nPathfindTo) .. "\r\n")
			f:close()
			
		if next(nPathfindTo) then -- companion has found a new place he wants to be...
			
		end
			
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
end

function getVisibleNodes()
	return visibleNodes
end