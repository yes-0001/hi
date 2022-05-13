local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/NewUI"))()

local w = library:Window() -- Creates the window

local b = w:Tab("Tab1") -- Creates the folder (U will put here your buttons,etc)

local Client = {
    Toggles = {
        toggle1 = false
    },

    Visuals = {
        -- Color = Color3.fromRGB(255, 40, 0)
    },

    Config = {
        Keybind1 = Enum.KeyCode.C
    }
}

b:Label("Test label")

b:Button("Test button",function()
    print("The button worked :D")
end)

b:Toggle("toggle1",function(state)
    Client.Toggles.toggle1 = state
    print(state)
end)

b:Slider("walkspeed", 0, 100,function(num) -- min/max
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = num
end)

local Players = {}
for _,v in pairs(game.Players:GetPlayers()) do
    table.insert(Players, v.Name)
end

b:Dropdown("Select player",Players,function(selected)
    print(selected)
end)

b:Keybind("Keybind",Enum.KeyCode.C,function() -- Default bind
    print("Key pressed")
end)

b:Colorpicker("Color",Color3.fromRGB(255, 40, 0),function(color) -- Default color
    --Client.Visuals.Color = color
    -- print(color)

    local player1 = game:GetService("Players").LocalPlayer.Name
    game.Workspace:FindFirstChild(player1).Head.OverheadGui.InformationLabel.TextColor3 = color
end)

b:Textbox("Box",true,function(value) -- true/false, if true it will hide the text until you click on the box
    print(value)
end)