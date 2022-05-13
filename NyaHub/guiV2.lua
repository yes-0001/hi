local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/NewUI", true))()
local freecam = loadstring(game:HttpGet('https://raw.githubusercontent.com/yes-0001/hi/main/hehe/freecam.lua', true))()
-- local Cinematic = loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/hehe/Cinematic.lua"))();

-- https://x.synapse.to/docs/reference/misc.html

-- If any updates come to any of the games in this GUI, I will try my hardest to update them for new bypasses


--[[
-                                    NyaHub

certain scripts for certain games will only show up if you are in that certain game

list of available games (made by me)
  - Ballista [6763893674]
  - Phantom Forces [292439477]
  - The Wild West [2317712696]
  - Universal

along with tons more games in the Gui's tab :D

]]

------------------------------------------------------------------------
-- Settings

local Games = {
    292439477,
    6763893674,
    2317712696
}


local Client = {
    Config = {
        Universal = true -- instead of loading the default Universal UI in every game, if the game is supported it will load the UI for that game
    }
}







------------------------------------------------------------------------
-- stuff I wanna add
--
-- Binoculars
--
--
--
-- Libraries
local a = library:Window("hisup")

local b = a:Tab("Universal")
local c = a:Tab("Camera")

if game.PlaceId == Games then
    _G.d = a:Tab("Games")
end

local e = a:Tab("Gui's")
local f = a:Tab("Misc")

local asdsa = a:Tab("Info")

------------------------------------------------------------------------
c:Button("Camera Zoom",function()
    local camera = workspace.CurrentCamera
    local tween_service = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")

    local function Tween_FOV(value, speed)
        local tween_info = TweenInfo.new(speed, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        local tween = tween_service:Create(camera, tween_info, {FieldOfView = value})
        tween:Play()
    end

    local function Tween_SEN(value, speed)
        local tween_info1 = TweenInfo.new(speed, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        local tween1 = tween_service:Create(UserInputService, tween_info1, {MouseDeltaSensitivity = value})
        tween1:Play()
    end

    UserInputService.InputBegan:connect(function(input)
        if input.KeyCode==Enum.KeyCode.E then
            Tween_FOV(5, 1.5)
            Tween_SEN(0.1, 2)
        end
    end)

    UserInputService.InputEnded:connect(function(input)
        if input.KeyCode==Enum.KeyCode.E then
            Tween_FOV(70, 1.5)
            Tween_SEN(0.96, 2)
        end
    end)
end)

c:Label("How to use")
c:Label("Shift + P to activate")
c:Label("WASD to move")
c:Label("E/Q to go up/down")
c:Label("Alt to speed movement up by 4x")
c:Label("Z to slow movement down by 1/3")
c:Label("Shift to slow movement down by another 1/3")
c:Label("CTRL to slow movement down by 1/5")

f:Label("Press CTRL to toggle this Gui on and off")
f:Button("Discord link",function()
    setclipboard("https://discord.gg/QG4CST8")
end)

------------------------------------------------------------------------

b:Label("Players")

local Players = {}
for _,v in pairs(game.Players:GetPlayers()) do
    table.insert(Players, v.Name)
end

b:Dropdown("Choose a Player",Players,function(selected)
    SelectedPlayerr = selected
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

    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = game.Players[Target].character.HumanoidRootPart.CFrame})

    --Player.character.HumanoidRootPart.CFrame = game.Players[Target].character.HumanoidRootPart.CFrame
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

if game.PlaceId ~= 292439477 then
    b:Slider("Hitbox Size", 5, 50,function(value)
        _G.HeadSize2 = value
    end)

    b:Dropdown("Hitbox part",{"Head","HumanoidRootPart"},function(selected)
        if selected == "HumanoidRootPart" then
            _G.Part = "HumanoidRootPart"
        end
        if selected == "Head" then
            _G.Part = "Head"
        end
    end)

    b:Toggle("Hitbox expander",function(state)-- Variables
        local player = game.Players.LocalPlayer

        if not HeadSize2 then
            HeadSize2 = 10
        end

        if not Part then
            Part = "HumanoidRootPart"
        end

        -- Script
        _G.HeadSize = 0
        _G.Disabled = true

        if state then
            if _G.Disabled then
                while wait(5) do

                    while wait(5) do
                        for i,v in next, game:GetService('Players'):GetPlayers() do
                            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                                pcall(function()
                                    --v.Character.Head.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)
                                    v.Character.Part.Size = Vector3.new(_G.HeadSize2,_G.HeadSize2,_G.HeadSize2)
                        
                                    -- v.Character.Head.Transparency = 1
                                    -- v.Character.HumanoidRootPart.CanCollide = false
                        
                                    v.Character.Part.Transparency = 0.7
                                    v.Character.Part.BrickColor = Color3.fromRGB(54, 117, 184) -- Blue Team: 54, 117, 184 -- Red Team: 135, 49, 49
                                    v.Character.Part.Material = "Neon"
                                    v.Character.Part.CanCollide = false


                                    --[[ ==========  Notifications  ========== ]]

                                    local StarterGui = game:GetService("StarterGui")

                                    StarterGui:SetCore("SendNotification",{
                                        Title = "Hitbox Expander",
                                        Text = "Loaded successfully"
                                    })

                                end)
                            end
                        end
                    end
                end
            end
        end
    end)
end

------------------------------------------------------------------------

b:Label(" ")
b:Label("Movement")

b:Toggle("Infinite Jump",function(bool)
    game:GetService("UserInputService").JumpRequest:connect(function()
        if Client.Player.InfJump then
            if bool then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end
    end)


    -- local Player = game:GetService("Players").LocalPlayer
    -- local Mouse = Player:GetMouse()
    -- Mouse.KeyDown:connect(function(k)
    --     if _G.infinjump then
    --         if k:byte() == 32 then
    --             Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    --             Humanoid:ChangeState("Jumping")
    --             wait(0.1)
    --             Humanoid:ChangeState("Seated")
    --         end
    --     end
    -- end)

    -- local Player = game:GetService("Players").LocalPlayer
    -- local Mouse = Player:GetMouse()
    -- Mouse.KeyDown:connect(function(k)
    --     k = k:lower()
    --     if k == "f" then
    --         if _G.infinjump == true then
    --             _G.infinjump = false
    --         else
    --             _G.infinjump = true
    --         end
    --     end
    -- end)



    --[[ ==========  Notifications  ========== ]]

    local StarterGui = game:GetService("StarterGui")

    StarterGui:SetCore("SendNotification",{
        Title = "Infinite Jump",
        Text = "Loaded successfully"
    })
end)

b:Slider("Speed", 0, 200,function(num)
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = num
end)

b:Slider("JumpHeight", 0, 200,function(num)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = num
end)

b:Slider("Fly Speed", 50, 1000,function(num)
    FlightSpeed = num
end)

b:Button("ToggleFly",function()
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

b:Button("Click TP",function()
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

if game.PlaceId == 6763893674 then

    d:Label("Ballista")

    local hiteveryone = 0

    d:Keybind("hit everyone",Enum.KeyCode.KeypadZero,function()

        if game.PlaceId == 6763893674 then
            if hiteveryone == 0 then

                local StarterGui = game:GetService("StarterGui")

                StarterGui:SetCore("SendNotification",{
                    Title = "Hit Everyone",
                    Text = "Loaded successfully"
                })
                StarterGui:SetCore("SendNotification",{
                    Title = "Hit Everyone",
                    Text = "Press the keybind again to begin :)"
                })
                return hiteveryone + 1
            else
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
            end
        end
    end)

    d:Keybind("Teleport to Mid",Enum.KeyCode.KeypadOne,function()
        if game.PlaceId == 6763893674 then
            hum = game.Players.LocalPlayer.Character.HumanoidRootPart
            
            hum.CFrame = CFrame.new(89.5731735, 1.82997847, 43.8063927)
        end
    end)

    d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
end

if game.PlaceId == 292439477 then
    d:Label("Phantom Forces")

    d:Button("Activate 1",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/yes-0001/hi/main/noob/PhantomForcesCatGirl.lua', true))()


        --[[ ==========  Notifications  ========== ]]

        local StarterGui = game:GetService("StarterGui")

        StarterGui:SetCore("SendNotification",{
            Title = "Dark Hub",
            Text = "Loaded successfully"
        })
    end)

    b:Button("Activate 2", function()
        if getgenv().evov2 then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "EvoV2",
                Text = "EvoV2 has already been executed in this game"
            })
            return
        end

        getgenv().evov2 = true

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
                Title = "EvoV2",
                Text = "Your exploit is not supported. We recommend you use Synapse or Fluxus"
            })
            return
        end

        --[[ ==========  Game Loader  ========== ]]

        loadstring(game:HttpGet("https://projectevo.xyz/script/games/292439477"))()


        --[[ ==========  Notifications  ========== ]]

        local StarterGui = game:GetService("StarterGui")

        StarterGui:SetCore("SendNotification",{
            Title = "EvoV2",
            Text = "Loaded successfully"
        })
    end)

    b:Toggle("Toggle RPK12 burst macro",function(bool)
        if bool then
            UserInputService.InputBegan:connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    keypress(0x01)
                    wait(0.1)
                    keyrelease(0x01)
                end
            end)
        end
    end)

    d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
end

if game.PlaceId == 2317712696 then
    d:Label("The Wild West")

    d:Button("Activate",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/yes-0001/hi/main/noob/TheWildWest.lua', true))()


        --[[ ==========  Notifications  ========== ]]

        local StarterGui = game:GetService("StarterGui")

        StarterGui:SetCore("SendNotification",{
            Title = "YeeHaw",
            Text = "Loaded successfully"
        })
    end)
end

------------------------------------------------------------------------

e:Label("Paid GUI's")

e:Button("Activate Dark Hub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/noob/a.lua", true))() -- Zone Wars

    -- make a choice to do Strucid or Strucid Zone Wars

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



    --[[ ==========  Notifications  ========== ]]

    local StarterGui = game:GetService("StarterGui")

    StarterGui:SetCore("SendNotification",{
        Title = "Dark Hub",
        Text = "Loaded successfully"
    })
end)

e:Button("Activate Luk Hub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/noob/LukHub.lua", true))();

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

    --[[ ==========  Notifications  ========== ]]

    local StarterGui = game:GetService("StarterGui")

    StarterGui:SetCore("SendNotification",{
        Title = "Luk Hub",
        Text = "Loaded successfully"
    })
end)

e:Label(" ")
e:Label("Free")

e:Button("Activate EvoV2",function()

    --[[ ==========  Supported Games  ========== ]]
    -- Bad Business
    -- Phantom Forces
    -- Strucid
    -- Project Lazarus
    -- Jailbreak

    --[[ ==========  Executed Check  ========== ]]

    if getgenv().evov2 then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "EvoV2",
            Text = "EvoV2 has already been executed in this game"
        })
        return
    end

    getgenv().evov2 = true

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
            Title = "EvoV2",
            Text = "Your exploit is not supported. We recommend you use Synapse or Fluxus"
        })
        return
    end

    --[[ ==========  Game Loader  ========== ]]

    local chosenGame = ({
        [3233893879] = "badbusiness.lua",
        [292439477] = "phantomforces.lua",
        [2377868063] = "strucid.lua",
        [443406476] = "projectlaz.lua",
        [606849621] = "jailbreak.lua"
    })[game.PlaceId]

    if chosenGame then
        loadstring(game:HttpGetAsync("https://projectevo.xyz/script/games/" .. chosenGame))()
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "EvoV2",
            Text = "EvoV2 does not support this game"
        })
    end



    --[[ ==========  Notifications  ========== ]]

    local StarterGui = game:GetService("StarterGui")

    StarterGui:SetCore("SendNotification",{
        Title = "EvoV2",
        Text = "Loaded successfully"
    })
end)


------------------------------------------------------------------------


f:Button("Anti-Afk",function()
    -- // LeLz thx IY for using your AntiAfk
    local GC = getconnections or get_signal_cons
    if GC then
        for i,v in pairs(GC(game.Players.LocalPlayer.Idled)) do
            if v["Disable"] then
                v["Disable"](v)
            elseif v["Disconnect"] then
                v["Disconnect"](v)
            end
        end
    else
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end


    --[[ ==========  Notifications  ========== ]]

    local StarterGui = game:GetService("StarterGui")

    StarterGui:SetCore("SendNotification",{
        Title = "Anti-Afk",
        Text = "Loaded successfully"
    })
end)

f:Toggle("RemoteSpy",function(bool)
    if bool then
        _G.scanRemotes = true
        print("on")
    else
        _G.scanRemotes = false
        print("off")
    end
    
    _G.ignoreNames = {
        Event = true;
        MessagesChanged = true;
    }
    
    setreadonly(getrawmetatable(game), false)
    local pseudoEnv = {}
    local gameMeta = getrawmetatable(game)
    
    local tabChar = "      "
    
    local function getSmaller(a, b, notLast)
        local aByte = a:byte() or -1
        local bByte = b:byte() or -1
        if aByte == bByte then
            if notLast and #a == 1 and #b == 1 then
                return -1
            elseif #b == 1 then
                return false
            elseif #a == 1 then
                return true
            else
                return getSmaller(a:sub(2), b:sub(2), notLast)
            end
        else
            return aByte < bByte
        end
    end
    
    local function parseData(obj, numTabs, isKey, overflow, noTables, forceDict)
        local objType = typeof(obj)
        local objStr = tostring(obj)
        if objType == "table" then
            if noTables then
                return objStr
            end
            local isCyclic = overflow[obj]
            overflow[obj] = true
            local out = {}
            local nextIndex = 1
            local isDict = false
            local hasTables = false
            local data = {}
    
            for key, val in next, obj do
                if not hasTables and typeof(val) == "table" then
                    hasTables = true
                end
    
                if not isDict and key ~= nextIndex then
                    isDict = true
                else
                    nextIndex = nextIndex + 1
                end
    
                data[#data+1] = {key, val}
            end
    
            if isDict or hasTables or forceDict then
                out[#out+1] = (isCyclic and "Cyclic " or "") .. "{"
                table.sort(data, function(a, b)
                    local aType = typeof(a[2])
                    local bType = typeof(b[2])
                    if bType == "string" and aType ~= "string" then
                        return false
                    end
                    local res = getSmaller(aType, bType, true)
                    if res == -1 then
                        return getSmaller(tostring(a[1]), tostring(b[1]))
                    else
                        return res
                    end
                end)
                for i = 1, #data do
                    local arr = data[i]
                    local nowKey = arr[1]
                    local nowVal = arr[2]
                    local parseKey = parseData(nowKey, numTabs+1, true, overflow, isCyclic)
                    local parseVal = parseData(nowVal, numTabs+1, false, overflow, isCyclic)
                    if isDict then
                        local nowValType = typeof(nowVal)
                        local preStr = ""
                        local postStr = ""
                        if i > 1 and (nowValType == "table" or typeof(data[i-1][2]) ~= nowValType) then
                            preStr = "\n"
                        end
                        if i < #data and nowValType == "table" and typeof(data[i+1][2]) ~= "table" and typeof(data[i+1][2]) == nowValType then
                            postStr = "\n"
                        end
                        out[#out+1] = preStr .. string.rep(tabChar, numTabs+1) .. parseKey .. " = " .. parseVal .. ";" .. postStr
                    else
                        out[#out+1] = string.rep(tabChar, numTabs+1) .. parseVal .. ";"
                    end
                end
                out[#out+1] = string.rep(tabChar, numTabs) .. "}"
            else
                local data2 = {}
                for i = 1, #data do
                    local arr = data[i]
                    local nowVal = arr[2]
                    local parseVal = parseData(nowVal, 0, false, overflow, isCyclic)
                    data2[#data2+1] = parseVal
                end
                out[#out+1] = "{" .. table.concat(data2, ", ") .. "}"
            end
    
            return table.concat(out, "\n")
        else
            local returnVal = nil
            if (objType == "string" or objType == "Content") and (not isKey or tonumber(obj:sub(1, 1))) then
                local retVal = '"' .. objStr .. '"'
                if isKey then
                    retVal = "[" .. retVal .. "]"
                end
                returnVal = retVal
            elseif objType == "EnumItem" then
                returnVal = "Enum." .. tostring(obj.EnumType) .. "." .. obj.Name
            elseif objType == "Enum" then
                returnVal = "Enum." .. objStr
            elseif objType == "Instance" then
                returnVal = obj.Parent and obj:GetFullName() or obj.ClassName
            elseif objType == "CFrame" then
                returnVal = "CFrame.new(" .. objStr .. ")"
            elseif objType == "Vector3" then
                returnVal = "Vector3.new(" .. objStr .. ")"
            elseif objType == "Vector2" then
                returnVal = "Vector2.new(" .. objStr .. ")"
            elseif objType == "UDim2" then
                returnVal = "UDim2.new(" .. objStr:gsub("[{}]", "") .. ")"
            elseif objType == "BrickColor" then
                returnVal = "BrickColor.new(\"" .. objStr .. "\")"
            elseif objType == "Color3" then
                returnVal = "Color3.new(" .. objStr .. ")"
            elseif objType == "NumberRange" then
                returnVal = "NumberRange.new(" .. objStr:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")"
            elseif objType == "PhysicalProperties" then
                returnVal = "PhysicalProperties.new(" .. objStr .. ")"
            else
                returnVal = objStr
            end
            return returnVal
        end
    end
    
    function tableToString(t)
        return parseData(t, 0, false, {}, nil, false)
    end
    
    local detectClasses = {
        BindableEvent = true;
        BindableFunction = true;
        RemoteEvent = true;
        RemoteFunction = true;
    }
    
    local classMethods = {
        BindableEvent = "Fire";
        BindableFunction = "Invoke";
        RemoteEvent = "FireServer";
        RemoteFunction = "InvokeServer";
    }
    
    local realMethods = {}
    
    for name, enabled in next, detectClasses do
        if enabled then
            realMethods[classMethods[name]] = Instance.new(name)[classMethods[name]]
        end
    end
    
    for key, value in next, gameMeta do pseudoEnv[key] = value end
    
    local incId = 0
    
    local function getValues(self, key, ...)
        return {realMethods[key](self, ...)}
    end
    
    gameMeta.__index, gameMeta.__namecall = function(self, key)
        if not realMethods[key] or _G.ignoreNames[self.Name] or not _G.scanRemotes then return pseudoEnv.__index(self, key) end
        return function(_, ...)
            incId = incId + 1
            local nowId = incId
            local strId = "[RemoteSpy_" .. nowId .. "]"
    
            local allPassed = {...}
            local returnValues = {}
    
            local ok, data = pcall(getValues, self, key, ...)
    
            local TIME_ZONE = -7
    
            local date = os.date("!*t")
            local hour = (date.hour + TIME_ZONE) % 24
            local seconds = date.sec
            local ampm = hour < 12 and "AM" or "PM"
            local timestamp = string.format("%02i:%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, seconds, ampm)
    
            if ok then
                if bool then
                    rconsoleprint('@@RED@@')
                    returnValues = data
                    rconsoleprint("\n" .. timestamp .. " - " .. strId .. " ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\n" .. strId .. " Packed Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: " .. tableToString(returnValues) .. "\n")
                    
                    rconsoleprint('@@WHITE@@')
                    local a = rconsoleinput()
    
                    if a == "clear" then
                        rconsoleclear()
                        rconsoleprint('@@WHITE@@')
                        rconsoleprint('\nRemoteSpy\n    - "clear" to clear the console\n    - "stop" to stop the RemoteSpy\n    - "resume" or "return" to resume the RemoteSpy\n')
                    end
                    if a == "stop" then
                        bool = false
                    end
                    if a == "resume" then
                        bool = true
                    end
                    if a == "return" then
                        bool = true
                    end
                end
            else
                if bool then
                    rconsoleprint('@@RED@@')
                    rconsoleprint("\n" .. timestamp .. " - " .. strId .. " ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\n" .. strId .. " Packed Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: [ERROR] " .. data .. "\n")
                    
                    rconsoleprint('@@WHITE@@')
                    local a = rconsoleinput()
    
                    if a == "clear" then
                        rconsoleclear()
                        rconsoleprint('@@WHITE@@')
                        rconsoleprint('\nRemoteSpy\n    - "clear" to clear the console\n    - "stop" to stop the RemoteSpy\n    - "resume" to resume the RemoteSpy\n')
                    end
                    if a == "stop" then
                        bool = false
                    end
                    if a == "resume" then
                        bool = true
                    end
                    if a == "return" then
                        bool = true
                    end
                end
            end
    
            return unpack(returnValues)
        end
    end
    
    if bool then
        rconsolename("RemoteSpy")
        rconsoleprint('\nRemoteSpy\n    - "clear" to clear the console\n    - "stop" to stop the RemoteSpy\n    - "resume" to resume the RemoteSpy\n')
    end



    --[[ ==========  Notifications  ========== ]]

    local StarterGui = game:GetService("StarterGui")

    StarterGui:SetCore("SendNotification",{
        Title = "RemoteSpy",
        Text = "Loaded successfully"
    })
end)