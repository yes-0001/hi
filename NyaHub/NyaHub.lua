--[[
███╗   ██╗██╗   ██╗ █████╗ ██╗  ██╗██╗   ██╗██████╗ 
████╗  ██║╚██╗ ██╔╝██╔══██╗██║  ██║██║   ██║██╔══██╗
██╔██╗ ██║ ╚████╔╝ ███████║███████║██║   ██║██████╔╝
██║╚██╗██║  ╚██╔╝  ██╔══██║██╔══██║██║   ██║██╔══██╗
██║ ╚████║   ██║   ██║  ██║██║  ██║╚██████╔╝██████╔╝
╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝
]]


--[[ ==========  Supported Games  ========== ]]
-- Phantom Forces

--[[ ==========  Executed Check  ========== ]]

if getgenv().nyahub then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "NyaHub",
        Text = "NyaHub has already been executed in this game"
    })
    return
end

getgenv().nyahub = true

--[[ ==========  Compatibility  ========== ]]

local missing = {}

local funcs = {
    ["Drawing.new"] = {},
    ["firesignal"] = {},
    ["firetouchinterest"] = {},
    ["getconnections"] = {},
    ["getconstants"] = { "debug.getconstants" },
    ["getgc"] = { "get_gc_objects" },
    ["getinfo"] = { "debug.getinfo" },
    ["getloadedmodules"] = { "get_loaded_modules", "getmodules", "get_modules" },
    ["getupvalue"] = { "debug.getupvalue" },
    ["getupvalues"] = { "debug.getupvalues" },
    ["hookmetamethod"] = {},
    ["httprequest"] = { "http_request", "request", "syn.request" },
    ["islclosure"] = { "is_l_closure" },
    ["newcclosure"] = { "new_c_closure" },
    ["require"] = {},
    ["setconstant"] = { "debug.setconstant" },
    ["setthreadidentity"] = { "setidentity", "setcontext", "setthreadcontext", "syn.set_thread_identity" },
    ["setupvalue"] = { "debug.setupvalue" },
    ["traceback"] = { "debug.traceback" }
}

local function parseFunc(str)
    local parsed, index = getfenv(), 1
    while parsed and type(parsed) == "table" do
        local dotIndex = str:find("%.")
        parsed = parsed[str:sub(index, dotIndex and dotIndex - 1 or #str - index + 1)]
        if dotIndex then
            str = str:sub(dotIndex + 1)
            index = str:find("%.") or 1
        end
    end
    return type(parsed) == "function" and parsed or false
end

for used, aliases in next, funcs do
    local hasFunc = parseFunc(used) ~= false
    if hasFunc == false then
        for _, alias in next, aliases do
            local parsedFunc = parseFunc(alias)
            if parsedFunc then
                getgenv()[used] = parsedFunc
                hasFunc = true
                break
            end
        end
        if hasFunc == false then
            missing[#missing + 1] = used
        end
    end
end

if #missing > 0 then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "NyaHub",
        Text = "Your executor is not supported. We recommend you use Synapse or Fluxus"
    })
    return
end

--[[ ==========  Game Loader  ========== ]]

local chosenGame = ({
    [292439477] = "phantomforces.lua"
})[game.PlaceId]

if chosenGame then
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/yes-0001/hi/main/NyaHub/Games" .. chosenGame))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "NyaHub",
        Text = "NyaHub does not support this game"
    })
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "NyaHub",
        Text = "Loading Universal UI"
    })
    wait(3)
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/yes-0001/hi/main/NyaHub/guiV2.lua"))()
end



--[[ ==========  Notifications  ========== ]]

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "NyaHub",
    Text = "Loaded successfully"
})