-- 🦔 SONIC INSPIRED LOADING GUI 🦔
-- Fixed timeout logic!

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 🎨 SONIC COLOR PALETTE
local Colors = {
    SonicBlue = Color3.fromRGB(0, 102, 255),
    DarkBlue = Color3.fromRGB(0, 51, 153),
    LightBlue = Color3.fromRGB(102, 204, 255),
    GoldRing = Color3.fromRGB(255, 215, 0),
    White = Color3.fromRGB(255, 255, 255),
    Black = Color3.fromRGB(0, 0, 0),
    Shadow = Color3.fromRGB(0, 0, 0, 0.3)
}

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SonicLoadingGUI"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999999999
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- 🌟 MAIN CONTAINER
local mainFrame = Instance.new("Frame")
mainFrame.Name = "LoadingContainer"
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Colors.DarkBlue
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

-- Gradient background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Colors.DarkBlue),
    ColorSequenceKeypoint.new(1, Colors.SonicBlue)
}
gradient.Rotation = 45
gradient.Parent = mainFrame

-- 💨 SPEED LINES BACKGROUND
local speedLinesFrame = Instance.new("Frame")
speedLinesFrame.Name = "SpeedLines"
speedLinesFrame.Size = UDim2.new(1, 0, 1, 0)
speedLinesFrame.Position = UDim2.new(0, 0, 0, 0)
speedLinesFrame.BackgroundTransparency = 1
speedLinesFrame.Parent = mainFrame

-- Create speed lines
for i = 1, 12 do
    local line = Instance.new("Frame")
    line.Name = "SpeedLine" .. i
    line.Size = UDim2.new(0, 4, 0, math.random(50, 200))
    line.Position = UDim2.new(math.random(), 0, math.random(), 0)
    line.BackgroundColor3 = Colors.LightBlue
    line.BorderSizePixel = 0
    line.BackgroundTransparency = 0.7
    line.Rotation = math.random(-30, 30)
    line.Parent = speedLinesFrame
    
    -- Animate speed lines
    local moveTween = TweenService:Create(line, 
        TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), 
        {Position = UDim2.new(-0.2, 0, line.Position.Y.Scale, 0)}
    )
    moveTween:Play()
end

-- 🎯 LOADING CONTENT AREA
local contentFrame = Instance.new("Frame")
contentFrame.Name = "LoadingContent"
contentFrame.Size = UDim2.new(0, 400, 0, 300)
contentFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- 📱 RESPONSIVE SCALING
local UIScale = Instance.new("UIScale")
UIScale.Scale = math.min(1, workspace.CurrentCamera.ViewportSize.X / 800)
UIScale.Parent = contentFrame

-- 🦔 SONIC TITLE
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "SonicTitle"
titleLabel.Size = UDim2.new(1, 0, 0, 60)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ LOADING ⚡"
titleLabel.TextColor3 = Colors.White
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.FredokaOne
titleLabel.TextStrokeTransparency = 0
titleLabel.TextStrokeColor3 = Colors.DarkBlue
titleLabel.Parent = contentFrame

-- Pulsing title animation
local titlePulse = TweenService:Create(titleLabel,
    TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {TextTransparency = 0.3}
)
titlePulse:Play()

-- 💍 RING LOADING INDICATOR
local ringContainer = Instance.new("Frame")
ringContainer.Name = "RingContainer"
ringContainer.Size = UDim2.new(0, 120, 0, 120)
ringContainer.Position = UDim2.new(0.5, -60, 0, 80)
ringContainer.BackgroundTransparency = 1
ringContainer.Parent = contentFrame

-- Outer ring (static)
local outerRing = Instance.new("Frame")
outerRing.Name = "OuterRing"
outerRing.Size = UDim2.new(1, 0, 1, 0)
outerRing.Position = UDim2.new(0, 0, 0, 0)
outerRing.BackgroundColor3 = Colors.GoldRing
outerRing.BackgroundTransparency = 0.5
outerRing.BorderSizePixel = 0
outerRing.Parent = ringContainer

local outerCorner = Instance.new("UICorner")
outerCorner.CornerRadius = UDim.new(0.5, 0)
outerCorner.Parent = outerRing

-- Inner ring (spinning)
local innerRing = Instance.new("Frame")
innerRing.Name = "InnerRing"
innerRing.Size = UDim2.new(0.7, 0, 0.7, 0)
innerRing.Position = UDim2.new(0.15, 0, 0.15, 0)
innerRing.BackgroundColor3 = Colors.GoldRing
innerRing.BorderSizePixel = 0
innerRing.Parent = ringContainer

local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(0.5, 0)
innerCorner.Parent = innerRing

-- Ring hole
local ringHole = Instance.new("Frame")
ringHole.Name = "RingHole"
ringHole.Size = UDim2.new(0.4, 0, 0.4, 0)
ringHole.Position = UDim2.new(0.3, 0, 0.3, 0)
ringHole.BackgroundColor3 = Colors.DarkBlue
ringHole.BorderSizePixel = 0
ringHole.Parent = innerRing

local holeCorner = Instance.new("UICorner")
holeCorner.CornerRadius = UDim.new(0.5, 0)
holeCorner.Parent = ringHole

-- Spinning animation
local spinTween = TweenService:Create(innerRing,
    TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Rotation = 360}
)
spinTween:Play()

-- 📊 PROGRESS BAR
local progressFrame = Instance.new("Frame")
progressFrame.Name = "ProgressFrame"
progressFrame.Size = UDim2.new(0.8, 0, 0, 8)
progressFrame.Position = UDim2.new(0.1, 0, 0, 220)
progressFrame.BackgroundColor3 = Colors.White
progressFrame.BackgroundTransparency = 0.7
progressFrame.BorderSizePixel = 0
progressFrame.Parent = contentFrame

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 4)
progressCorner.Parent = progressFrame

-- Progress fill
local progressFill = Instance.new("Frame")
progressFill.Name = "ProgressFill"
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.Position = UDim2.new(0, 0, 0, 0)
progressFill.BackgroundColor3 = Colors.GoldRing
progressFill.BorderSizePixel = 0
progressFill.Parent = progressFrame

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 4)
fillCorner.Parent = progressFill

-- 📈 PERCENTAGE TEXT
local percentLabel = Instance.new("TextLabel")
percentLabel.Name = "PercentLabel"
percentLabel.Size = UDim2.new(1, 0, 0, 30)
percentLabel.Position = UDim2.new(0, 0, 0, 240)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Colors.White
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.GothamBold
percentLabel.Parent = contentFrame

-- 💬 STATUS TEXT
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.Position = UDim2.new(0, 0, 0, 275)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Initializing..."
statusLabel.TextColor3 = Colors.LightBlue
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = contentFrame

-- 🎮 SIMPLIFIED LOADING CONTROLLER (NO BROKEN TIMEOUT)
local LoadingController = {}
LoadingController.Progress = 0
LoadingController.IsLoading = true
LoadingController.LoadingTasks = {}
LoadingController.CompletedTasks = 0

local statusMessages = {
    "Collecting rings...",
    "Spinning up...", 
    "Going fast...",
    "Almost there...",
    "Ready to go!"
}

-- Add loading tasks
function LoadingController:AddTask(taskName, taskFunction)
    table.insert(self.LoadingTasks, {
        name = taskName,
        func = taskFunction,
        completed = false
    })
end

-- FIXED: Simple execution without broken timeout
function LoadingController:StartLoading()
    self.IsLoading = true
    local totalTasks = #self.LoadingTasks
    
    if totalTasks == 0 then
        -- print("⚠️ No loading tasks defined, completing...")
        self:SetProgress(100)
        return
    end
    
    spawn(function()
        for i, task in ipairs(self.LoadingTasks) do
            -- Update status
            statusLabel.Text = "Loading " .. task.name .. "..."
            -- print("🔄 Starting task:", task.name)
            
            -- Execute the task simply (no broken timeout)
            local success, errorMsg = pcall(task.func)
            
            -- Mark as completed
            task.completed = true
            self.CompletedTasks = self.CompletedTasks + 1
            
            -- Update progress
            local progress = (self.CompletedTasks / totalTasks) * 100
            self:SetProgress(progress)
            
            if success then
                -- print("✅ Completed:", task.name)
            else
                print("⚠️ Task failed but continuing:", task.name, "-", tostring(errorMsg))
            end
            
            -- Small delay between tasks
            wait(0.2)
        end
        
        -- print("🎯 All tasks processed!")
    end)
end

function LoadingController:SetProgress(percent)
    self.Progress = math.clamp(percent, 0, 100)
    
    -- Update progress bar
    local fillTween = TweenService:Create(progressFill,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(self.Progress / 100, 0, 1, 0)}
    )
    fillTween:Play()
    
    -- Update percentage
    percentLabel.Text = math.floor(self.Progress) .. "%"
    
    -- Update status message based on progress
    if self.Progress < 20 then
        statusLabel.Text = statusMessages[1]
    elseif self.Progress < 40 then
        statusLabel.Text = statusMessages[2]
    elseif self.Progress < 60 then
        statusLabel.Text = statusMessages[3]
    elseif self.Progress < 90 then
        statusLabel.Text = statusMessages[4]
    else
        statusLabel.Text = statusMessages[5]
    end
    
    -- Complete animation when reaching 100%
    if self.Progress >= 100 then
        wait(0.5)
        self:Complete()
    end
end

function LoadingController:Complete()
    self.IsLoading = false
    
    -- print("🎉 Loading complete!")
    
    -- Celebration effect
    titleLabel.Text = "⚡ READY! ⚡"
    statusLabel.Text = "Let's go!"
    
    -- Ring collection effect
    for i = 1, 8 do
        local ring = Instance.new("Frame")
        ring.Size = UDim2.new(0, 20, 0, 20)
        ring.Position = UDim2.new(0.5, -10, 0.5, -10)
        ring.BackgroundColor3 = Colors.GoldRing
        ring.BorderSizePixel = 0
        ring.Parent = ringContainer
        
        local ringCorner = Instance.new("UICorner")
        ringCorner.CornerRadius = UDim.new(0.5, 0)
        ringCorner.Parent = ring
        
        -- Animate rings flying out
        local angle = (i / 8) * math.pi * 2
        local targetX = math.cos(angle) * 100
        local targetY = math.sin(angle) * 100
        
        local flyTween = TweenService:Create(ring,
            TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Position = UDim2.new(0.5, targetX, 0.5, targetY),
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 40, 0, 40)
            }
        )
        flyTween:Play()
        
        -- Clean up ring
        flyTween.Completed:Connect(function()
            ring:Destroy()
        end)
    end
    
    -- Auto-hide after celebration
    wait(2)
    self:Hide()
end

function LoadingController:Hide()
    local hideTween = TweenService:Create(mainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    )
    hideTween:Play()
    
    -- Hide all child elements
    for _, child in pairs(mainFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            TweenService:Create(child,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {BackgroundTransparency = 1}
            ):Play()
        end
    end
    
    hideTween.Completed:Connect(function()
        screenGui:Destroy()
        -- print("🗑️ Loading GUI destroyed")
    end)
end

--[[ 🚀 SIMPLE, WORKING LOADING TASKS
LoadingController:AddTask("Essential Services", function()
    -- These always work instantly
    game:GetService("ReplicatedStorage")
    game:GetService("Workspace") 
    game:GetService("Players")
    print("📦 Services loaded")
    wait(0.5) -- Simulate work
end)

LoadingController:AddTask("Player Setup", function()
    -- Safe checks only
    if player:FindFirstChild("leaderstats") then
        print("📊 Leaderstats found")
    else
        print("📊 No leaderstats (normal)")
    end
    wait(0.4)
end)

LoadingController:AddTask("Game Assets", function()
    -- Check for common objects
    if workspace:FindFirstChild("Map") then
        print("🗺️ Map found")
    end
    if game.ReplicatedStorage:FindFirstChild("RemoteEvents") then
        print("📡 RemoteEvents found")
    end
    wait(0.6)
end)

LoadingController:AddTask("Scripts Loading", function()
    -- Your actual script loading here
    print("📜 Loading external scripts...")
    repeat
        wait()
    until game:IsLoaded()
    
    
    -- Example: Load your LoopOptimizer
    --[[
    local LoopOptimizer = loadstring(game:HttpGet("your-url-here"))()
    if LoopOptimizer then
        print("✅ LoopOptimizer loaded")
    end
    ]
    
    wait(0.7)
end)

LoadingController:AddTask("uwu", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Final Setup", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Fip", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Finalp", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Finap", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Finp", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Final Seup", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Fi Setup", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Fi Sep", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)

LoadingController:AddTask("Finalp", function()
    workspace:FindFirstChild("uwu")
    local a = game.Players.uwu
    local b = game.ReplicatedStorage["whats"]
    print("🎮 Finalizing setup...")
    wait(0.3)
end)



-- 🎯 START LOADING
print("🦔 Sonic Loading GUI Started!")
LoadingController:StartLoading() ]]

-- Return controller
return LoadingController
