local plrGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = plrGui
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9

-- Create Background Frame (Main Container)
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.9, 0, 0.9, 0) -- 1:1 ratio
Frame.Position = UDim2.new(0.05, 0, 0.05, 0) -- Centered
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1) -- Dark theme
Frame.BorderSizePixel = 3
Frame.BorderColor3 = Color3.new(0.8, 0.8, 0.8) -- Grey border

-- Create a Frame to Hold Text Labels
local TextContainer = Instance.new("Frame")
TextContainer.Parent = Frame
TextContainer.Size = UDim2.new(1, 0, 0.78, 0)
TextContainer.Position = UDim2.new(0, 0, 0, 0)
TextContainer.BackgroundTransparency = 1

-- Add Padding for Better Spacing
local UIPadding = Instance.new("UIPadding")
UIPadding.Parent = TextContainer
UIPadding.PaddingTop = UDim.new(0.02, 0)
UIPadding.PaddingBottom = UDim.new(0.02, 0)
UIPadding.PaddingLeft = UDim.new(0.02, 0)
UIPadding.PaddingRight = UDim.new(0.02, 0)

-- Function to Create Text Labels with Auto Size and Better Spacing
local function createLabel(text, color)
    local label = Instance.new("TextLabel")
    label.Parent = TextContainer
    label.Size = UDim2.new(1, 0, 0, 0) -- Starts with no height
    label.AutomaticSize = Enum.AutomaticSize.Y -- Auto expand height
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextScaled = false
    label.TextSize = 21 -- Larger default font size
    label.TextWrapped = false 
    label.RichText = true
    label.Font = Enum.Font.SourceSansBold
    return label
end 

-- List of Labels with More Spacing
local labelTexts = {
    { "Delta Not Supported", Color3.new(1, 0, 0) }, -- Red
    { "Because it's overwriting the key storage!", Color3.new(1, 1, 1) }, -- White
    { "RECOMMENDED EXECUTOR", Color3.new(0, 1, 0) }, -- Green
    { "Use 'KRNL' it's available in iOS and Android", Color3.new(1, 1, 1) }, -- White
    { "Key system: Easy | UNC: 98% | Level: 8 | direct key link no Linkvertise lootlinks maybe because it's new", Color3.new(1, 1, 1) }, -- White
    { "Optimized ✅ | Not laggy ✅ l Bypasses some anti-cheat ✅ | Fast ✅ | Premium Feature for free ✅ ", Color3.new(1, 1, 1) }, -- White
    { "Top 2 Recommendation: Arceus X", Color3.new(1, 1, 1) }, -- White
    { "Key system: Hard / Lootdest / Multiple verification", Color3.new(1, 1, 1) }, -- White
    { "UNC: ? | Level: ? ", Color3.new(1, 1, 1) }, -- White
    
}

local yOffset = 0.05 -- Adjusted for better spacing

for _, info in ipairs(labelTexts) do
    local label = createLabel(info[1], info[2])
    label.Position = UDim2.new(0, 0, yOffset, 0) -- Adjust position dynamically
    yOffset = yOffset + 0.11 -- Increased spacing between labels
end

-- Copy KRNL Link Button
local CopyLinkButton = Instance.new("TextButton")
CopyLinkButton.Parent = Frame
CopyLinkButton.Size = UDim2.new(0.6, 0, 0.08, 0)
CopyLinkButton.Position = UDim2.new(0.2, 0, 0.80, 0)
CopyLinkButton.BackgroundColor3 = Color3.new(0, 0, 1) -- Blue
CopyLinkButton.TextColor3 = Color3.new(1, 1, 1) -- White
CopyLinkButton.Text = "Copy Official KRNL Link"
CopyLinkButton.TextScaled = true
CopyLinkButton.Font = Enum.Font.SourceSansBold

local clr = CopyLinkButton:Clone()
clr.Parent = Frame
clr.Position = UDim2.new(0.2,0,0.90,0)
clr.Text = "Copy Official Arceus x Link"

CopyLinkButton.MouseButton1Click:Connect(function()
    setclipboard("https://krnl.place") -- Copies the KRNL link
end)

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0) -- Top-right corner
CloseButton.BackgroundColor3 = Color3.new(0.5, 0, 0) -- Dark red
CloseButton.TextColor3 = Color3.new(1, 1, 1) -- White
CloseButton.Text = "X"
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.SourceSansBold

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Close GUI
end)
