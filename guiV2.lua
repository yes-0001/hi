local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/NewUI"))()
local freecam = loadstring(game:HttpGet('https://raw.githubusercontent.com/yes-0001/hi/main/hehe/freecam.lua', true))()
-- local Cinematic = loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/hehe/Cinematic.lua"))();

-- https://x.synapse.to/docs/reference/misc.html

-- If any updates come to any of the games in this GUI, I will try my hardest to update them for new bypasses
-- Games I focus on most: Ballista


------------------------------------------------------------------------
-- Settings

local Client = {
    Config = {
        --
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
local d = a:Tab("Games")
local e = a:Tab("Paid Gui's")

local asdsa = a:Tab("Info")

------------------------------------------------------------------------

-- c:Toggle("Cinematic Mode",function(bool)
--     loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/hehe/Cinematic.lua"))();

--     local MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.O}

--     local PlayerState = {} do
--     local StarterGui = game:GetService("StarterGui")
--     local screenGuis = {}
--     local coreGuis = {
--         Backpack = true,
--         Chat = true,
--         Health = true,
--         PlayerList = true,
--     }
--     local setCores = {
--         BadgesNotificationsActive = true,
--         PointsNotificationsActive = true,
--     }
    
--     -- Save state and set up for freecam
--     function PlayerState.Push()
--         for name in pairs(coreGuis) do
--             coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
--             StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
--         end
--         for name in pairs(setCores) do
--             setCores[name] = StarterGui:GetCore(name)
--             StarterGui:SetCore(name, false)
--         end
--         local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
--         if playergui then
--             for _, gui in pairs(playergui:GetChildren()) do
--                 if gui:IsA("ScreenGui") and gui.Enabled then
--                     screenGuis[#screenGuis + 1] = gui
--                     gui.Enabled = false
--                     game:GetService("CoreGui").ThemeProvider.TopBarFrame.LeftFrame.MenuIcon.Visible = false
--                 end
--             end
--         end
--     end
    
--     -- Restore state
--     function PlayerState.Pop()
--             for name, isEnabled in pairs(coreGuis) do
--                 StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
--             end
--             for name, isEnabled in pairs(setCores) do
--                 StarterGui:SetCore(name, isEnabled)
--             end
--             for _, gui in pairs(screenGuis) do
--                 if gui.Parent then
--                     gui.Enabled = true
--                     game:GetService("CoreGui").ThemeProvider.TopBarFrame.LeftFrame.MenuIcon.Visible = true
--                 end
--             end
--         end
--     end
    
--     local function StartFreecam()
--         PlayerState.Push()
--     end
    
--     local function StopFreecam()
--         PlayerState.Pop()
--     end
    
--     ------------------------------------------------------------------------
    
--     do
--         local enabled = false
    
--         local function ToggleFreecam()
--             if enabled then
--                 StopFreecam()
--                 else
--                 StartFreecam()
--             end
--             enabled = not enabled
--         end
    
--         local function CheckMacro(macro)
--             for i = 1, #macro - 1 do
--                 if not UserInputService:IsKeyDown(macro[i]) then
--                 return
--                 end
--             end
--             ToggleFreecam()
--         end
    
--         local function HandleActivationInput(action, state, input)
--             if state == Enum.UserInputState.Begin then
--                 if input.KeyCode == MACRO_KB[#MACRO_KB] then
--                 CheckMacro(MACRO_KB)
--                 end
--             end
--             return Enum.ContextActionResult.Pass
--         end
    
--         ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
--     end
-- end)

c:Label("How to use")
c:Label("Shift + P to activate")
c:Label("WASD to move")
c:Label("E/Q to go up/down")
c:Label("Alt to speed movement up by 4x")
c:Label("Z to slow movement down by 1/3")
c:Label("Shift to slow movement down by another 1/3")
c:Label("CTRL to slow movement down by 1/5")

asdsa:Label("Press CTRL to toggle this Gui on and off")
asdsa:Button("Discord link",function()
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

b:Label(" ")
b:Label("Other")

b:Toggle("RemoteSpy",function(bool)
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
    
            if ok then
                if bool then
                    rconsoleprint('@@RED@@')
                    returnValues = data
                    rconsoleprint("\n" .. strId .. " ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\n" .. strId .. " Packed Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: " .. tableToString(returnValues) .. "\n")
                    
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
                    rconsoleprint("\n" .. strId .. " ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\n" .. strId .. " Packed Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: [ERROR] " .. data .. "\n")
                    
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
end)

------------------------------------------------------------------------

d:Label("Ballista")

d:Keybind("hit everyone",Enum.KeyCode.KeypadZero,function()
    local me = game.Players.LocalPlayer-- variable

    -- only works with archer
    -- make sure you do this for only a short amount of time and in small servers (30 or less) in order to be less likely to get banned

    if game.PlaceId == 6763893674 then
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
end)

d:Keybind("Teleport to Mid",Enum.KeyCode.KeypadOne,function()
    if game.PlaceId == 6763893674 then
        hum = game.Players.LocalPlayer.Character.HumanoidRootPart
        
        hum.CFrame = CFrame.new(89.5731735, 1.82997847, 43.8063927)
    end
end)

d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
d:Label("Decaying Winter")

d:Button("Activate",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Aidez/decaying_winter/main/GOODWILL_COMMAND_SCRIPT'),true))()
end)

d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
d:Label("Phantom Forces")

d:Button("Activate 1",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/yes-0001/hi/main/noob/PhantomForcesCatGirl.lua', true))()
end)

d:Button("Activate 2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/phantom-forces-chams/main/main.lua"))()
end)

d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
d:Label("Stay Alive and Flex Your Time")

d:Button("Activate",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/stay-alive-and-flex-time/main/main.lua', true))()
end)

d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
d:Label("The Wild West")

d:Button("Activate",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/yes-0001/hi/main/noob/TheWildWest.lua', true))()
end)

------------------------------------------------------------------------

e:Dropdown("DarkHub - what strucid version?",{"Strucid", "Strucid - Zone Wars"},function(selected)
    if selected == "Strucid" then
        _G.selected1 = true
    else
        _G.selected1 = false
    end
end)

e:Button("Activate Dark Hub",function()
    if selected1 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/noob/a2.lua", true))() -- Regular Strucid
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/noob/a.lua", true))() -- Zone Wars
    end

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
end)

e:Button("Activate Luk Hub",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/noob/LukHub.lua"))();

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