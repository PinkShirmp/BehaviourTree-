local LocalizationService = game:GetService("LocalizationService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NodeType = {
    ["Selector"]="Selector",
    ["Sequence"]="Sequence",
    ["Root"]="Root",
    ["Action"]="Action",
    ["Decorator"]="Decorator",

}
local map={}
local Set = require(ReplicatedStorage:WaitForChild("Shared").Set)
map.__index=map
--[[
7:09 PM the graph is done 
now the task should be make a behaviour tree
]]
function map.new(rootName)
    local self = setmetatable({},map)
    self["GRAPH"] =Set.new()
    self["GRAPH"]:insert(rootName)
    self["EDGES"]={}
    self["NODETYPE"] = {}
    self["NODETYPE"][rootName]=NodeType["Root"]
    self["ACTION"]={}
    self["DECORATOR"]={}
    self.RootName =rootName
    return self
end

function map:add(from,to,type)
    self["GRAPH"]:insert(to)
    if(self["EDGES"][tostring(to)]==nil) then
        self["EDGES"][tostring(to)]={}
    end
    if(self["EDGES"][tostring(from)]==nil) then
        self["EDGES"][tostring(from)]={}
    end
    if(NodeType[type]==nil or type==nil) then
        error("WRONG TYPE OF NODE: "..type)
        return
    end
    self["NODETYPE"][to]=type
    table.insert(self["EDGES"][tostring(from)],to)
end

function map:Displayer()
    print("FROM ROOT: "..self.RootName)
    for i , v in ipairs(self["GRAPH"]["value"]) do
        for idex , value in pairs(self["EDGES"][v]) do
            print(v,value)
        end
    end
    print("\n")
    for index , value in pairs(self["NODETYPE"]) do
        print(index,value)
    end
end

function map:adddecorator(node,func)
    self["DECORATOR"][node]=func
end

function  map:dfs(node,visited,lastSeq,lastSequenceNode)
    if visited[node] or self.StopRecursion==true then
        return
    end
    visited[node]=true
    if(self["NODETYPE"][node]==NodeType.Sequence) then
        lastSequenceNode=node
    end

    if(self["NODETYPE"][node]==NodeType.Action) then
        if(self["ACTION"][node]~=nil) then
            self["ACTION"][node]()
        end
    end


    print("visited: "..node)
    if(self["NODETYPE"][node]==NodeType.Sequence) then

        if(self["DECORATOR"][node]~=nil) then
            if(self["DECORATOR"][node]()==false) then
                print(node.."FALSE")
                return
            end
        end
        for i ,v  in ipairs(self.EDGES[node]) do
            self:dfs(v,visited,lastSeq,lastSequenceNode)
        end
        if node==lastSequenceNode then
            self.StopRecursion=true
        end
    else
        for i, v in ipairs(self.EDGES[node]) do
            self:dfs(v, visited, lastSeq, lastSequenceNode)
        end
    end
    if node == self.RootName and lastSequenceNode ~= nil then
        table.insert(lastSeq, lastSequenceNode)
    end
end


function map:addaction(node,func)
    self["ACTION"][node]=func
end
function map:Traversal()
    --from root travel to nearest selector/squence
    --print(self["EDGES"])
    local visited = {}
    self.StopRecursion=false
    self:dfs(self.RootName,visited,{})
end

return map