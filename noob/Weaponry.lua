function GetFramework()
    for i,v in pairs(game.Players.LocalPlayer.PlayerScripts:GetChildren()) do
        if pcall(function() getsenv(v) end) and getsenv(v).InspectWeapon then
            return v 
        end
    end
    return nil 
end
DarkHub_Client = {SavedSettings = false}
if isfolder and makefolder and not isfolder('DarkHub') then
    makefolder('DarkHub')
    DarkHub_Client.SaveSettings = true
    if isfile('DarkHub/DarkHub_'..tostring(Game.PlaceId)..'.DARKHUB') then
        DarkHub_Client.SavedSettings = true
        DarkHub_Client.GameSettings = game:GetService('HttpService'):JSONDecode(readfile('DarkHub/DarkHub_'..tostring(Game.PlaceId)..'.DARKHUB'))
    end
elseif isfolder('DarkHub') then
    DarkHub_Client.SaveSettings = true
    if isfile('DarkHub/DarkHub_'..tostring(Game.PlaceId)..'.DARKHUB') then
        DarkHub_Client.SavedSettings = true
        DarkHub_Client.GameSettings = game:GetService('HttpService'):JSONDecode(readfile('DarkHub/DarkHub_'..tostring(Game.PlaceId)..'.DARKHUB'))
    end
else
    DarkHub_Client.SaveSettings = false
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/yes-0001/hi/main/NyaHub/UI.lua",true))()
main = lib:Window()
local ClientVars = getsenv(GetFramework()).CheckIsToolValid
local RecoilHandler = require(game:GetService("ReplicatedStorage").ClientModules.RecoilCamHandler)
local RayCastClient = require(game:GetService("ReplicatedStorage").ClientModules.RayCastClient)

IsUpToDate = pcall(function()
    Client = {
        Toggles = {
            InfAmmo = DarkHub_Client.SavedSettings and DarkHub_Client.GameSettings.Toggles.InfAmmo or false,
            SilentAim = DarkHub_Client.SavedSettings and DarkHub_Client.GameSettings.Toggles.SilentAim or false,
            NoSpread = DarkHub_Client.SavedSettings and DarkHub_Client.GameSettings.Toggles.NoSpread or false,
            NoRecoil = DarkHub_Client.SavedSettings and DarkHub_Client.GameSettings.Toggles.NoRecoil or false,
            Auto = DarkHub_Client.SavedSettings and DarkHub_Client.GameSettings.Toggles.Auto or false
        },
        Values = {
        }
    }
end)
if not IsUpToDate and DarkHub_Client.SavedSettings and isfile('DarkHub/DarkHub_'..tostring(Game.PlaceId)..'.DARKHUB') then
    delfile('DarkHub/DarkHub_'..tostring(Game.PlaceId)..'.DARKHUB')
    game.Players.LocalPlayer:Kick('DarkHub Settings Out Of Date - Issue Fixed | Restart DarkHub to Continue')
    return
end

local Main = main:Tab("Main")
Main:Button('Global Sound Annoy (Plays Once)',function()
    local REMOTES = game:GetService("ReplicatedStorage"):FindFirstChild('FirearmSoundHandler',true).Parent
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild('Head') then
            local v1 = 1
            local v2 = game:GetService("ReplicatedStorage").ClientSounds.PreloadEndgameThemes.Sound
            local v3 = v.Character.Head
            local v4 = {
                [1] = 95, 
                [2] = 105
            }
            local v5 = {
                [1] = "SHOOT"
            }
            local v6 = {
            }
            local v7 = false
            local event = REMOTES.FirearmSoundHandler
            
            event:FireServer(v1, v2, v3, v4, v5, v6, v7)
        end
    end
end)

Main:Toggle('Silent Aim',function(state)
    Client.Toggles.SilentAim = state
end,Client.Toggles.SilentAim)
Main:Toggle('Inf Ammo',function(state)
    Client.Toggles.InfAmmo = state
end,Client.Toggles.InfAmmo)
Main:Toggle('No Spread',function(state)
    Client.Toggles.NoSpread = state
end,Client.Toggles.NoSpread)
Main:Toggle('No Recoil',function(state)
    Client.Toggles.NoRecoil = state
end,Client.Toggles.NoRecoil)
Main:Toggle('Always Auto',function(state)
    Client.Toggles.Auto = state
end,Client.Toggles.Auto)
OldRecoil = RecoilHandler.accelerate
RecoilHandler.accelerate = function(...)
    if Client.Toggles.NoRecoil then
        return
    end
    return OldRecoil(...)
end
game:GetService('RunService').RenderStepped:Connect(function()
    if Client.Toggles.InfAmmo then
        pcall(function() getupvalue(ClientVars,1)[1].CurrentAmmo = getupvalue(ClientVars,1)[1].WeaponStats.MaxAmmo getupvalue(ClientVars,1)[2].CurrentAmmo = getupvalue(ClientVars,1)[2].WeaponStats.MaxAmmo end)
    end
    if Client.Toggles.NoSpread then
        pcall(function() getupvalue(ClientVars,1)[1].CurrentAccuracy = 0 getupvalue(ClientVars,1)[2].CurrentAccuracy = 0 end)
    end
    if Client.Toggles.Auto then
        pcall(function() 
            getupvalue(ClientVars,1)[1].WeaponStats.FireMode = {
                ['Name'] = 'Auto',
                ['Round'] = 1
            }
            getupvalue(ClientVars,1)[2].WeaponStats.FireMode = {
                ['Name'] = 'Auto',
                ['Round'] = 1
            } 
        end)
    end
end)
function GetClosestPlr()
    Plr = nil
    MaxDis = math.huge
    for i,v in pairs(game.Players.GetPlayers(game.Players)) do
        if v ~= game.Players.LocalPlayer and v.TeamColor ~= game.Players.LocalPlayer.TeamColor and v.Character and v.Character.FindFirstChild(v.Character,"Head") then
            local Pos, Vis = game.Workspace.CurrentCamera.WorldToScreenPoint(game.Workspace.CurrentCamera,v.Character.FindFirstChild(v.Character,"Head").Position)
            if Vis then
                mag = (Vector2.new(Pos.X,Pos.Y) - Vector2.new(game.Players.LocalPlayer.GetMouse(game.Players.LocalPlayer).X,game.Players.LocalPlayer.GetMouse(game.Players.LocalPlayer).Y)).magnitude
                if mag < MaxDis and mag <= 500 then
                    Plr = v
                    MaxDis = mag
                end
            end
        end
    end
    return Plr
end
Old = RayCastClient.CastRayMouse
RayCastClient.CastRayMouse = function(p31,p32,p33)
    if Client.Toggles.SilentAim and GetClosestPlr() ~= nil then
        NewPoint = p31:WorldToScreenPoint(GetClosestPlr().Character.Head.Position)
        p32 = NewPoint.X
        p33 = NewPoint.Y + game:GetService('GuiService'):GetGuiInset().Y;
    end
    return Old(p31,p32,p33)
end

while true do wait(5)
    if DarkHub_Client.SaveSettings then
        writefile('DarkHub/DarkHub_'..tostring(Game.PlaceId)..'.DARKHUB',game:GetService('HttpService'):JSONEncode({['Toggles'] = Client.Toggles,['Values'] = Client.Values}))    
    end
end