local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local freecam = loadstring(game:HttpGet('https://pastebin.com/raw/yD0uXTQb', true))()

-- https://x.synapse.to/docs/reference/misc.html

-- If any updates come to any of the games in this GUI, I will try my hardest to update them for new bypasses
-- Games I focus on most: Ballistia


------------------------------------------------------------------------
-- Settings

_G.Ballistia = false
_G.HitboxExpander = true









------------------------------------------------------------------------
-- stuff I wanna add
--
-- Binoculars
--
--
--
-- Libraries
local AG = library:CreateWindow("All Games")
local SG = library:CreateWindow("Other")
local PG = library:CreateWindow("Paid Gui's")

-- Folders
local aa = AG:CreateFolder("Info")
local a = AG:CreateFolder("Freecam")
local b = AG:CreateFolder("Players")
local c = AG:CreateFolder("Movement")


local yo = SG:CreateFolder("Any game")
local a1 = SG:CreateFolder("Phantom Forces")
local a2 = SG:CreateFolder("Ballistia")
local a3 = SG:CreateFolder("The Wild West")
local a4 = SG:CreateFolder("Stay Alive and Flex Your Time")
local a5 = SG:CreateFolder("Decaying Winter")

local wefuj = PG:CreateFolder("DarkHub")
local efdas = PG:CreateFolder("LukHub")


wefuj:Button("Activate Dark Hub",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/nTjPrEU6", true))()

    -- Supported Games
    -- AceOfSpadez
    -- Anomic
    -- Arsenal
    -- Bad Business
    -- Base Battles
    -- Big Paintball
    -- Break In
    -- Broken Bones IV
    -- Silly's Difficulty Chart Obby
    -- Clicker Simulator
    -- CounterBlox
    -- Critical Legends
    -- Da Hood
    -- Hellreaver
    -- Horrific Housing
    -- Jailbreak
    -- Legends of Speed
    -- Literally FNF
    -- Murder Mystery 2
    -- Meepcity
    -- No Scope Sniping
    -- Noteriety
    -- Pet Story
    -- Phantom Forces
    -- Project Lazarus
    -- Rolling Thunder & Rolling Thunder PVE
    -- Tower Of Hell
    -- Trenches
    -- Weaponry
    -- Strucid
    -- Universal
end)

efdas:Button("Activate Luk Hub",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/whpE9JkU"))();

    -- Supported Games (this gui is pretty outdated so use at your own risk)
    -- Galaxy
    -- Jailbreak
    -- Phantom Forces
    -- Arsenal
    -- Big Paintball
    -- Breaking point (Script is down for NOW)
    -- Flex your time on others
    -- Counter blox
    -- Strucid
    -- Murder Mystery 2
    -- Flee the facility
    -- Speedrun 4
    -- Ninja Legends
    -- Islands (skyblock)
    -- Welcome to Bloxburg
    -- Dragon Adventures
    -- Lumber Tycoon 2
    -- Prison life
    -- Recoil
    -- ToweR of Hell
    -- Project Lazarus
    -- Mad City
    -- Universal
end)

------------------------------------------------------------------------
-- Labels
aa:Label("ACutieCatGirl's GUI",{
    TextSize = 15;
    TextColor = Color3.fromRGB(0,0,0);
    BgColor = Color3.fromRGB(255, 204, 230);
})
aa:Label("Press CTRL to toggle this Gui on and off",{
    TextSize = 15;
    TextColor = Color3.fromRGB(0,0,0);
    BgColor = Color3.fromRGB(255, 204, 230);
})
aa:Button("Discord Link",function()
    setclipboard("https://discord.gg/QG4CST8")
end)
-- aa:Label("https://discord.gg/QG4CST8",{
--     TextSize = 15;
--     TextColor = Color3.fromRGB(0,0,0);
--     BgColor = Color3.fromRGB(255, 204, 230);
-- })

------------------------------------------------------------------------

a:Label("Shift + P to activate",{
    TextSize = 25;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(114,137,218);
})
a:Label("WASD to move",{
    TextSize = 20;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(114,137,218);
})
a:Label("EQ to go up and down",{
    TextSize = 20;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(114,137,218);
})
a:Label("Alt to Speed up movement by 4x",{
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(114,137,218);
})
a:Label("Z to slow movement down by 1/3",{
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(114,137,218);
})
a:Label("Shift to slow movement down by another 1/3",{
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(114,137,218);
})
a:Label("CTRL to slow movement down by 1/5",{
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(114,137,218);
})



-- Scripts
------------------------------------------------------------------------

yo:Bind("Teleport to Mid",Enum.KeyCode.J,function()
    -- 89.5731735, 5.82997847, 43.8063927, 0.971392095, 0, 0.237481445, 0, 1, 0, -0.237481445, 0, 0.971392095

    plr = game.Players.LocalPlayer
    hum = plr.Character.HumanoidRootPart

    
    hum.CFrame = CFrame.new(89.5731735, 5.82997847 - 5, 43.8063927)
end)

if _G.HitboxExpander then
    yo:Slider("Hitbox Size",{
        min = 5;
        max = 50;
        precise = false;
    },function(value)
        _G.HeadSize2 = value
    end)

    if game.PlaceId ~= 292439477 then
        yo:Bind("Hitbox expander",Enum.KeyCode.T,function()
            -- Variables
            local player = game.Players.LocalPlayer

            -- Script
            _G.HeadSize = 0
            _G.Disabled = true

            if _G.Disabled then
                while wait(5) do

                    while wait(5) do
                        for i,v in next, game:GetService('Players'):GetPlayers() do
                            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                                pcall(function()
                                    --v.Character.Head.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)
                                    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)
                        
                                    -- v.Character.Head.Transparency = 1
                                    -- v.Character.HumanoidRootPart.CanCollide = false
                        
                                    v.Character.HumanoidRootPart.Transparency = 0.7
                                    v.Character.HumanoidRootPart.BrickColor = Color3.fromRGB(54, 117, 184) -- Blue Team: 54, 117, 184 -- Red Team: 135, 49, 49
                                    v.Character.HumanoidRootPart.Material = "Neon"
                                    v.Character.HumanoidRootPart.CanCollide = false
                                end)
                            end
                        end
                    end

                    -- make your hitboxes small so it's harder to hit you with arrows
                    -- for i,v in next, game:GetService('Players'):GetPlayers() do
                    --     if v.Name == game:GetService('Players').LocalPlayer.Name then
                    --         pcall(function()
                    --             v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             v.Character.Humanoid.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                                
                    --             v.Character.LeftUpperArm.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             v.Character.LeftLowerArm.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             v.Character.LeftHand.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             v.Character.RightUpperArm.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             v.Character.RightLowerArm.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             v.Character.RightHand.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --         end)
                    --     end
                    -- end

                    -- -- make everybody on the other team have big hitboxes so you can hit them easily
                    -- local myTeam = game:GetService("Players").LocalPlayer.Team
                    -- for i,v in next, game:GetService('Players'):GetPlayers() do
                    --     if v.Team ~= myTeam then
                    --         if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    --             pcall(function()
                    --                 --v.Character.Head.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)
                    --                 v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)

                    --                 v.Character.Head.Transparency = 1
                    --                 v.Character.HumanoidRootPart.CanCollide = false

                    --                 v.Character.HumanoidRootPart.Transparency = 0.7
                    --                 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    --                 v.Character.HumanoidRootPart.Material = "Neon"
                    --                 v.Character.HumanoidRootPart.CanCollide = false

                    --             end)
                    --         end

                    --     else
                    --         -- make all team mates have smallest hitbox so you can shoot through them easier
                    --         if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    --             pcall(function()
                    --                 v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --                 v.Character.Humanoid.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             end)
                    --         end
                    --     end
                    -- end

                    -- local myTeam = game:GetService("Players").LocalPlayer.Team
                    -- for i,v in next, game:GetService('Players'):GetPlayers() do
                    --     if not v.Team then
                    --         if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    --             pcall(function()
                    --                 --v.Character.Head.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)
                    --                 v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)

                    --                 v.Character.Head.Transparency = 1
                    --                 v.Character.HumanoidRootPart.CanCollide = false

                    --                 v.Character.HumanoidRootPart.Transparency = 0.7
                    --                 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    --                 v.Character.HumanoidRootPart.Material = "Neon"
                    --                 v.Character.HumanoidRootPart.CanCollide = false
                    --             end)
                    --         end
                    --     end
                    -- end

                    -- make all team mates have smallest hitbox so you can shoot through them easier
                    -- for i,v in next, game:GetService('Players'):GetPlayers() do
                    --     if v.Team == myTeam then
                    --         if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    --             pcall(function()
                    --                 v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --                 v.Character.Humanoid.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    --             end)
                    --         end
                    --     end
                    -- end
                end
            end
        end)
    end
end

------------------------------------------------------------------------

a1:Button("Activate Hack Gui 1",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/8KHFpex7', true))()
end)

a1:Button("Activate Hack Gui 2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/phantom-forces-chams/main/main.lua"))()
end)

------------------------------------------------------------------------

if _G.Ballistia then
    a2:Bind("hit everyone",Enum.KeyCode.period,function()
        local me = game.Players.LocalPlayer-- variable

        -- only works with archer
        -- make sure you do this for only a short amount of time and in small servers (30 or less) in order to be less likely to get banned

        while true do
            for _,v in pairs(game.Players:GetPlayers()) do
                if v.Name ~= me and v.Character then
                    local A_1 = v.Character.Head
                    local A_2 = Vector3.new()
                    local A_3 = Vector3.new()
                    local A_4 = nil
                    local Event = game:GetService("ReplicatedStorage").Knit.Services.CombatService.RE.PartHit
                    Event:FireServer(A_1, A_2, A_3, A_4)
                end
            end
        end

    end)
end


------------------------------------------------------------------------

a3:Button("Activate Hack GUI",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/e6zvw8mH', true))()
end)

------------------------------------------------------------------------

a4:Button("Activate Hack GUI",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/stay-alive-and-flex-time/main/main.lua', true))()
end)

------------------------------------------------------------------------

a5:Button("Activate Hack GUI",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Aidez/decaying_winter/main/GOODWILL_COMMAND_SCRIPT'),true))()
end)

------------------------------------------------------------------------

local SelectedPlayer = b:Dropdown("Choose a Player",{game.Players:GetPlayers()[1], game.Players:GetPlayers()[2], game.Players:GetPlayers()[3], game.Players:GetPlayers()[4], 
    game.Players:GetPlayers()[5], game.Players:GetPlayers()[6], game.Players:GetPlayers()[7], game.Players:GetPlayers()[8], game.Players:GetPlayers()[9], game.Players:GetPlayers()[10], 
    game.Players:GetPlayers()[11], game.Players:GetPlayers()[12], game.Players:GetPlayers()[13], game.Players:GetPlayers()[14], game.Players:GetPlayers()[15], 
    game.Players:GetPlayers()[16], game.Players:GetPlayers()[17], game.Players:GetPlayers()[18], game.Players:GetPlayers()[19], game.Players:GetPlayers()[20], 
    game.Players:GetPlayers()[21], game.Players:GetPlayers()[22], game.Players:GetPlayers()[23], game.Players:GetPlayers()[24], game.Players:GetPlayers()[25], 
    game.Players:GetPlayers()[26], game.Players:GetPlayers()[27], game.Players:GetPlayers()[28], game.Players:GetPlayers()[29], game.Players:GetPlayers()[30], 
    game.Players:GetPlayers()[31], game.Players:GetPlayers()[32], game.Players:GetPlayers()[33], game.Players:GetPlayers()[34], game.Players:GetPlayers()[35], 
    game.Players:GetPlayers()[36], game.Players:GetPlayers()[37], game.Players:GetPlayers()[38], game.Players:GetPlayers()[39], game.Players:GetPlayers()[40], 
    game.Players:GetPlayers()[41], game.Players:GetPlayers()[42], game.Players:GetPlayers()[43], game.Players:GetPlayers()[44], game.Players:GetPlayers()[45], 
    game.Players:GetPlayers()[46], game.Players:GetPlayers()[47], game.Players:GetPlayers()[48], game.Players:GetPlayers()[49], game.Players:GetPlayers()[50]},true,function(value)
        SelectedPlayerr = value
    end)

b:Toggle("Spectate Player",function(bool)
    -- game:GetService("Players").LocalPlayer.PlayerGui.SpectateGui
    Player = game.Players.LocalPlayer
    character = workspace:WaitForChild(Player.name)
    Target = SelectedPlayerr

    if bool then
            game.Workspace.CurrentCamera.CameraSubject = game.Players[Target].character.Humanoid
    else
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.character.Humanoid
    end
end)

b:Button("Teleport to Player",function()
    local Target
    local character
    local Player
    Player = game.Players.LocalPlayer
    character = workspace:WaitForChild(Player.name)
    Target = SelectedPlayerr
    Player.character.HumanoidRootPart.CFrame = game.Players[Target].character.HumanoidRootPart.CFrame
end)

-- b:Bind("Hit Player",Enum.KeyCode.I,function()
--     local A_1 = game.Players[SelectedPlayerr].Character.Head
--     local A_2 = Vector3.new()
--     local A_3 = Vector3.new()
--     local A_4 = nil
--     local Event = game:GetService("ReplicatedStorage").Knit.Services.CombatService.RE.PartHit
--     Event:FireServer(A_1, A_2, A_3, A_4)
-- end)

b:Button("Toggle ESP",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua', true))()
end)

------------------------------------------------------------------------

c:Toggle("Infinite Jump",function(bool)
    if bool then
        _G.infinjump = true
    else
        _G.infinjump = false
    end

    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    Mouse.KeyDown:connect(function(k)
        if _G.infinjump then
            if k:byte() == 32 then
                Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                Humanoid:ChangeState("Jumping")
                wait(0.1)
                Humanoid:ChangeState("Seated")
            end
        end
    end)

    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    Mouse.KeyDown:connect(function(k)
        k = k:lower()
        if k == "f" then
            if _G.infinjump == true then
                _G.infinjump = false
            else
                _G.infinjump = true
            end
        end
    end)
end)

c:Box("Player Speed (default: 16)","number",function(value) -- "number" or "string"
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

c:Box("Player JumpHeight (default: 50)","number",function(value) -- "number" or "string"
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)

c:Slider("Fly Speed",{
    min = 50;
    max = 1000;
    precise = false;
},function(value)
    FlightSpeed = value
end)

c:Button("ToggleFly (v)",function()
    local FlyKey = Enum.KeyCode.V
    local SpeedKey = Enum.KeyCode.LeftControl
    local SpeedKeyMultiplier = 3
    local FlightAcceleration = 4
    local TurnSpeed = 16
    local UserInputService = game:GetService("UserInputService")
    local StarterGui = game:GetService("StarterGui")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local User = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local UserCharacter = nil
    local UserRootPart = nil
    local Connection = nil

    if not FlightSpeed then
        FlightSpeed = 250
    end

    workspace.Changed:Connect(function()
        Camera = workspace.CurrentCamera
    end)

    local setCharacter = function(c)
        UserCharacter = c
        UserRootPart = c:WaitForChild("HumanoidRootPart")
    end

    User.CharacterAdded:Connect(setCharacter)
    if User.Character then
        setCharacter(User.Character)
    end

    local CurrentVelocity = Vector3.new(0,0,0)
    local Flight = function(delta)
        local BaseVelocity = Vector3.new(0,0,0)
        if not UserInputService:GetFocusedTextBox() then
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
            end
            if UserInputService:IsKeyDown(SpeedKey) then
                BaseVelocity = BaseVelocity * SpeedKeyMultiplier
            end
        end
        if UserRootPart then
            local car = UserRootPart:GetRootPart()
            if car.Anchored then return end
            if not isnetworkowner(car) then return end
            CurrentVelocity = CurrentVelocity:Lerp(
                BaseVelocity,
                math.clamp(delta * FlightAcceleration, 0, 1)
            )
            car.Velocity = CurrentVelocity + Vector3.new(0,2,0)
            if car ~= UserRootPart then
                car.RotVelocity = Vector3.new(0,0,0)
                car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                    car.Position,
                    car.Position + CurrentVelocity + Camera.CFrame.LookVector
                ), math.clamp(delta * TurnSpeed, 0, 1))
            end
        end
    end

    UserInputService.InputBegan:Connect(function(userInput,gameProcessed)
        if gameProcessed then
            return
        end
        if userInput.KeyCode == FlyKey then
            if Connection then
                StarterGui:SetCore("SendNotification",{
                    Title = "fly",
                    Text = "Flight disabled"
                })
                Connection:Disconnect()
                Connection = nil
            else
                StarterGui:SetCore("SendNotification",{
                    Title = "fly",
                    Text = "Flight enabled"
                })
                CurrentVelocity = UserRootPart.Velocity
                Connection = RunService.Heartbeat:Connect(Flight)
            end
        end
    end)

    StarterGui:SetCore("SendNotification",{
        Title = "fly",
        Text = "Loaded successfully"
    })
    StarterGui:SetCore("SendNotification",{
        Title = "fly",
        Text = "Press V to toggle fly"
    })
end)

c:Button("Click TP (c)",function()
    local plr = game.Players.LocalPlayer
    local hum = plr.Character.HumanoidRootPart
    local mouse = plr:GetMouse()
    local StarterGui = game:GetService("StarterGui")

    mouse.KeyDown:connect(function(key)
        if key == "c" then
            if mouse.Target then
                hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
            end
        end
    end)

    StarterGui:SetCore("SendNotification",{
        Title = "Click TP",
        Text = "Press C to use"
    })
end)

------------------------------------------------------------------------
-- Loops
while wait(1) do
    SelectedPlayer:Refresh({game.Players:GetPlayers()[1], game.Players:GetPlayers()[2], game.Players:GetPlayers()[3], game.Players:GetPlayers()[4], 
    game.Players:GetPlayers()[5], game.Players:GetPlayers()[6], game.Players:GetPlayers()[7], game.Players:GetPlayers()[8], game.Players:GetPlayers()[9], game.Players:GetPlayers()[10], 
    game.Players:GetPlayers()[11], game.Players:GetPlayers()[12], game.Players:GetPlayers()[13], game.Players:GetPlayers()[14], game.Players:GetPlayers()[15], 
    game.Players:GetPlayers()[16], game.Players:GetPlayers()[17], game.Players:GetPlayers()[18], game.Players:GetPlayers()[19], game.Players:GetPlayers()[20], 
    game.Players:GetPlayers()[21], game.Players:GetPlayers()[22], game.Players:GetPlayers()[23], game.Players:GetPlayers()[24], game.Players:GetPlayers()[25], 
    game.Players:GetPlayers()[26], game.Players:GetPlayers()[27], game.Players:GetPlayers()[28], game.Players:GetPlayers()[29], game.Players:GetPlayers()[30], 
    game.Players:GetPlayers()[31], game.Players:GetPlayers()[32], game.Players:GetPlayers()[33], game.Players:GetPlayers()[34], game.Players:GetPlayers()[35], 
    game.Players:GetPlayers()[36], game.Players:GetPlayers()[37], game.Players:GetPlayers()[38], game.Players:GetPlayers()[39], game.Players:GetPlayers()[40], 
    game.Players:GetPlayers()[41], game.Players:GetPlayers()[42], game.Players:GetPlayers()[43], game.Players:GetPlayers()[44], game.Players:GetPlayers()[45], 
    game.Players:GetPlayers()[46], game.Players:GetPlayers()[47], game.Players:GetPlayers()[48], game.Players:GetPlayers()[49], game.Players:GetPlayers()[50]})
end
