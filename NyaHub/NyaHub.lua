--[[
███╗   ██╗██╗   ██╗ █████╗ ██╗  ██╗██╗   ██╗██████╗ 
████╗  ██║╚██╗ ██╔╝██╔══██╗██║  ██║██║   ██║██╔══██╗
██╔██╗ ██║ ╚████╔╝ ███████║███████║██║   ██║██████╔╝
██║╚██╗██║  ╚██╔╝  ██╔══██║██╔══██║██║   ██║██╔══██╗
██║ ╚████║   ██║   ██║  ██║██║  ██║╚██████╔╝██████╔╝
╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝
]]

--[[ ==========  Settings  ========== ]]

local Version = "v1.0" -- do not change
local CheckVersion = true


if CheckVersion then
    local CV = game:GetService('HttpService'):JSONDecode("https://raw.githubusercontent.com/yes-0001/hi/main/NyaHub/CurrentVersion.txt")

    if CV.Version ~= Version then
        -- Remove roblox buttons
        local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if playergui then
            for _, gui in pairs(playergui:GetChildren()) do
                if gui:IsA("ScreenGui") and gui.Enabled then
                    screenGuis[#screenGuis + 1] = gui
                    gui.Enabled = false
                    game:GetService("CoreGui").ThemeProvider.TopBarFrame.LeftFrame.MenuIcon.Visible = false
                end
            end
        end
        
        -- Create white screen
        local closer = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        closer.Name = "closer"
        closer.Parent = game.CoreGui
        closer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Frame.Parent = closer
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.Position = UDim2.new(-0.0232732724, 0, -0.0404907987, 0)
        Frame.Size = UDim2.new(0, 5000, 0, 5000)
        
        -- Crash game
        spawn(function()
            wait(0.5)
            while true do end
        end)
        
        -- Fake messagebox
        messagebox("NyaHub is not currently updated. Please wait for an update to release.", "NyaHub", 0x10)
    else
        print("You are on the current version :)")
    end
end



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