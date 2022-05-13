local collectionService = game:GetService("CollectionService")
local player = game.Players.LocalPlayer

--// CONFIG
_G.minPlayers = 10
_G.minBuyers = 5
_G.serverHopAfterMinutes = 4

_G.ToggleJoinMSG = true
_G.joinMSG = "Hey, make sure to check out my shop! :)"

_G.AutoClaimBooth = true

_G.LookForSuggarDad = false
_G.minSuggardad = 100

_G.refreshing = false
_G.timer = false
_G.message = false

--// CONFIG END

local cloneGui = {}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/NewUI"))()

local a = library:Window()

local b = a:Tab("Functions")
local c = a:Tab("Server Hop")
local d = a:Tab("Settings")

------------------------------------------------------------------------

b:Toggle("Toggle Refreshing",function(bool)
    if bool then
        _G.refreshing = true
        refreshGrids()
    else
        _G.refreshing = false
    end
end)

b:Button("Refresh",function()
    refreshGrids()
end)

b:Button("Rejoin",function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer

    if message then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("I'm gonna rejoin now :D","All")
        wait(2)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("brb ;o","All")
        wait(1)
    end

    ts:Teleport(game.PlaceId, p)
end)

b:Button("Remove all sounds",function()
    local c = 0
    for _, d in ipairs(workspace:GetDescendants()) do
    	if (d:IsA("Sound")) and d.Name ~= "Ding" and d.SoundId ~= "rbxassetid://138222365" then
    		d:Stop()
    		d:Destroy()
    		c = c + 1
    	end
    end
end)

------------------------------------------------------------------------

b:Button("Server Hop",function()
    local lp = game.Players.LocalPlayer
    local waitForPlots = workspace:WaitForChild("Plots")

    spawn(function()
        while not waitForPlots:FindFirstChild(lp.Name) do
            local unclaimed = game:GetService("Workspace").Plots:FindFirstChild("Unclaimed")
            if unclaimed then
                if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                    lp.Character.HumanoidRootPart.CFrame = unclaimed.Table:FindFirstChild("Bottom").CFrame + Vector3.new(0, 3, 0)

                    if ToggleJoinMSG then
                        pcall(function()
                            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(joinMSG, "All")
                            ToggleJoinMSG = false
                        end)
                    end
                end
                wait(1.5)
                
                for i, v in pairs(unclaimed:GetDescendants()) do
                    if v.Name == "BoothClaimPrompt" then
                        fireproximityprompt(v)
                    end
                end
            end
        end
    end)

    function hop()
        pcall(function()
            spawn(function()
                while wait(2) do
                    local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
                    for i, v in pairs(Servers.data) do
                        if v.playing ~= v.maxPlayers then
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
                        end
                    end
                end
            end)
        end)
    end

    local players = game.Players:GetChildren()
    local countPlayers = #players

    local buyers = 0
    local suggarAmount = 0
    for i, v in pairs(game:GetService("Players"):GetChildren()) do
        for i, v in pairs(v:GetDescendants()) do
            if v.Name == "Bought" then
                if v.Value > 0 then
                    buyers = buyers + 1
                end

                if LookForSuggarDad then
                    if v.Value > minSuggardad then
                        suggarAmount = suggarAmount + 1
                    end
                end
            end
        end
    end

    if countPlayers >= minPlayers and buyers >= minBuyers then
        if LookForSuggarDad then
            if suggarAmount > 0 then
                local waitTime = serverHopAfterMinutes * 60
                local client = game.GetService(game, "Players").LocalPlayer

                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
                    v:Disable()
                end
                wait(waitTime)
                hop()
            else
                hop()
            end
        else
            local waitTime = serverHopAfterMinutes * 60
            local client = game.GetService(game, "Players").LocalPlayer

            for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
                v:Disable()
            end
            wait(waitTime)
            hop()
        end
    else
        hop()
    end

end)

------------------------------------------------------------------------

d:Label("Copy Settings")

d:Toggle("Copy Timer",function(bool)
    if bool then
        _G.timer = true
    else
        _G.timer = false
    end
end)

d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
d:Label("Rejoin Settings")

d:Toggle("Toggle Rejoin Message",function(bool)
    if bool then
        _G.message = true
    else
        _G.message = false
    end
end)

d:Label("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
d:Label("Server-Hop Settings")

d:Slider("Minimum Players", 1, 17,function(num)
    _G.minPlayers = num
end)

d:Slider("Minimum Buyers", 1, 17,function(num)
    _G.minBuyers = num
end)

d:Slider("Server-Hop after minutes", 1, 60,function(num)
    _G.serverHopAfterMinutes = num
end)

d:Toggle("Toggle Rejoin Message",function(bool)
    if bool then
        _G.ToggleJoinMSG = true
    else
        _G.ToggleJoinMSG = false
    end
end)

d:Textbox("Join Message",true,function(value)
    _G.joinMSG = value
end)

d:Label("Default Join Message:")
d:Label("Hey, make sure to check out my shop! :)")

d:Toggle("Toggle Auto Claim Booth",function(bool)
    if bool then
        _G.AutoClaimBooth = true
    else
        _G.AutoClaimBooth = false
    end
end)

d:Toggle("Look for Sugar Daddy",function(bool)
    if bool then
        _G.LookForSuggarDad = true
    else
        _G.LookForSuggarDad = false
    end
end)

d:Slider("Server-Hop after minutes", 100, 10000,function(num)
    _G.minSuggardad = num
end)

------------------------------------------------------------------------

local sound = Instance.new("Sound", game.Workspace)
sound.SoundId = "rbxassetid://138222365"
sound.Name = "Ding"

------------------------------------------------------------------------







function cloneGui.buildRoot()
    local paintFrame = player.PlayerGui.MainGui.PaintFrame
    local cloneFrame = paintFrame:Clone()

    -- Initialize root frame.
    cloneFrame.Name = 'CloneFrame'
    cloneFrame.Parent = paintFrame
    cloneFrame.ToolsFrame:Destroy()
    cloneFrame.ColorFrame:Destroy()
    cloneFrame.NextButton:Destroy()
    cloneFrame.UIAspectRatioConstraint:Destroy()
    cloneFrame.Grid:Destroy()
    cloneFrame.Confirmation:Destroy()
    cloneFrame.AnchorPoint = Vector2.new(0, 0.5)
    cloneFrame.Position = UDim2.new(1, 10, 0.5, 0)
    cloneFrame.Size = UDim2.new(0.5, 0, 1, 0)
    cloneFrame.Visible = true

    paintFrame.Position = UDim2.new(0.5, -((cloneFrame.AbsoluteSize.X / 2) + 5), 0.5, 0)

    cloneGui.root = cloneFrame
end

function cloneGui.buildButtons()
    local nextButton = player.PlayerGui.MainGui.PaintFrame.NextButton
    local copyButton = nextButton:Clone()
    local deleteButton = nextButton:Clone()
    local buttonSize = UDim2.new(0.4, 0, 0.09, 0)

    -- Initialize copy button.
    copyButton.Parent = cloneGui.root
    copyButton.Size = buttonSize
    copyButton.Position = UDim2.new(0.28, 0, 0.895)
    copyButton.Label.Text = 'COPY'
    copyButton.Name = 'CopyButton'

    -- Initialize clone button.
    deleteButton.Parent = cloneGui.root
    deleteButton.Size = buttonSize
    deleteButton.Position = UDim2.new(0.72, 0, 0.895)
    deleteButton.Label.Text = 'DELETE'
    deleteButton.Name = 'DeleteButton'

    -- Animation functions.
    for i, button in pairs({deleteButton, copyButton}) do
        button.MouseEnter:Connect(function()
            button:TweenSize(UDim2.new(buttonSize.X.Scale + 0.015, 0, buttonSize.Y.Scale + 0.015, 0), 'Out', 'Quad', 0.2, true)
        end)

        button.MouseLeave:Connect(function()
            button:TweenSize(buttonSize, 'Out', 'Quad', 0.2, true)
        end)
    end

    -- Button actions.
    copyButton.MouseButton1Click:Connect(copyGrid)

    deleteButton.MouseButton1Click:Connect(DeleteGrid)
end

function cloneGui.buildScrollingFrame()
    local scrollingFrame = Instance.new('ScrollingFrame')
    local uiListLayout = Instance.new('UIListLayout')
    local uiPadding = Instance.new('UIPadding')

    -- Initialize scrolling frame.
    scrollingFrame.Parent = cloneGui.root
    scrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
    scrollingFrame.Position = UDim2.new(0.5, 0, 0.05, 0)
    scrollingFrame.Size = UDim2.new(0.8, 0, 0.75, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarImageColor3 = Color3.new((210 / 255), (76 / 255), (71 / 255))
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.ZIndex = 3

    -- Configure layout.
    uiListLayout.Parent = scrollingFrame
    uiListLayout.Padding = UDim.new(0, 10)
    uiPadding.Parent = scrollingFrame
    uiPadding.PaddingLeft = UDim.new(0.08, 0)
    uiPadding.PaddingRight = UDim.new(0.08, 0)
    uiPadding.PaddingTop = UDim.new(0, 5)

    uiListLayout.Changed:Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 10)
    end)

    cloneGui.scrollingFrame = scrollingFrame
end

function cloneGui.addGrid(grid, name, artist)
    local UIStroke = player.PlayerGui.MainGui.PaintFrame.Grid.UIStroke:Clone()
    _G.container = Instance.new('Frame')
    local preview = grid:Clone()

    -- Initialize new container.
    container.Parent = cloneGui.scrollingFrame
    container.Size = UDim2.new(1, 0, 1, 0)
    container.SizeConstraint = Enum.SizeConstraint.RelativeXX
    container.BackgroundTransparency = 0.8
    container.ZIndex = 4
    UIStroke.Thickness = 4.5
    UIStroke.Parent = container
    UIStroke.Enabled = false

    -- Clone grid into container.
    preview.Parent = container

    if (cloneGui.selected == nil) then
        cloneGui.selected = container
        UIStroke.Enabled = true
    end

    _G.gridName = name
    _G.gridArtist = artist

    container.InputBegan:Connect(function(userInput)
        if (userInput.UserInputType == Enum.UserInputType.MouseButton1) then
            cloneGui.selected.UIStroke.Enabled = false
            UIStroke.Enabled = true
            cloneGui.selected = container
        end
    end)
end

function cloneGui.buildInfo()
    local paintFrame = player.PlayerGui.MainGui.PaintFrame
    local ArtInfoFrame = player.PlayerGui.MainGui.ArtInfoFrame
    local cloneFrame = ArtInfoFrame:Clone()

    local Artist = cloneFrame.Info.Artist.Label
    local Name = cloneFrame.Info.ArtName

    cloneFrame.Name = 'CloneFrame'
    cloneFrame.Parent = paintFrame
    cloneFrame.Info.PurchasePrice:Destroy()
    cloneFrame.Info.Value:Destroy()
    cloneFrame.Info.Buttons:Destroy()
    cloneFrame.Triangle.Position = UDim2.new(-0.070, 0, 0.400, 0)
    cloneFrame.Triangle.ImageColor3 = Color3.fromRGB(85, 97, 154)
    cloneFrame.Size = UDim2.new(0, 250, 0, 275)
    cloneFrame.Visible = false

    if (cloneGui.selected ~= nil) then
        while true do
            local newpos = cloneGui.selected.Position + UDim2.new(0, (cloneGui.selected.AbsoluteSize.X + 50), 0, 0)
            cloneFrame.Position = newpos
        end
        
        Artist.Text = gridArtist
        Name.Text = gridName

        cloneFrame.Visible = true
    else
        cloneFrame.Visible = false
    end

    --[[
    container.InputBegan:Connect(function(userInput)
        if (userInput.UserInputType == Enum.UserInputType.MouseButton1) then
            Artist.Text = gridArtist
            Name.Text = gridName
        end
    end)
    ]]
end

function copyGrid()
    if (cloneGui.selected ~= nil) then
        local target = cloneGui.selected.Grid
        local destination = player.PlayerGui.MainGui.PaintFrame.Grid
        
        for i = 1, 1024 do
            destination[i].BackgroundColor3 = target[i].BackgroundColor3
        end
        
        if timer then
            -- wait(600)
            -- sound.TimePosition = 0
            -- sound:Play()
            -- sound.Volume = 1
        end
    end
end

function DeleteGrid()
    if (cloneGui.selected ~= nil) then
        local target = cloneGui.selected.Grid
        target:Remove()

        -- for i = 1, 1024 do
        --   target[i]:Remove()
        -- end
    end
end

function refreshGrids()
    local objects = game.Workspace.Plots:GetDescendants()
    for i, v in ipairs(objects) do
        if (v.Name == 'ArtName' and v.ClassName == 'TextLabel') then
            _G.Name = v.Text
        end

        if v.ClassName == 'Model' then
            _G.Artist = v.Name
        end

        if (v.Name == 'Grid' and v.ClassName == 'Frame' and not collectionService:HasTag(v, 'cloned')) then
            if (#v:GetChildren() == 1027) then
                collectionService:AddTag(v, 'cloned')
                cloneGui.addGrid(v, Name, Artist)
            end
        end
    end
end

cloneGui.buildRoot()
cloneGui.buildButtons()
cloneGui.buildScrollingFrame()
cloneGui.buildInfo()

while (_G.refreshing) do
    refreshGrids()
    wait(0.5)
end