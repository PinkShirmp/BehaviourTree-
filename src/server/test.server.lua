local GraphMap = require(script.Parent:WaitForChild("Graph"))

local Graph = GraphMap.new("Main")

Graph:add("Main","Eat")
Graph:add("Eat","HasApple")
Graph:add("HasApple","HasAKnife")
Graph:add("Main","Fight")
Graph:add("Fight","Punch")


Graph:Displayer()

