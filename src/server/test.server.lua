local GraphMap = require(script.Parent:WaitForChild("Graphmap"))

local Graph = GraphMap.new("Main")

Graph:add("Main","Eat")
Graph:add("Eat","HasApple")
Graph:add("HasApple","HasAKnife")

print(Graph)
