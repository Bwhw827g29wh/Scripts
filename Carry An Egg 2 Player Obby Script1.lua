local function fetchAndExecute(url)
    local response = request({
        Url = url,
        Method = "GET"
    })

    if response.Success then
        local code = response.Body
        local func, err = loadstring(code)

        if func then
            func() -- Safely execute the fetched code
        else
            warn("Error loading code: " .. err)
        end
    else
        warn("HTTP request failed: " .. response.StatusCode)
    end
end

fetchAndExecute("https://raw.githubusercontent.com/Bwhw827g29wh/Scripts/refs/heads/main/PathGui.lua")
