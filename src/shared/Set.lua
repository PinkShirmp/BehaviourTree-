local set = {}
set.__index=set
function set.new()
    local self = setmetatable({},set)
    self["value"]={}
    self["EXIST"]={}
    return self
end
function set:insert(value)
    if self["EXIST"][tostring(value)]==nil then
        table.insert(self["value"],value)
        self["EXIST"][tostring(value)]=1
    end
end


return set