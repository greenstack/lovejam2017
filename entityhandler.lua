require("gameutils")
require("spriteManager")
entities = {}
contactc = 0
local player = {}
local companion = {}

local levelEntityInfo

--[[ structure of entity, companion, and player tables
entity.x = 0
entity.y = 0
entity.sprite = {left.jpg,right.jpg,up.jpg,down.jpg}
entity.dir = 0
]]

hiddenNodes = {}
hiddenCount = 0

local newSightNeeded = true
local visibleNodes = {}

local sightPlayerNodeChannel = nil
local sightNodesChannel = nil
local sightVisibleNodes = nil
local sightThread = nil

local pathTargetChannel = nil
local pathFinalPathChannel = nil
local pathNodesChannel = nil
local pathThread = nil

local companionPath = {}

local interaction = {}

function initEntityHandler(level)

		levelEntityInfo = require("level" .. level .. "_pathing")
	
	
	player.x = levelEntityInfo.start[1] + .5
	player.y = levelEntityInfo.start[2] + .5
	player.speed = .2
	player.width = 16
	player.height = 16
	player.direction = dFront
	player.iceCream = false
	player.cash = 5
	
	contact_goal = levelEntityInfo.contactGoal

	local node = isOnNode(getNodes(),player)
	player.nodeX = node.x
	player.nodeY = node.y
	
	companion.x = levelEntityInfo.cstart[1] + .5
	companion.y = levelEntityInfo.cstart[2] + .5 
	companion.speed = .2	
	companion.timer = 0
	companion.direction = dFront
  
	entityc = 0
	
	sightPlayerNodeChannel = love.thread.getChannel("sightPlayerChan")
	sightNodesChannel = love.thread.getChannel("sightNodesChan")
	sightVisibleNodes = love.thread.getChannel("sightVisibleChan")
	sightThread = love.thread.newThread("sightthread.lua")
	
	pathTargetChannel = love.thread.getChannel("targetChan")
	pathFinalPathChannel = love.thread.getChannel("finalPathChan")
	pathNodesChannel = love.thread.getChannel("nodesChan")
	pathThread = love.thread.newThread("pathfindthread.lua")

	entities['shop'] = {
		x = levelEntityInfo.shop[1],
		y = levelEntityInfo.shop[2],
    interact = bubble,
    complete = shop,
    progress = 0,
    duration = 3,
    range = 1.5,
		pid = 1
	}
  
	node = isOnNode(getNodes(),companion)

  entities['companion'] = {
    x = companion.x,
    y = companion.y,
		nodeX = node.x,
		nodeY = node.y,
    interact = bubble,
    complete = feedCompanion,
    progress = 0,
    duration = 1,
    range = 1.5,
		pid = 2
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

function getInteraction()
  return interaction
end

function movePlayer(dx,dy)

	local node = isOnNode(getNodes(),player)

	local u = getNodesAt(getNodes(),node.x,node.y - 1)	
	local d = getNodesAt(getNodes(),node.x,node.y + 1)
	local l = getNodesAt(getNodes(),node.x - 1,node.y)
	local r = getNodesAt(getNodes(),node.x + 1,node.y)

  if not next(u) then
    u = {}
    local u1 = {}
    u1.x = node.x
    u1.y = node.y - 1
    u1.type = 1
    table.insert(u,u1)
  end
  if not next(d) then
    d = {}
    local d1 = {}
    d1.x = node.x
    d1.y = node.y + 1
    d1.type = 1
    table.insert(d,d1)
  end
  if not next(l) then
    l = {}
    local l1 = {}
    l1.x = node.x - 1
    l1.y = node.y
    l1.type = 1
    table.insert(l,l1)
  end
  if not next(r) then
    r = {}
    local r1 = {}
    r1.x = node.x + 1
    r1.y = node.y
    r1.type = 1
    table.insert(r,r1)
  end

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

function getPathNode(nodes,x,y)
	for k,v in pairs(nodes) do
		if v.n[1] == x and v.n[2] == y then
			return v
		end
	end
end

f = love.filesystem.newFile("distance.txt")
	f:open("w")

function updateEntities(dt, isSpacePressed)

  
  -- handle contact ai and spawning
  if contactc < 10 and math.random(0,math.max(0,100)) == 0 then 
    
    local enoden = math.random(1,levelEntityInfo.enodec)
    local contact = {
      x = levelEntityInfo.enodes[enoden][1] + .5,
      y = levelEntityInfo.enodes[enoden][2] + .5,
      interact = bubble,
      complete = contactPI,
      progress = 0,
      duration = 2,
      range = 1,
      pid = math.random(3,7),
	  curTarget = {},
	  cameFrom = getPathNode(levelEntityInfo.nodes,levelEntityInfo.enodes[enoden][1],levelEntityInfo.enodes[enoden][2]),
	  moveDelay = 0,
	  contacted = false,
	  justSpawned = true,
    hidden = false
    }
    contactc = contactc + 1
    table.insert(entities,contact)
  end
  
  local entitiesToRemove = {}
  for i=1,contactc do
	local e = entities[i]
	local targetNode = e.curTarget
	if not next(e.curTarget) then
		local rand = math.random(1,e.cameFrom.ct)
		local tempTarget = e.cameFrom.ts[rand]
		if e.cameFrom.ct > 1 then
			repeat
				rand = math.random(1,e.cameFrom.ct)
				tempTarget = e.cameFrom.ts[rand]
				--f:write("aquiring new target: " .. tempTarget[1] .. "," .. tempTarget[2] .. "\r\n")
				--f:write("comparing to from:   " .. e.cameFrom.n[1] .. "," .. e.cameFrom.n[2] .. "\r\n")
				e.curTarget = getPathNode(levelEntityInfo.nodes,tempTarget[1],tempTarget[2])
			until tempTarget[1] ~= e.cameFrom.n[1] or tempTarget[2] ~= e.cameFrom.n[2]
		else
			if not e.justSpawned then
				table.insert(entitiesToRemove,i)
				
				f:write("removing:   " .. i .. "\r\n")
			end
		end
			e.justSpawned = false
			e.curTarget = getPathNode(levelEntityInfo.nodes,tempTarget[1],tempTarget[2])
	
	end
	local tempNodeForDistanceCalc = {}
	tempNodeForDistanceCalc.x = e.curTarget.n[1] + .5
	tempNodeForDistanceCalc.y = e.curTarget.n[2] + .5
	
	f:write("target: " .. e.curTarget.n[1] .. "," .. e.curTarget.n[2] .. "\r\n")
	--f:write("distance: " .. distance(tempNodeForDistanceCalc,e) .. "\r\n")
	
	if distance(tempNodeForDistanceCalc,e) > .1 then
		-- run towards it
		if e.progress <= 0 then
			local dx = tempNodeForDistanceCalc.x - e.x
			local dy = tempNodeForDistanceCalc.y - e.y
			
			if dx > 0 then
				dx = math.min(tempNodeForDistanceCalc.x - e.x, .1 * tileSize *  dt)
			elseif dx < 0 then
				dx = -math.min(math.abs(tempNodeForDistanceCalc.x - e.x), .1 * tileSize * dt)
			end
			
			if dy > 0 then
				dy = math.min(tempNodeForDistanceCalc.y - e.y, .1 * tileSize *  dt)
			elseif dy < 0 then
				dy = -math.min(math.abs(tempNodeForDistanceCalc.y - e.y), .1 * tileSize * dt)
			end
			
			e.x = e.x + dx
			e.y = e.y + dy
		end
	else
		if e.moveDelay <= 0 then
			e.moveDelay = math.random(2,7 - level)
			e.cameFrom = e.curTarget
			e.curTarget = {}
		else
			e.moveDelay = e.moveDelay - dt
		end
	end
  end
  
  local fudge = 0
  for k,v in pairs(entitiesToRemove) do
	contactc = contactc - 1
	table.remove(entities,v + fudge)
	fudge = fudge + 1
  end
  
  
  

  -- check if companion is in line of sight
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
		companion.timer = math.random(3,5)
		local nPathfindTo = {}
		local nodes = getNodes()
		local eHiddenNodes = {}
		local eHiddenCount = 0;
		local eVisibleNodes = {}

		local eVisibleCount = 0;
		for k,v in pairs(hiddenNodes) do
			if distance(companion,v) < 14 + level * level then
				table.insert(eHiddenNodes,v)
				eHiddenCount = eHiddenCount + 1

			end
		end
		--if math.random(0,3) == 3 then
			if eHiddenCount > 0 then
				nPathfindTo = eHiddenNodes[math.random(1,eHiddenCount)]
			else
				for k,v in pairs(visibleNodes) do
					if distance(companion,v) < 14 + level * level then
						table.insert(eVisibleNodes, v)
						eVisibleCount = eVisibleCount + 1
					end
					nPathfindTo = eVisibleNodes[math.random(1,eVisibleCount)]
				end
		--	end
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
	
	if companionPath[companionPath.head] and entities['companion'].progress == 0 then
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
		
    -- then check if the node you're on is companionPath[companionPath.head]
		-- if so decrement companionPath.head
    
		if dis < .1 then
			companionPath.head = companionPath.head - 1
		end
		
		
	end
	
	--handle line-of-sight calculation results
	if sightVisibleNodes:getCount() > 0 then
		local nodes = getNodes()
		hiddenNodes = {}
		hiddenCount = 0
		visibleNodes = sightVisibleNodes:pop()
		for k,v in pairs(nodes) do
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
				table.insert(hiddenNodes,v)
			end
		end
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

  entities['companion'].x = companion.x
  entities['companion'].y = companion.y
	updateNonCompanionEntities(dt, isSpacePressed)
end

function updateNonCompanionEntities(dt, isSpacePressed)
	if isSpacePressed == true then
		for k,v in pairs(entities) do
			if(distance(v,player) < v.range) then
				v.interact(v,level,dt)
				break
			end
		end  
	else
    for k,v in pairs(entities) do
      v.progress = math.max(0,v.progress - 3 * dt)
	end  
  end
  
  if next(interaction) then
    if not space and not interaction.complete then
      interaction.progress = math.max(0,interaction.progress - 3 * dt)
    end
    interaction.delay = math.max(0,interaction.delay - dt)
    if interaction.delay <= 0 then
      interaction = {}
    end
  end
  
	local node = isOnNode(getNodes(),companion)
	if node.x ~= companion.nodeX or node.y ~= companion.nodeY then
		companion.nodeX = node.x
		companion.nodeY = node.y
	end

  -- handle contacts
  
  
  
end

function getVisibleNodes()
	return visibleNodes
end

function bubble(entity,level,dt)
  if not interaction.complete then
    entity.progress = entity.progress + dt
    if entity.progress >= entity.duration then
      interaction.success = entity.complete(level,entity)
      interaction.complete = true
    end
  
  interaction.entity = entity
  interaction.progress = entity.progress
  interaction.duration = entity.duration
  interaction.delay = 1
  end
end

function shop(level)
	local iceCreamCost = 3 + level * 2
  if iceCreamCost <= player.cash then
    player.iceCream = true
    player.cash = player.cash - iceCreamCost
    return true
  end
  return false
end

function feedCompanion(level)
  if player.iceCream then
    player.iceCream = false
    companion.timer = math.max(10, 20 - level)
    return true
  end
  companion.timer = 0
  return false
end

function contactPI(level,e)
	if e.contacted then
		return false
	else
		e.contacted = true
		e.duration = .5
		contacts = contacts + 1
		return true
	end
end