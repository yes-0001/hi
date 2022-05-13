local plr = game.Players.LocalPlayer
local hum = plr.Character.HumanoidRootPart
local mouse = plr:GetMouse()
local StarterGui = game:GetService("StarterGui")

mouse.KeyDown:connect(function(key)
    if key == "c" then
        if mouse.Target then
            if mouse.Target.Parent.Name == "Art" then
                mouse.Target.Parent:Remove()
            else
                StarterGui:SetCore("SendNotification",{
                    Title = "Art Frame Deleter",
                    Text = "You can only delete Art Frames"
                })
            end
        end
    end
end)

StarterGui:SetCore("SendNotification",{
    Title = "Art Frame Deleter",
    Text = "Press C to use"
})