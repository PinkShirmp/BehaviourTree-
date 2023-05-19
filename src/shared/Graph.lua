local Graph = {}
Graph.__index=Graph

function Graph.new(GraphId,GraphMap)
    local self = setmetatable({},Graph)
    self[GraphId]={}
    
    return self
end

return Graph