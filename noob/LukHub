local http_request = http_request
http_request = syn.request

local HttpServ = game:GetService('HttpService')


    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("ImageLabel")
    local TextLabel = Instance.new("TextLabel")
    local TextLabel2 = Instance.new("TextLabel")
    local GameSearch = Instance.new("TextLabel")
    local Coolthing = Instance.new("TextLabel")
    local Gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    
    ScreenGui.Parent = game.CoreGui
    
    Frame.Name = "Frame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1.000
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(0, 0, 0, 0)
    Frame.Image = "rbxassetid://3570695787"
    Frame.ImageColor3 = Color3.fromRGB(35, 35, 35)
    Frame.ScaleType = Enum.ScaleType.Slice
    Frame.SliceCenter = Rect.new(100, 100, 100, 100)
    Frame.SliceScale = 0.120
    Frame.Visible = false
    
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TextLabel.BackgroundTransparency = 0
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.5, -(8 / 2), 0.5, -(8 / 2))
    TextLabel.Size = UDim2.new(0, 8, 0, 8)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 0
    TextLabel.Text = "LukHub"
    TextLabel.Visible = false
    
    TextLabel2.Parent = Frame
    TextLabel2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TextLabel2.BackgroundTransparency = 0
    TextLabel2.BorderSizePixel = 0
    TextLabel2.Position = UDim2.new(0.5, -(8 / 2), 0.5, -(1 / 2))
    TextLabel2.Size = UDim2.new(0, 8, 0, 8)
    TextLabel2.Font = Enum.Font.SourceSans
    TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel2.TextSize = 16
    TextLabel2.Text = "Welcome"
    TextLabel2.Visible = false
    
    Coolthing.Name = "Coolthing"
    Coolthing.Parent = Frame
    Coolthing.BackgroundColor3 = Color3.fromRGB(252, 132, 3)
    Coolthing.Position = UDim2.new(0.5, -(190 / 2), 0.5, -(40 / 2))
    Coolthing.Size = UDim2.new(0, 0, 0, 1)
    Coolthing.Font = Enum.Font.SourceSans
    Coolthing.Text = ""
    Coolthing.TextColor3 = Color3.fromRGB(252, 132, 3)
    Coolthing.TextSize = 14.000
    Coolthing.Visible = false
    Coolthing.BorderSizePixel = 0
    
    
    --------------------------[[OPENING]]--------------------------
    
    Frame.Visible = true
    Frame:TweenSize(UDim2.new(0, 190, 0, 60))
    Frame:TweenPosition(UDim2.new(0.5, -(190 / 2), 0.5, -(60 / 2)))
    
    TextLabel.Visible = true
    
    for i = 1, 30, 2 do
        TextLabel.TextSize = TextLabel.TextSize + 2
        wait()
    end
    
    wait(2)
    --------------------------[[Moving Up]]--------------------------
    Frame:TweenSize(UDim2.new(0, 190, 0, 100))
    Frame:TweenPosition(UDim2.new(0.5, -(190 / 2), 0.5, -(100 / 2)))
    TextLabel:TweenPosition(UDim2.new(0.5, -(8 / 2), 0.5, -(77 / 2)))
    
    for i = 1, 20, 2 do
        TextLabel.TextSize = TextLabel.TextSize - 1
        wait()
    end
    
    wait(0.4)
    
    Coolthing.Visible = true
    Coolthing:TweenSize(UDim2.new(0, 190, 0, 1))
    
    --------------------------[[Time for Script]]--------------------------
    TextLabel2.Visible = true
    
    wait(1.5)
    
    TextLabel2.Text = "Finding Game"
    wait(0.3)
    TextLabel2.Text = "Finding Game."
    wait(0.3)
    TextLabel2.Text = "Finding Game.."
    wait(0.3)
    TextLabel2.Text = "Finding Game..."
    
    TextLabel2.Text = "Found game: "..Gamename
    
    wait(1.5)
    
    TextLabel2.Text = "Loading Script"
    
    wait(1.5)
    
    TextLabel2.Visible = false
    --------------------------[[Moving down]]--------------------------
    
    Coolthing:TweenSize(UDim2.new(0, 0, 0, 1))
    wait(0.8)
    Coolthing.Visible = false
    
    Frame:TweenSize(UDim2.new(0, 190, 0, 60))
    Frame:TweenPosition(UDim2.new(0.5, -(190 / 2), 0.5, -(60 / 2)))
    TextLabel:TweenPosition(UDim2.new(0.5, -(8 / 2), 0.5, -(8 / 2)))
    
    for i = 1, 20, 2 do
        TextLabel.TextSize = TextLabel.TextSize + 1
        wait()
    end
    
    wait(1)
    
    Frame:TweenSize(UDim2.new(0, 0, 0, 0))
    Frame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0))
    
    for i = 1, 30, 2 do
        TextLabel.TextSize = TextLabel.TextSize - 2
        wait()
    end
    
    TextLabel.Visible = false
    wait(0.4)
    
    ScreenGui:Destroy()

   


--[[ local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0
local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
ScreenGui.Parent = game.CoreGui
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, -(500 / 2), 0.5, -(400 / 2))
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 500,0, 400)
ImageLabel.Image = "http://www.roblox.com/asset/?id=5778744353"  Themes

    Regular : 5354778045
    Halloween : 5778744381 - 5778744353

ImageLabel.ImageTransparency = 1

for i = 1, 50, 2 do
    blur.Size = i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.2
    wait()
end
wait(0.2)

for i = 1, 50, 2 do
    blur.Size = 50 - i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.2
    wait()
end
blur:Destroy()
ScreenGui:Destroy()
wait(0.3)

]]

if isfolder and makefolder and isfile and writefile then
	if not isfolder("LukHub") then makefolder("LukHub") end
	if not isfile("LukHub/Terms of Service.txt") then writefile("LukHub/Terms of Service.txt",
[[
Must agree with ToS before using my script.

1. Any bans are not our responsability.
2. The script may be discontinued at any time.
3. You agree with us logging your the game you execute in

Thanks for using LukHub, if you experience any problems dm me Lukie#8618 
]]) 
    end
end

if game.PlaceId == 200330616 then --galaxy
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Galaxy.lua", true))()
elseif game.PlaceId == 245936354 then --galaxy
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Galaxy.lua", true))()
elseif game.PlaceId == 302359564 then --galaxy
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Galaxy.lua", true))()
elseif game.PlaceId == 286090429 then --arsenal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Arsenal.lua", true))()
elseif game.PlaceId == 301549746 then --Counter Blox
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/CounterBlox.lua", true))()
elseif game.PlaceId == 1869597719 then --Counter Blox Deathmatch
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/CounterBlox.lua", true))()
elseif game.PlaceId == 1480424328 then --Counter Blox compedative unranked
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/CounterBlox.lua", true))()
elseif game.PlaceId == 335132309 then --Murder Mystery 2 hardcore
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/MurderMystery2.lua", true))()
elseif game.PlaceId == 142823291 then --Murder Mystery 2
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/MurderMystery2.lua", true))()
elseif game.PlaceId == 636649648 then --Murder Mystery 2 assasing
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/MurderMystery2.lua", true))()
elseif game.PlaceId == 893973440 then --Flee Facility
    loadstring(game:HttpGet("https://pastebin.com/raw/y8Cm2zLp"))()
elseif game.PlaceId == 183364845 then --speedrun
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Speedrun4.lua", true))()
elseif game.PlaceId == 5278850819 then --flex time
    loadstring(game:HttpGet("https://pastebin.com/raw/k8qNThn0"))()
elseif game.PlaceId == 3956818381 then --Ninja legends
    loadstring(game:HttpGet("https://pastebin.com/raw/ZzfSpq9r"))()
elseif game.PlaceId == 292439477 then --Pf
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/PhantomForces.lua", true))()
elseif game.PlaceId == 3475397644 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/DragonAdventures.lua", true))()
elseif game.PlaceId == 3475419198 then --dragon adventures 1 and 2
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/DragonAdventures.lua", true))()
elseif game.PlaceId == 13822889 then --lumber tycoon 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/LumberTycoon2.lua", true))()
elseif game.PlaceId == 155615604 then --prison life
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/PrisonLife.lua", true))()
elseif game.PlaceId == 2377868063 then --strucid
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Strucid.lua", true))()
elseif game.PlaceId == 3606833500 then --strucid
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Strucid.lua", true))()
elseif game.PlaceId == 2633045061 then --strucid
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Strucid.lua", true))()
elseif game.PlaceId == 2674164583 then --strucid
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Strucid.lua", true))()
elseif game.PlaceId == 4872321990 then --Skyblock
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/SkyBlock.lua", true))()
elseif game.PlaceId == 2218671952 then --Recoil
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Recoil.lua", true))()
elseif game.PlaceId == 4651779470 then --Recoil
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/Recoil.lua", true))()
elseif game.PlaceId == 443406476 then --Project Lazarus
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/ProjectLazarus.lua", true))()
elseif game.PlaceId == 1962086868 then --tower of hell
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/ToweofHell.lua", true))()
elseif game.PlaceId == 2127551566 then --tower of hell
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/ToweofHell.lua", true))()
elseif game.PlaceId == 3582763398 then --tower of hell
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/ToweofHell.lua", true))()
elseif game.PlaceId == 3527629287 then --Big paintball
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BigPaintball.lua", true))()
elseif game.PlaceId == 648362523 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 834829150 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 1410026010 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 1426048327 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 901462028 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 694768217 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 834827615 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 987684187 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 1436726276 then -- breakingpoint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BreakingPoint.lua", true))()
elseif game.PlaceId == 185655149 then -- welcome to bloxburg
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BloxBurg.lua", true))()
elseif game.PlaceId == 4491408735 then -- welcome to bloxburg
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BloxBurg.lua", true))()
elseif game.PlaceId == 914010731 then -- RoGhoul
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/RoGhoul.lua", true))()
elseif game.PlaceId == 2512643572 then -- Bubblegumsim
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/BubbleGumSim.lua", true))()
elseif game.PlaceId == 171391948 then -- vehicle sim
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/VehicleSim.lua", true))()
elseif game.PlaceId == 4410049285 then -- Driving sim
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/DrivingSim.lua", true))()
elseif game.PlaceId == 402122991 then -- Driving sim
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/RedwoordPrison.lua", true))()
elseif game.GameId == 224422602 then -- elemental battleground
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/ElementalBattlegrounds.lua", true))()
elseif game.PlaceId == 566399244 then -- elemental battleground
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/ElementalBattlegrounds.lua", true))()
else -- universal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukieiscool/LukHub/master/universal.lua", true))()
end