
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
	
	local node = isOnNode(getNodes(),player)
	player.nodeX = node.x
	player.nodeY = node.y
	
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

function getCompainion()
	return companion
end

function movePlayer(dx,dy)
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
	
	
	if sightVisibleNodes:getCount() > 0 then
		visibleNodes = sightVisibleNodes:pop()
		sightVisibleNodes:clear()
	end
	
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