
local Remote = game:GetService("ReplicatedStorage").RemoteEvents.CarnivalCompleteShootingGallery

local allObjects = {}
local function updateObjects()
    for _, obj in game:GetDescendants() do
        table.insert(allObjects, obj)
    end
end
updateObjects()

local function fire(obj)
    task.spawn(function()
        pcall(function()
            Remote:FireServer(obj)
        end)
    end)
end

game.DescendantAdded:Connect(function(obj)
    table.insert(allObjects, obj)
end)

game.DescendantRemoving:Connect(function(obj)
    for i, v in pairs(allObjects) do
        if v == obj then
            table.remove(allObjects, i)
        end
    end
end)

getgenv().UnliCandy = true

    while getgenv().UnliCandy do
        for i, obj in pairs(allObjects) do
            fire(obj)
            if not getgenv().UnliCandy then break end
            if not getgenv().Instant and i % 222 == 0 then
                game:GetService("RunService").Heartbeat:Wait()
            end
            if getgenv().Limit and game.Players.localPlayer:GetAttribute('Candy') and game.Players.localPlayer:GetAttribute('Candy') >= getgenv().Limit then
                getgenv().UnliCandy = false
                print("Reached candy limit of " .. getgenv().Limit .. ". Stopping.")
                break
            end
        end
        task.wait()
    end
