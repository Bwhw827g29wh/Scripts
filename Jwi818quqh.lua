
-- Verification System
-- This script template can be used with GitHub Pages

local VerificationSystem = {
    Config = {
        API_URL = "https://YOUR-GITHUB-USERNAME.github.io/verification-system", -- Replace with your GitHub Pages URL
        DEBUG = false,    -- Set to true for debug logs
    }
}

-- Utility Functions
function VerificationSystem:GenerateHWID()
    -- Generate a unique hardware ID
    local hwid = ""
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    -- Add some entropy based on game-specific values
    local plr = game:GetService("Players").LocalPlayer
    local seed = plr.UserId + os.time()
    math.randomseed(seed)
    
    -- Generate a random string
    for i = 1, 32 do
        local randomIndex = math.random(1, #chars)
        hwid = hwid .. string.sub(chars, randomIndex, randomIndex)
    end
    
    -- Add some hardware-specific identifiers if available
    hwid = hwid .. "_" .. plr.UserId .. "_" .. game.PlaceId
    
    return hwid
end

function VerificationSystem:MakeRequest(url, method, data)
    -- Make HTTP request to verification API
    local http = game:GetService("HttpService")
    local success, response = pcall(function()
        local options = {
            Url = url,
            Method = method or "GET",
            Headers = {
                ["Content-Type"] = "application/json"
            }
        }
        
        if data then
            options.Body = http:JSONEncode(data)
        end
        
        local result = http:RequestAsync(options)
        
        if result.Success then
            return true, http:JSONDecode(result.Body)
        else
            return false, "HTTP Error: " .. result.StatusCode .. " " .. result.StatusMessage
        end
    end)
    
    if not success then
        self:Log("Request Error: " .. tostring(response))
        return false, "Request failed"
    end
    
    return success, response
end

function VerificationSystem:Log(message)
    -- Debug logging
    if self.Config.DEBUG then
        print("[VERIFICATION] " .. message)
    end
end

function VerificationSystem:GetExecutorInfo()
    -- Get information about the executor being used
    local executor = "Unknown"
    local info = {}
    
    -- Try to identify the executor
    if syn then
        executor = "Synapse X"
    elseif KRNL_LOADED then
        executor = "KRNL"
    elseif Electron then
        executor = "Electron"
    elseif SENTINEL_LOADED then
        executor = "Sentinel"
    elseif is_sirhurt_closure then
        executor = "Sirhurt"
    elseif PROTOSMASHER_LOADED then
        executor = "ProtoSmasher"
    elseif fluxus then
        executor = "Fluxus"
    elseif getexecutorname then
        executor = getexecutorname()
    end
    
    -- Get OS info
    local os_info = "Unknown"
    pcall(function()
        if getgenv then
            os_info = getgenv().os_info or "Unknown"
        end
    end)
    
    info.executor = executor
    info.device = os_info
    
    return info
end

-- Main Verification Methods
function VerificationSystem:CheckVerification(hwid)
    -- Check if user is verified
    if not hwid then return false, "No HWID provided" end
    
    self:Log("Checking verification for HWID: " .. hwid)
    local url = self.Config.API_URL .. "/api/check_verification/" .. hwid
    local success, response = self:MakeRequest(url)
    
    if success then
        if response.verified then
            self:Log("User is verified!")
            return true, {
                verified = true,
                expires_at = response.expires_at,
                is_trial = response.is_trial,
                username = response.username,
                display_name = response.display_name
            }
        else
            self:Log("User is not verified: " .. (response.error or "Unknown reason"))
            return false, {
                verified = false,
                error = response.error or "Not verified"
            }
        end
    else
        self:Log("Verification check failed: " .. tostring(response))
        return false, { verified = false, error = "API Error" }
    end
end

function VerificationSystem:Register(hwid, username, script_name)
    -- Register a new user or get verification status
    if not hwid or not username then
        return false, "Missing required fields"
    end
    
    self:Log("Registering user: " .. username .. " with HWID: " .. hwid)
    
    -- Get executor info
    local exec_info = self:GetExecutorInfo()
    
    -- Prepare registration data
    local data = {
        hwid = hwid,
        username = username,
        display_name = game:GetService("Players").LocalPlayer.DisplayName,
        country = game.LocalizationService.SystemLocaleId,
        device = exec_info.device or "Unknown",
        executor = exec_info.executor or "Unknown",
        using = script_name or "Unknown Script"
    }
    
    -- Send registration request
    local url = self.Config.API_URL .. "/api/register"
    local success, response = self:MakeRequest(url, "POST", data)
    
    if success then
        self:Log("Registration response: " .. game:GetService("HttpService"):JSONEncode(response))
        
        if response.verified then
            -- Already verified
            return true, {
                verified = true,
                is_trial = response.is_trial,
                expires_at = response.expires_at,
                message = response.message
            }
        elseif response.link then
            -- Needs verification
            return true, {
                verified = false,
                link = response.link,
                message = response.message
            }
        else
            -- Error
            return false, response.error or "Unknown error"
        end
    else
        self:Log("Registration failed: " .. tostring(response))
        return false, "API Error"
    end
end

function VerificationSystem:Initialize(script_name)
    -- Initialize the verification system
    self:Log("Initializing verification system...")
    
    -- Generate HWID or load from saved
    local hwid = self:GenerateHWID()
    local username = game:GetService("Players").LocalPlayer.Name
    
    -- First, check if already verified
    local verified, result = self:CheckVerification(hwid)
    
    if verified then
        self:Log("User is already verified!")
        return true, result
    else
        -- Not verified, register
        return self:Register(hwid, username, script_name)
    end
end

-- User Interface
function VerificationSystem:CreateUI(data)
    -- Create a GUI for verification status or link
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "VerificationSystem"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 250)
    frame.Position = UDim2.new(0.5, -200, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.Text = "Verification System"
    title.TextSize = 18
    title.Parent = frame
    
    local uiCornerTitle = Instance.new("UICorner")
    uiCornerTitle.CornerRadius = UDim.new(0, 8)
    uiCornerTitle.Parent = title

    local content = Instance.new("TextLabel")
    content.Size = UDim2.new(1, -40, 0, 100)
    content.Position = UDim2.new(0, 20, 0, 60)
    content.BackgroundTransparency = 1
    content.TextColor3 = Color3.fromRGB(255, 255, 255)
    content.Font = Enum.Font.Gotham
    content.TextSize = 14
    content.TextWrapped = true
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextYAlignment = Enum.TextYAlignment.Top
    content.Parent = frame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 150, 0, 40)
    button.Position = UDim2.new(0.5, -75, 1, -60)
    button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Text = "Close"
    button.Parent = frame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Handle the different states
    if data.verified then
        content.Text = "Verification Status: Verified\n\n" ..
                      "Username: " .. (data.username or "Unknown") .. "\n" ..
                      "Expires: " .. (data.expires_at and os.date("%Y-%m-%d %H:%M", os.time(os.date("!*t", os.time({year = tonumber(string.sub(data.expires_at, 1, 4)), 
                                                           month = tonumber(string.sub(data.expires_at, 6, 7)), 
                                                           day = tonumber(string.sub(data.expires_at, 9, 10)),
                                                           hour = tonumber(string.sub(data.expires_at, 12, 13)),
                                                           min = tonumber(string.sub(data.expires_at, 15, 16)),
                                                           sec = tonumber(string.sub(data.expires_at, 18, 19))}))))) or "Never") .. "\n" ..
                      "Type: " .. (data.is_trial and "Trial" or "Full Access") .. "\n\n" ..
                      "You have full access to the script."
        title.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
    elseif data.link then
        content.Text = "Verification Required\n\n" ..
                      "Please complete the verification by visiting the Linkvertise link below:\n\n" ..
                      data.link .. "\n\n" ..
                      "After completing the verification, restart the script."
        title.BackgroundColor3 = Color3.fromRGB(230, 126, 34)
        
        -- Create copy button
        local copyButton = Instance.new("TextButton")
        copyButton.Size = UDim2.new(0, 150, 0, 30)
        copyButton.Position = UDim2.new(0.5, -75, 0, 150)
        copyButton.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
        copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        copyButton.Font = Enum.Font.Gotham
        copyButton.TextSize = 12
        copyButton.Text = "Copy Link"
        copyButton.Parent = frame
        
        local copyCorner = Instance.new("UICorner")
        copyCorner.CornerRadius = UDim.new(0, 6)
        copyCorner.Parent = copyButton
        
        copyButton.MouseButton1Click:Connect(function()
            setclipboard(data.link)
            copyButton.Text = "Copied!"
            wait(1)
            copyButton.Text = "Copy Link"
        end)
    elseif data.error then
        content.Text = "Verification Error\n\n" ..
                      "An error occurred during verification:\n" ..
                      data.error .. "\n\n" ..
                      "Please try again later or contact support."
        title.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
    end
    
    -- Close button functionality
    button.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    return screenGui
end

-- Main Verification Process
function VerificationSystem:Start()
    self:Log("Starting verification process")
    
    -- Step 1: Check if already verified
    local hwid = self:GenerateHWID()
    local checkSuccess, checkData = self:CheckVerification(hwid)
    
    if checkSuccess then
        self:Log("Already verified!")
        self:CreateUI(checkData)
        return true
    end
    
    -- Step 2: Register for verification
    local username = game:GetService("Players").LocalPlayer.Name
    local registerSuccess, registerData = self:Register(hwid, username, "Your Script Name")
    
    if registerSuccess then
        if registerData.verified then
            self:Log("Verification successful (new trial)")
            self:CreateUI(registerData)
            return true
        else
            self:Log("Verification required, showing link")
            self:CreateUI(registerData)
            return false
        end
    else
        self:Log("Registration failed")
        self:CreateUI({ error = registerData })
        return false
    end
end

-- Return the module
return VerificationSystem
