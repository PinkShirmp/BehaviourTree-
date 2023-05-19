local ReplicatedStorage = game:GetService("ReplicatedStorage")
local map={}
local Set = require(ReplicatedStorage:WaitForChild("Shared").Set)
map.__index=map

function map.new(rootName)
    local self = setmetatable({},map)
    self["GRAPH"] =Set.new()
    self["GRAPH"]:insert(rootName)
    self["EDGES"]={}
    self.RootName =rootName
    return self
end

function map:add(from,to)
    self["GRAPH"]:insert(to)
    if(self["EDGES"][tostring(to)]==nil) then
        self["EDGES"][tostring(to)]={}
    end
    if(self["EDGES"][tostring(from)]==nil) then
        self["EDGES"][tostring(from)]={}
    end
    table.insert(self["EDGES"][tostring(from)],to)
end


function map:Displayer()
    print("FROM ROOT: "..self.RootName)
    for i , v in ipairs(self["GRAPH"]["value"]) do
        for idex , value in pairs(self["EDGES"][v]) do
            print(v,value)
        end
    end
end

return map