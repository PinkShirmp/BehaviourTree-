local GraphMap = require(script.Parent:WaitForChild("Graph"))

local Graph = GraphMap.new("Main")

Graph:add("Main", "SEL1", "Selector")

Graph:add("SEL1", "SEQ", "Sequence")
Graph:add("SEQ", "AC1", "Action")
Graph:add("SEQ", "AC2", "Action")
Graph:add("SEQ", "AC3", "Action")


Graph:add("SEL1","SEQ2","Sequence")
Graph:add("SEQ2","AC01","Action")



function  check()
    return false;
end

Graph:adddecorator("SEQ",check)

Graph:Displayer()
Graph:Traversal()
