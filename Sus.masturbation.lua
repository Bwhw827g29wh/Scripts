-- Made by muscle_legends2021 (Gio)
-- YouTube: GioBolqvi
-- Combined by GGH52Lan
-- YouTube: GGH52LAN
-- Combined the two R6 and R15 so no need to execute manually 

local G = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bwhw827g29wh/Scripts/refs/heads/main/FetchAndExecute.lua"))()

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

if char then
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    
    if humanoid and humanoid.RigType == Enum.HumanoidRigType.R15 then
        G:fetchAndExecute("https://pastefy.app/YZoglOyJ/raw") -- R15 script URL
    else
        G:fetchAndExecute("https://pastefy.app/wa3v2Vgm/raw") -- Non-R15 script URL
    end
end
