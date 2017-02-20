--gameutils.lua

-- retrieves the nodes at (nodex, nodey) if any. Takes the list of nodes as a parameter
function getNodesAt(nodes,nodex,nodey)
	local nodesAt = {}
	local x = nodex
	local y = nodey
	
	for k,checkNode in pairs(nodes) do
		if x == checkNode.x and y == checkNode.y then
			table.insert(nodesAt,checkNode)
		end
	end
	
	return nodesAt
end

-- returns a list of neighboring valid nodes for pathfinding and sight purposes, 
--   takes the list of all nodes and the node you are interested in as parameters
function getNeighbors(nodes,node)
	if not node then
		return {}
	end
	local neighbors = {}
	local l = {}
	local r = {}
	local u = {}
	local d = {}
	
	local lu = {}
	local ru = {}
	local ld = {}
	local rd = {}
	
	l = getNodesAt(nodes,node.x - 1,node.y)
	r = getNodesAt(nodes,node.x + 1,node.y)
	u = getNodesAt(nodes,node.x,node.y - 1)
	d = getNodesAt(nodes,node.x,node.y + 1)
	
	for k,v in pairs(l) do
		if v.type == 1 then
			l = {}
		end
	end
	for k,v in pairs(r) do
		if v.type == 1 then
			r = {}
		end
	end
	for k,v in pairs(u) do
		if v.type == 1 then
			u = {}
		end
	end
	for k,v in pairs(d) do
		if v.type == 1 then
			d = {}
		end
	end
	
	mergeTables(neighbors,l)
	mergeTables(neighbors,r)
	mergeTables(neighbors,u)
	mergeTables(neighbors,d)
	
	if not(next(l) == nil) and not(next(u) == nil) then
		lu = getNodesAt(nodes,node.x - 1,node.y - 1)
	end
	
	if not(next(r) == nil) and not(next(u) == nil) then
		ru = getNodesAt(nodes,node.x + 1,node.y - 1)
	end
	
	if not(next(l) == nil) and not(next(d) == nil) then
		ld = getNodesAt(nodes,node.x - 1,node.y + 1)
	end
	
	if not(next(r) == nil) and not(next(d) == nil) then
		rd = getNodesAt(nodes,node.x + 1,node.y + 1)
	end
	
	for k,v in pairs(lu) do
		if v.type == 1 then
			lu = {}
		end
	end
	for k,v in pairs(ru) do
		if v.type == 1 then
			ru = {}
		end
	end
	for k,v in pairs(ld) do
		if v.type == 1 then
			ld = {}
		end
	end
	for k,v in pairs(rd) do
		if v.type == 1 then
			rd = {}
		end
	end
	
	mergeTables(neighbors,lu)
	mergeTables(neighbors,ru)
	mergeTables(neighbors,ld)
	mergeTables(neighbors,rd)
	
	return neighbors
end

function getShadowId(node, nodes)
	l = getNodesAt(nodes,node.x - 1,node.y)
	r = getNodesAt(nodes,node.x + 1,node.y)
	u = getNodesAt(nodes,node.x,node.y - 1)
	d = getNodesAt(nodes,node.x,node.y + 1)
	local shadowId = 0
	if next(l) then
		shadowId = shadowId + 8
	end
	if next(r) then
		shadowId = shadowId + 2
	end
	if next(u) then
		shadowId = shadowId + 1
	end
	if next(d) then
		shadowId = shadowId + 4
	end
	return shadowId
end

 -- puts all values in t2 into t1
function mergeTables(t1,t2)
	for k,v in pairs(t2) do 
		table.insert(t1,v)
	end
	return t1
end

function distance(n1,n2)
	dx = n1.x - n2.x
	dy = n1.y - n2.y
	return math.sqrt(dx*dx + dy*dy)
end

function getLowestValue(t)
	local lowestKey = nil
	for k,v in pairs(t) do
		if lowestKey == nil or v.p_cost + v.h_cost < t[lowestKey].p_cost + t[lowestKey].h_cost then
			lowestKey = k
		end
	end
	
	return lowestKey
end

function elementOf(node,set)
	for k,v in pairs(set) do
		if node == v then
			return true
		end
	end
	
	return false
end

function nodeToString(node)
	if node == nil then
		return "(nil)"
	end
	return "(" .. node.x .. "," .. node.y .. ")"
end