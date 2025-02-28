local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success or not Rayfield then
    warn("Failed to load Rayfield UI Library!")
    return
end

-- Create the main window
local Window = Rayfield:CreateWindow({
   Name = "IRAQ Hub | Dead Rails",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Wait | انتظر",
   LoadingSubtitle = "by Sajad",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Sajad Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "IRAQ",
      Subtitle = "IRAQ Hub",
      Note = "Key is : Iraq", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

print("Window created successfully!")

-- Aimbot Script
local RunService = game:GetService("RunService")
local Cam = workspace.CurrentCamera
local Player = game:GetService("Players").LocalPlayer

local validNPCs = {}
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local function isNPC(obj)
    return obj:IsA("Model") 
        and obj:FindFirstChild("Humanoid")
        and obj.Humanoid.Health > 0
        and obj:FindFirstChild("Head")
        and obj:FindFirstChild("HumanoidRootPart")
        and not game:GetService("Players"):GetPlayerFromCharacter(obj)
end

local function updateNPCs()
    local tempTable = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if isNPC(obj) then
            tempTable[obj] = true
        end
    end
    for i = #validNPCs, 1, -1 do
        if not tempTable[validNPCs[i]] then
            table.remove(validNPCs, i)
        end
    end
    for obj in pairs(tempTable) do
        if not table.find(validNPCs, obj) then
            table.insert(validNPCs, obj)
        end
    end
end

local function handleDescendant(descendant)
    if isNPC(descendant) then
        table.insert(validNPCs, descendant)
        local humanoid = descendant:WaitForChild("Humanoid")
        humanoid.Destroying:Connect(function()
            for i = #validNPCs, 1, -1 do
                if validNPCs[i] == descendant then
                    table.remove(validNPCs, i)
                    break
                end
            end
        end)
    end
end

workspace.DescendantAdded:Connect(handleDescendant)

local function predictPos(target)
    local rootPart = target:FindFirstChild("HumanoidRootPart")
    local head = target:FindFirstChild("Head")
    if not rootPart or not head then
        return head and head.Position or rootPart and rootPart.Position
    end
    local velocity = rootPart.Velocity
    local predictionTime = 0.02
    local basePosition = rootPart.Position + velocity * predictionTime
    local headOffset = head.Position - rootPart.Position
    return basePosition + headOffset
end

local function getTarget()
    local nearest = nil
    local minDistance = math.huge
    local viewportCenter = Cam.ViewportSize / 2
    raycastParams.FilterDescendantsInstances = {Player.Character}
    for _, npc in ipairs(validNPCs) do
        local predictedPos = predictPos(npc)
        local screenPos, visible = Cam:WorldToViewportPoint(predictedPos)
        if visible and screenPos.Z > 0 then
            local ray = workspace:Raycast(
                Cam.CFrame.Position,
                (predictedPos - Cam.CFrame.Position).Unit * 1000,
                raycastParams
            )
            if ray and ray.Instance:IsDescendantOf(npc) then
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - viewportCenter).Magnitude
                if distance < minDistance then
                    minDistance = distance
                    nearest = npc
                end
            end
        end
    end
    return nearest
end

local function aim(targetPosition)
    local currentCF = Cam.CFrame
    local targetDirection = (targetPosition - currentCF.Position).Unit
    local smoothFactor = 0.581
    local newLookVector = currentCF.LookVector:Lerp(targetDirection, smoothFactor)
    Cam.CFrame = CFrame.new(currentCF.Position, currentCF.Position + newLookVector)
end

local heartbeat = RunService.Heartbeat
local lastUpdate = 0
local UPDATE_INTERVAL = 0.4

local aimbotEnabled = false

heartbeat:Connect(function(dt)
    lastUpdate = lastUpdate + dt
    if lastUpdate >= UPDATE_INTERVAL then
        updateNPCs()
        lastUpdate = 0
    end
    if aimbotEnabled then
        local target = getTarget()
        if target then
            local predictedPosition = predictPos(target)
            aim(predictedPosition)
        end
    end
end)

-- npc remove
workspace.DescendantRemoving:Connect(function(descendant)
    if isNPC(descendant) then
        for i = #validNPCs, 1, -1 do
            if validNPCs[i] == descendant then
                table.remove(validNPCs, i)
                break
            end
        end
    end
end)

-- Create Aimbot Tab
local AimbotTab = Window:CreateTab("Aimbot", 4483362458) -- Replace with your desired icon ID

-- Aimbot Toggle
local aimbotToggle = AimbotTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        aimbotEnabled = Value
    end
})

-- Existing Tabs and Functionality
local Tab = Window:CreateTab("Brings", 4483362458) 

local function GetItemNames()
    local items = {}
    local runtimeItems = workspace:FindFirstChild("RuntimeItems")
    if runtimeItems then
        for _, item in ipairs(runtimeItems:GetDescendants()) do
            if item:IsA("Model") then
                table.insert(items, item.Name)
            end
        end
    else
        warn("RuntimeItems folder not found!")
    end
    return items
end

local Dropdown = Tab:CreateDropdown({
   Name = "Choose item",
   Options = GetItemNames(), 
   CurrentOption = "Select an item",
   MultipleOptions = false,
   Flag = "ItemDropdown", 
   Callback = function(selectedItem)
       if type(selectedItem) == "table" then
           selectedItem = selectedItem[1] 
       end
   end,
})

local RefreshButton = Tab:CreateButton({
   Name = "Refresh Items",
   Callback = function()
       Dropdown:Refresh(GetItemNames())
   end,
})

local collectButton = Tab:CreateButton({
   Name = "Collect Selected Item",
   Callback = function()
       local selectedItemName = Dropdown.CurrentOption
       if type(selectedItemName) == "table" then
           selectedItemName = selectedItemName[1] 
       end

       if selectedItemName == "Select an item" then
           warn("No item selected!")
           return
       end

       local runtimeItems = workspace:FindFirstChild("RuntimeItems")
       if not runtimeItems then
           warn("RuntimeItems folder not found!")
           return
       end

       local selectedItem
       for _, item in ipairs(runtimeItems:GetDescendants()) do
           if item:IsA("Model") and item.Name == selectedItemName then
               selectedItem = item
               break
           end
       end

       if not selectedItem then
           warn("Item not found in RuntimeItems:", selectedItemName)
           return
       end

       local Players = game:GetService("Players")
       local LocalPlayer = Players.LocalPlayer
       if not LocalPlayer then
           warn("LocalPlayer not found!")
           return
       end

       local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
       local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

       if not selectedItem.PrimaryPart then
           warn(selectedItem.Name .. " has no PrimaryPart and cannot be moved.")
           return
       end

       selectedItem:SetPrimaryPartCFrame(HumanoidRootPart.CFrame + Vector3.new(0, 1, 0))
       print("Collected:", selectedItem.Name)
   end,
})

local collectAllButton = Tab:CreateButton({
   Name = "Collect All Items",
   Callback = function()
       local runtimeItems = workspace:FindFirstChild("RuntimeItems")
       if not runtimeItems then
           warn("RuntimeItems folder not found!")
           return
       end

       local ps = game:GetService("Players").LocalPlayer
       local ch = ps.Character or ps.CharacterAdded:Wait()
       local HumanoidRootPart = ch:WaitForChild("HumanoidRootPart")

       for _, item in ipairs(runtimeItems:GetDescendants()) do
           if item:IsA("Model") then
               if item.PrimaryPart then
                   local offset = HumanoidRootPart.CFrame.LookVector * 5
                   item:SetPrimaryPartCFrame(HumanoidRootPart.CFrame + offset)
               else
                   warn(item.Name .. " has no PrimaryPart .")
               end
           end
       end 
   end,
})

local EspTab = Window:CreateTab("ESP", 4483362458)

local ESPHandles = {}
local ESPEnabled = false

local function CreateESP(object, color)
    if not object or not object.PrimaryPart then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = object
    highlight.FillColor = color
    highlight.OutlineColor = color
    highlight.Parent = object

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Billboard"
    billboard.Adornee = object.PrimaryPart
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = object

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = object.Name
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextColor3 = color
    textLabel.BackgroundTransparency = 1
    textLabel.TextSize = 7
    textLabel.Parent = billboard

    ESPHandles[object] = {Highlight = highlight, Billboard = billboard}
end

local function ClearESP()
    for obj, handles in pairs(ESPHandles) do
        if handles.Highlight then handles.Highlight:Destroy() end
        if handles.Billboard then handles.Billboard:Destroy() end
    end
    ESPHandles = {}
end

local function UpdateESP()
    ClearESP()

    -- ESP for Items 
    local runtimeItems = workspace:FindFirstChild("RuntimeItems")
    if runtimeItems then
        for _, item in ipairs(runtimeItems:GetDescendants()) do
            if item:IsA("Model") then
                CreateESP(item, Color3.new(1, 0, 0)) 
            end
        end
    end

    -- ESP mobs
    local baseplates = workspace:FindFirstChild("Baseplates")
    if baseplates and #baseplates:GetChildren() >= 2 then
        local secondBaseplate = baseplates:GetChildren()[2]
        local centerBaseplate = secondBaseplate and secondBaseplate:FindFirstChild("CenterBaseplate")
        local animals = centerBaseplate and centerBaseplate:FindFirstChild("Animals")
        if animals then
            for _, animal in ipairs(animals:GetDescendants()) do
                if animal:IsA("Model") then
                    CreateESP(animal, Color3.new(1, 0, 1)) -- Purple for Animals
                end
            end
        end
    end

    local nightEnemies = workspace:FindFirstChild("NightEnemies")
    if nightEnemies then
        for _, enemy in ipairs(nightEnemies:GetDescendants()) do
            if enemy:IsA("Model") then
                CreateESP(enemy, Color3.new(0, 0, 1)) -- Blue for Night Enemies
            end
        end
    end

    local destroyedHouse = workspace:FindFirstChild("RandomBuildings") and workspace.RandomBuildings:FindFirstChild("DestroyedHouse")
    local zombiePart = destroyedHouse and destroyedHouse:FindFirstChild("StandaloneZombiePart")
    local zombies = zombiePart and zombiePart:FindFirstChild("Zombies")
    if zombies then
        for _, zombie in ipairs(zombies:GetChildren()) do
            if zombie:IsA("Model") then
                CreateESP(zombie, Color3.new(0, 1, 0)) -- Green for Zombies
            end
        end
    end
end

local function AutoUpdateESP()
    while ESPEnabled do
        UpdateESP()
        wait() 
    end
end

local espToggle = EspTab:CreateToggle({
    Name = "ESP Items and Mobs",
    CurrentValue = false,
    Flag = "ESPAllToggle",
    Callback = function(Value)
        ESPEnabled = Value
        if Value then
            UpdateESP()
            coroutine.wrap(AutoUpdateESP)()
        else
            ClearESP()
        end
    end
})

local RTab = Window:CreateTab("Report Bugs", 4483362458) 

local DButton = RTab:CreateButton({
   Name = "Discord: sajad7258",
   Callback = function()
   end,
})
