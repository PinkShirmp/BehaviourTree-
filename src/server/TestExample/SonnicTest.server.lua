local GraphModule = require(script.Parent.Parent:WaitForChild("Graph"))

local Graph = GraphModule.new("Sonnic")

local sonnicPart = workspace:WaitForChild("Part")


--[[TODO:

desgin sonnic behaviour tree

->if player is near the brick of the sonnic turns red
->if no one is near turn blue
]]


Graph:add("Sonnic","Selector","Selector")

--"NO ONE IS NEAR"--
Graph:add("Selector","Nooneisnear","Sequence")
Graph:add("Nooneisnear","Turnblue","Action")

--"if player is near"--
Graph:add("Selector","playerisnear","Sequence")
Graph:add("playerisnear","Turnred","Action")


--CMD--
--Graph:Displayer()


function  checknooneisnear()
    if(#game.Players:GetPlayers()==0) then
        return true
    end
    return false
end

Graph:adddecorator("Nooneisnear",checknooneisnear)
Graph:addaction("Turnblue",function()
    sonnicPart.BrickColor = BrickColor.new("Tr. Blue")
end)



Graph:addaction("Turnred",function()
     sonnicPart.BrickColor = BrickColor.new("Tr. Red")
end)



--[[game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
    task.wait()
    Graph:Traversal()
end)]]

