local MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.O}

local PlayerState = {} do
local StarterGui = game:GetService("StarterGui")
local screenGuis = {}
local coreGuis = {
    Backpack = true,
    Chat = true,
    Health = true,
    PlayerList = true,
}
local setCores = {
    BadgesNotificationsActive = true,
    PointsNotificationsActive = true,
}

-- Save state and set up for freecam
function PlayerState.Push()
    for name in pairs(coreGuis) do
        coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
    end
    for name in pairs(setCores) do
        setCores[name] = StarterGui:GetCore(name)
        StarterGui:SetCore(name, false)
    end
    local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if playergui then
        for _, gui in pairs(playergui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui.Enabled then
                screenGuis[#screenGuis + 1] = gui
                gui.Enabled = false
                game:GetService("CoreGui").ThemeProvider.TopBarFrame.LeftFrame.MenuIcon.Visible = false
            end
        end
    end
end

-- Restore state
function PlayerState.Pop()
        for name, isEnabled in pairs(coreGuis) do
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
        end
        for name, isEnabled in pairs(setCores) do
            StarterGui:SetCore(name, isEnabled)
        end
        for _, gui in pairs(screenGuis) do
            if gui.Parent then
                gui.Enabled = true
                game:GetService("CoreGui").ThemeProvider.TopBarFrame.LeftFrame.MenuIcon.Visible = true
            end
        end
    end
end

local function StartFreecam()
    PlayerState.Push()
end

local function StopFreecam()
    PlayerState.Pop()
end

------------------------------------------------------------------------

do
    local enabled = false

    local function ToggleFreecam()
        if enabled then
            StopFreecam()
            else
            StartFreecam()
        end
        enabled = not enabled
    end

    local function CheckMacro(macro)
        for i = 1, #macro - 1 do
            if not UserInputService:IsKeyDown(macro[i]) then
            return
            end
        end
        ToggleFreecam()
    end

    local function HandleActivationInput(action, state, input)
        if state == Enum.UserInputState.Begin then
            if input.KeyCode == MACRO_KB[#MACRO_KB] then
            CheckMacro(MACRO_KB)
            end
        end
        return Enum.ContextActionResult.Pass
    end

    ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
end