local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local GraphModule = require(script.Parent.Parent:WaitForChild("Graph"))
local Bob = workspace:WaitForChild("Bob")
local Bob_HumanoidRootPart = Bob:WaitForChild("HumanoidRootPart")

local Bob_Status = Bob:WaitForChild("Status")
local Has_Apple = Bob_Status.HasApple


local DISTANCE = 40--stunds

local Graph = GraphModule.new("Bob")


Graph:add("Bob","Selector","Selector")
--SQUENCE--
Graph:add("Selector","Standing","Sequence")
Graph:add("Selector","Walk","Sequence")
-----ACTION------
Graph:add("Standing","EatApple","Sequence")
Graph:add("Standing","WatchSonnic","Action")
Graph:add("EatApple","EatTheApple","Action")

Graph:adddecorator("Standing",function()
    for i , v in ipairs(Players:GetPlayers()) do
        local char = v.Character 
        if char then
            local humrp = char.HumanoidRootPart
            if(Bob_HumanoidRootPart.Position-humrp.Position).Magnitude <=DISTANCE then
                return false
            end
        end
    end
    return true
end)

Graph:adddecorator("EatApple",function()
    if Has_Apple.Value==1 then
        return true
     else
        return false
    end
end)

Graph:addaction("EatTheApple",function()
    print("BOb EATING APPLE STFU")
    
end)

game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
    Graph:Traversal()    
end)


