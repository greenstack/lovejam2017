
require("love.filesystem")
require("love.timer")
require("love.thread")
require("gameutils")

local nodes = {}

function thread_main()
	local pathTargetChannel = love.thread.getChannel("targetChan")
	local pathNodesChannel = love.thread.getChannel("nodesChan")
	local pathFinalPathChannel = love.thread.getChannel("finalPathChan")
	local target = pathTargetChannel:demand()
	nodes = pathNodesChannel:demand()
	
	pathFinalPathChannel:push(pathfindTo(target[1],target[2]))
end

function pathfindTo(startNode,endNode)
	local startTime = love.timer.getTime()
	
	--f = love.filesystem.newFile("pathlog.txt")
	--f:open("w")
	--f:write("Path from " .. nodeToString(startNode) .. " to " .. nodeToString(endNode) .. "\r\n")
	
	startNode.p_cost = 0
	startNode.h_cost = distance(startNode,endNode)
	startNode.parent = nil
	queue = {startNode}
	checked = {}
	
	while queue and next(queue) do
		local keyOfNextNode = getLowestValue(queue)
		local cNode = queue[keyOfNextNode]
		table.remove(queue,keyOfNextNode)
		table.insert(checked,cNode)
		--f:write("checking " .. nodeToString(cNode) .. "\r\n")
		if distance(cNode,endNode) == 0 then -- found the end
			--build return trail
			local path = {}
			local step = cNode
			--f:write("final step was " .. nodeToString(step.parent) .. nodeToString(step) .. "\r\n")
			local count = 0
			while step.parent do
				--f:write("adding to final path  - " .. count .. ":" .. nodeToString(step) .. "\r\n")
				count = count + 1
				path[count] = step
				--table.insert(path,step)
				step = step.parent
			end
			path.head = count
			local endTime = love.timer.getTime()
			local totalTime = endTime - startTime
			--f:write("took " .. totalTime .. "seconds" .. "\r\n")
			--f:write("debug info: " .. nodeToString(path[1]).. "\r\n")
			--f:close()
			return path
		end
		for k,v in pairs(getNeighbors(nodes,cNode)) do
			if not elementOf(v,checked) then
				--f:write("  exploring neighbor " .. nodeToString(v) .. "\r\n")
				
				if cNode.p_cost + 1.4 < v.p_cost or not elementOf(v,queue) then
					if distance(v,cNode) > 1 then
						v.p_cost = cNode.p_cost + 1.4
					else 
						v.p_cost = cNode.p_cost + 1
					end
					v.parent = cNode
				end
				
				
				
				if not elementOf(v,queue) then
					table.insert(queue,v)
				end
				
			else
				--f:write("  " .. nodeToString(v) .. "already checked\r\n")
			end
		end
		
	end
	
	local endTime = love.timer.getTime()
	local totalTime = endTime - startTime
	--f:write("took " .. totalTime .. "seconds" .. "\r\n")
	--f:write("found no path")
	--f:close()
	return {}
end


thread_main()