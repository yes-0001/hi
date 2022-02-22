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

        -- UserInputService.MouseBehavior = originalProperties.MouseBehavior
	    -- UserInputService.MouseDeltaSensitivity = originalProperties.MouseDeltaSensitivity
    end
end)