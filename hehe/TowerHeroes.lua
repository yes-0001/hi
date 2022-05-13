local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/NewUI"))()

local a = library:Window()

local b = a:Tab("Universal")

b:Toggle("Auto Upgrade",function(bool)
    if bool then
        _G.AutoUpgrade = true;
    else
        _G.AutoUpgrade = false;
    end

    -- Lot of remote spam so its best to keep the wait higher.
    while _G.AutoUpgrade do
        wait(5)
        local children = game:GetService("Workspace").Troop:GetChildren()
        for i = 1, #children do
            if children[i].Stats.Owner.Value == game:GetService("Players").LocalPlayer.Name then -- Ensure their our little guys.
                game:GetService("ReplicatedStorage").Events.TroopEvent:FireServer("Upgrade", children[i])
            end
        end
    end
end)

b:Toggle("Auto Wave Skip",function(bool)
    if bool then
        _G.WaveSkip = true;
    else
        _G.WaveSkip = false;
    end

    -- Main GUI
    local MenuGui = game:GetService("Players").LocalPlayer.PlayerGui.Menu

    -- Local Functions
    local function SkipMenuChanged()
        if MenuGui.Skip.Visible == true then -- Double check..
            if _G.WaveSkip then
                game:GetService("ReplicatedStorage").Events.SkipWave:FireServer()
            end
        end
    end

    -- Event Capture
    MenuGui.Skip:GetPropertyChangedSignal("Visible"):Connect(SkipMenuChanged)
    
end)

b:Toggle("Auto Place",function(bool)
    if bool then
        _G.AutoPlacer = true;
    else
        _G.AutoPlacer = false;
    end

    while _G.AutoPlacer do
        wait(5)
        
        -- Placed Troops (All of them)
        local placedtroops = game.Workspace.Troop:GetChildren()
        
        -- See what player has to select from
        local menu = game.Players.LocalPlayer.PlayerGui.Menu.Inventory
        local mitem1 = menu["1"].TroopFrame.TroopModule.Value
        local mitem2 = menu["2"].TroopFrame.TroopModule.Value
        local mitem3 = menu["3"].TroopFrame.TroopModule.Value
        local mitem4 = menu["4"].TroopFrame.TroopModule.Value
        
        -- Put menu items into table to random select.
        local menutable = {mitem1, mitem2, mitem3, mitem4}
        local value = math.random(1, #menutable) -- Random Select.
        
        -- Select randomly and place em for us
        local otroopselect =  math.random(1, #placedtroops)
        local otroop = placedtroops[otroopselect]
        
        if otroop.Stats.Owner.Value ~= game.Players.LocalPlayer.Name then
            if otroop.Name ~= "Lemonade Cat" and otroop.Name ~= "Slime King" then -- Normally people stick these out of the way and you don't want troops doing nothing.
                local value = math.random(1, #menutable) -- Random Select from our menu..
                warn("Placing: " .. tostring(value))
                game:GetService("ReplicatedStorage").Events.TroopPlace:FireServer(game:GetService("ReplicatedStorage").Troops[tostring(menutable[value])], otroop.PrimaryPart.Position, 0)
            end
        end
    end
end)