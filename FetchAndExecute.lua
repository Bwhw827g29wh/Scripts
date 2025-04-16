local g = {}

-- Function to detect the device type
function g:getDeviceType()
    if game:GetService("UserInputService").TouchEnabled then
        if game:GetService("UserInputService").KeyboardEnabled then
            return "Tablet" -- Device has both touch & keyboard
        else
            return "Mobile" -- Only touch input
        end
    else
        return "PC" -- No touch input detected, assuming desktop/laptop
    end
end

-- Function to execute code safely
function g:executeCode(code)
    if _G.runcode then
        _G.runcode(code) -- Try executing with runcode if available
    else
        local func, err = loadstring(code)
        if func then
            func() -- Run the fetched script
        else
            warn("❌ Error loading code:", err)
        end
    end
end

-- Function to fetch script from a URL and execute it
function g:fetchAndExecute(url)
    local response

    -- Try syn.request first (Exploit required)
    if syn and syn.request then
        response = syn.request({ Url = url, Method = "GET" })
        if response and response.StatusCode == 200 then
            g:executeCode(response.Body)
            return
        else
            warn("❌ syn.request failed!")
        end
    end

    -- Try http_request next (Exploit required)
    if http_request then
        response = http_request({ Url = url, Method = "GET" })
        if response and response.StatusCode == 200 then
            g:executeCode(response.Body)
            return
        else
            warn("❌ http_request failed!")
        end
    end

    -- Try request (Common in exploits)
    if request then
        response = request({ Url = url, Method = "GET" })
        if response and response.Success then
            g:executeCode(response.Body)
            return
        else
            warn("❌ request failed!")
        end
    end

    -- Try Roblox's built-in HttpGet & HttpGetAsync
    if game and game.HttpGet then
        local success, body = pcall(function() return game:HttpGet(url) end)
        if success then
            g:executeCode(body)
            return
        else
            warn("❌ game:HttpGet failed!")
        end
    end

    if game and game.HttpGetAsync then
        local success, body = pcall(function() return game:HttpGetAsync(url) end)
        if success then
            g:executeCode(body)
            return
        else
            warn("❌ game:HttpGetAsync failed!")
        end
    end

    warn("❌ All HTTP request methods failed. Cannot fetch script!")
end

return g
