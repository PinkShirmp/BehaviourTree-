local map={}
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