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


local Version = "v1.0" -- do not change
local CheckVersion = true -- checks if your version is outdated, if it is outdated it will kick you until you update, make this false if you want a possibly broken script


if CheckVersion then
    local Response = syn.request({
        Url = "https://raw.githubusercontent.com/yes-0001/hi/main/NyaHub/CurrentVersion.txt",
        Method = "GET"
    })

    local data = Response.Body


    if data:find(Version) then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/yes-0001/hi/main/NyaHub/NyaHub.lua"))()
    else
        game:GetService("CoreGui").ThemeProvider:Remove()
        game:GetService("CoreGui").PlayerList:Remove()
        game:GetService("CoreGui").RobloxGui:Remove()


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
        
        -- Fake messagebox
        game.Players.LocalPlayer:Kick("NyaHub is not currently updated. Please wait for an update to release.")
        return
    end
end