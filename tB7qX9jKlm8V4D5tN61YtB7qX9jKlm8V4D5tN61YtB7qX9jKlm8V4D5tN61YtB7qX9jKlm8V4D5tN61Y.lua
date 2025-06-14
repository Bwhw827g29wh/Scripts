-- 🦔 SONIC INSPIRED LOADING GUI WITH ANIMATIONS 🦔
-- Complete code with smooth numbers and text animations!

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

function hide(Main)
    spawn(function()
    if get_hidden_gui or gethui then
    local hiddenUI = get_hidden_gui or gethui
    Main.Parent = hiddenUI()
elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
    syn.protect_gui(Main)
    Main.Parent = CoreGui
else
    Main.Parent = CoreGui
end
end)
end 

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SonicLoadingGUI"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999999999
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui
--hide(screenGui)

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

-- 🎮 ANIMATED LOADING CONTROLLER
local LoadingController = {}
LoadingController.Progress = 0
LoadingController.IsLoading = true
LoadingController.CurrentPercent = 0 -- Track current animated percent

-- 🎬 ANIMATED NUMBER COUNTER
function LoadingController:AnimateNumber(fromPercent, toPercent, duration)
    duration = duration or 0.8
    local startTime = tick()
    
    spawn(function()
        while tick() - startTime < duration do
            local elapsed = tick() - startTime
            local progress = math.min(elapsed / duration, 1)
            
            -- Smooth easing (ease out cubic)
            local easedProgress = 1 - math.pow(1 - progress, 3)
            local currentValue = fromPercent + (toPercent - fromPercent) * easedProgress
            
            -- Update percentage display
            percentLabel.Text = math.floor(currentValue) .. "%"
            
            -- Update progress bar smoothly
            local fillTween = TweenService:Create(progressFill,
                TweenInfo.new(0.1, Enum.EasingStyle.Linear),
                {Size = UDim2.new(currentValue / 100, 0, 1, 0)}
            )
            fillTween:Play()
            
            wait(0.03) -- 30fps animation
        end
        
        -- Ensure final values
        percentLabel.Text = math.floor(toPercent) .. "%"
        progressFill.Size = UDim2.new(toPercent / 100, 0, 1, 0)
        self.CurrentPercent = toPercent
    end)
end

-- 🎭 ANIMATED TEXT TRANSITIONS
function LoadingController:AnimateText(newText, animationType)
    animationType = animationType or "fade"
    
    if animationType == "fade" then
        -- Fade out current text
        local fadeOut = TweenService:Create(statusLabel,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {TextTransparency = 1}
        )
        fadeOut:Play()
        
        fadeOut.Completed:Connect(function()
            statusLabel.Text = newText
            
            -- Fade in new text
            local fadeIn = TweenService:Create(statusLabel,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 0}
            )
            fadeIn:Play()
        end)
        
    elseif animationType == "slide" then
        -- Slide out current text
        local slideOut = TweenService:Create(statusLabel,
            TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {Position = UDim2.new(1.5, 0, 0, 275), TextTransparency = 0.7}
        )
        slideOut:Play()
        
        slideOut.Completed:Connect(function()
            statusLabel.Text = newText
            statusLabel.Position = UDim2.new(-0.5, 0, 0, 275)
            
            -- Slide in new text
            local slideIn = TweenService:Create(statusLabel,
                TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {Position = UDim2.new(0, 0, 0, 275), TextTransparency = 0}
            )
            slideIn:Play()
        end)
        
    elseif animationType == "typewriter" then
        -- Clear current text
        local originalText = statusLabel.Text
        statusLabel.Text = ""
        
        spawn(function()
            for i = 1, #newText do
                statusLabel.Text = string.sub(newText, 1, i)
                wait(0.04) -- Typing speed
            end
        end)
    end
end

-- 🌟 PROGRESS PARTICLES
function LoadingController:CreateProgressParticles()
    for i = 1, 4 do
        local particle = Instance.new("Frame")
        particle.Size = UDim2.new(0, 3, 0, 3)
        particle.Position = UDim2.new(self.Progress / 100, math.random(-3, 3), 0.5, math.random(-3, 3))
        particle.BackgroundColor3 = Colors.GoldRing
        particle.BorderSizePixel = 0
        particle.BackgroundTransparency = 0.2
        particle.Parent = progressFrame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.5, 0)
        corner.Parent = particle
        
        -- Animate particle
        local moveTween = TweenService:Create(particle,
            TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Position = UDim2.new(self.Progress / 100, math.random(-15, 15), 0.5, math.random(-25, 25)),
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 6, 0, 6)
            }
        )
        moveTween:Play()
        
        moveTween.Completed:Connect(function()
            particle:Destroy()
        end)
    end
end

-- 🎯 ENHANCED PROGRESS FUNCTION
function LoadingController:SetProgress(percent, animated)
    animated = animated ~= false -- Default to true
    
    if animated then
        self:AnimateNumber(self.CurrentPercent, percent, 0.8)
        if percent > self.CurrentPercent then
            wait(0.2) -- Small delay before particles
            self:CreateProgressParticles()
        end
    else
        self.CurrentPercent = percent
        percentLabel.Text = math.floor(percent) .. "%"
        progressFill.Size = UDim2.new(percent / 100, 0, 1, 0)
    end
    
    self.Progress = percent
    
    -- Complete animation when reaching 100%
    if self.Progress >= 100 then
        wait(1.2) -- Wait to see 100% animation
        self:Complete()
    end
end

-- 🎨 ANIMATED TEXT FUNCTION
function LoadingController:SetText(text, animationType)
    self:AnimateText(text, animationType or "fade")
    wait(0.5) -- Wait for animation to complete
end

-- 🌈 SPECIAL LOADING EFFECTS
function LoadingController:AddSpecialEffect(effectType)
    spawn(function()
        if effectType == "ring_pulse" then
            -- Pulse the ring
            local originalSize = ringContainer.Size
            local pulseTween = TweenService:Create(ringContainer,
                TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 2, true),
                {Size = UDim2.new(0, 140, 0, 140)}
            )
            pulseTween:Play()
            
            pulseTween.Completed:Connect(function()
                ringContainer.Size = originalSize
            end)
            
        elseif effectType == "speed_boost" then
            -- Speed up the spinning ring
            spinTween:Cancel()
            local fastSpin = TweenService:Create(innerRing,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
                {Rotation = 360}
            )
            fastSpin:Play()
            
            -- Reset after 2 seconds
            wait(2.5)
            fastSpin:Cancel()
            spinTween:Play()
            
        elseif effectType == "title_glow" then
            -- Add glow effect to title
            local originalColor = titleLabel.TextColor3
            local glowTween = TweenService:Create(titleLabel,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 4, true),
                {TextColor3 = Colors.GoldRing}
            )
            glowTween:Play()
            
            glowTween.Completed:Connect(function()
                titleLabel.TextColor3 = originalColor
            end)
            
        elseif effectType == "rainbow_progress" then
            -- Rainbow progress bar effect
            local rainbow = Instance.new("UIGradient")
            rainbow.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 127, 0)),
                ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 0, 255))
            }
            rainbow.Parent = progressFill
            
            -- Animate rainbow
            local rainbowTween = TweenService:Create(rainbow,
                TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
                {Rotation = 360}
            )
            rainbowTween:Play()
            
            wait(3)
            rainbowTween:Cancel()
            rainbow:Destroy()
        end
    end)
end

-- 🎨 ENHANCED UPDATE STATUS
function LoadingController:UpdateStatus(newText, progressPercent, options)
    options = options or {}
    local textAnimation = options.textAnimation or "fade"
    local progressAnimation = options.progressAnimation ~= false
    local specialEffect = options.effect
    
    if newText then
        self:SetText(newText, textAnimation)
    end
    if progressPercent then
        self:SetProgress(progressPercent, progressAnimation)
    end
    if specialEffect then
        self:AddSpecialEffect(specialEffect)
    end
end

-- 🚀 SINGLE LOADER FUNCTION
function LoadingController:Loader(taskName, taskFunction)
    self.IsLoading = true
    statusLabel.Text = "Starting " .. taskName .. "..."
    
    spawn(function()
        -- print("🔄 Starting:", taskName)
        
        -- Execute the task with access to LoadingController
        local success, errorMsg = pcall(function()
            taskFunction(self)
        end)
        
        if success then
            -- print("✅ Completed:", taskName)
        else
            error("❌ Failed:", taskName, "-", tostring(errorMsg))
            statusLabel.Text = "Error: " .. tostring(errorMsg)
            wait(20)
            self:Hide()
        end
    end)
end

function LoadingController:Complete()
    self.IsLoading = false
    
    print("🎉 Loading complete!")
    
    -- Epic completion effects
    self:AddSpecialEffect("rainbow_progress")
    self:AddSpecialEffect("title_glow")
    
    -- Celebration effect
    titleLabel.Text = "⚡ READY! ⚡"
    statusLabel.Text = "Sheeshhhhh!"
    
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
        local targetX = math.cos(angle) * 120
        local targetY = math.sin(angle) * 120
        
        local flyTween = TweenService:Create(ring,
            TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Position = UDim2.new(0.5, targetX, 0.5, targetY),
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 50, 0, 50),
                Rotation = 720
            }
        )
        flyTween:Play()
        
        -- Clean up ring
        flyTween.Completed:Connect(function()
            ring:Destroy()
        end)
    end
    
    -- Auto-hide after celebration
    wait(3)
    self:Hide()
end

function LoadingController:Hide()
    local hideTween = TweenService:Create(mainFrame,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    )
    hideTween:Play()
    
    -- Hide all child elements with staggered timing
    local delay = 0
    for _, child in pairs(mainFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            spawn(function()
                wait(delay)
                TweenService:Create(child,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                    {BackgroundTransparency = 1}
                ):Play()
                delay = delay + 0.05
            end)
        end
    end
    
    hideTween.Completed:Connect(function()
        screenGui:Destroy()
        -- print("🗑️ Loading GUI destroyed with style!")
    end)
end

--[[ 🎯 EPIC ANIMATED USAGE!
LoadingController:Loader("Setting up", function(loader)
    -- Step 1: Services with typewriter effect
    loader:UpdateStatus("Loading services...", 8, {
        textAnimation = "typewriter",
        effect = "ring_pulse"
    })
    wait(5)
    -- Step 2: Anti-detect with slide effect
    loader:UpdateStatus("Loading Anti-detect...", 18, {
        textAnimation = "slide",
        effect = "speed_boost"
    })
    wait(5)
    loader:UpdateStatus("Loading LoopOptimizer...", 35, {
        textAnimation = "fade",
        effect = "title_glow"
    })
    wait(5)
    loader:UpdateStatus("Loading TableExplorer...", 50, {
        textAnimation = "typewriter",
        effect = "ring_pulse"
    })
    wait(5)
    loader:UpdateStatus("Loading FruitVision...", 65, {
        textAnimation = "slide",
        effect = "speed_boost"
    })
    wait(5)
    loader:UpdateStatus("Loading functions...", 78, {
        textAnimation = "fade",
        effect = "rainbow_progress"
    })
    wait(5)
    loader:UpdateStatus("Loading game modules...", 88, {
        textAnimation = "typewriter",
        effect = "title_glow"
    })
    wait(5)
    loader:UpdateStatus("Loading player data...", 95, {
        textAnimation = "slide",
        effect = "ring_pulse"
    })
    wait(5)
    loader:UpdateStatus("Ready to go fast!", 100, {
        textAnimation = "typewriter",
        effect = "speed_boost"
    })
    
end) ]]

return LoadingController
