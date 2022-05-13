local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:connect(function(input)
    if input.KeyCode==Enum.KeyCode.C then
        
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
    end
end)

UserInputService.InputEnded:connect(function(input)
    if input.KeyCode==Enum.KeyCode.C then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
end)