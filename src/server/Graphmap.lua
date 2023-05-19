local ReplicatedStorage = game:GetService("ReplicatedStorage")
local map={}
local Set = require(ReplicatedStorage:WaitForChild("Shared").Set)
map.__index=map

function map.new(rootName)
    local self = setmetatable({},map)
    self["GRAPH"] ={}
    self["EDGES"]={}
    table.insert(self["GRAPH"],rootName)
    self["EDGES"][rootName]={}
    return self
end

function map:add(from,to)

    
end


return map