local g = {}

function g:fetchAndExecute(url)
    local response

    -- Try syn.request first
    if pcall(function()
        response = syn.request({
            Url = url,
            Method = "GET"
        })
    end) then
        -- Check if syn.request succeeded
        print("syn.request works")
        if response.StatusCode == 200 then
            local func, err = loadstring(response.Body)
            if func then
                func() -- Safely execute the fetched code
                return
            else
                warn("Error loading code: " .. err)
                return
            end
        end
        else
            print ("syn.request failed")
    end

    -- Finally, try http_request
    if pcall(function()
        response = http_request({
            Url = url,
            Method = "GET"
        })
    end) then
    print("http_request works")
        if response.StatusCode == 200 then
            local func, err = loadstring(response.Body)
            if func then
                func() -- Safely execute the fetched code
                return
            else
                warn("Error loading code: " .. err)
                return
            end
        end
        else
            print ("http_request failed")
    end
    
    -- Try request next
    if pcall(function()
        response = request({
            Url = url,
            Method = "GET"
        })
    end) then
    print ("request works")
        if response.Success then
            local func, err = loadstring(response.Body)
            if func then
                func() -- Safely execute the fetched code
                return
            else
                warn("Error loading code: " .. err)
                return
            end
        end
        else
            print ("request failed")
    end

    warn("All HTTP requests failed.")
end

return g
