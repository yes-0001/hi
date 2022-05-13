local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local a = library:CreateWindow("Chams")
local b = a:CreateFolder("Chams")

local Plrs = game:GetService("Players")
local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character

local settings = {
    CHAMSEnabled = false,
	FreeForAll = false, -- use for games that don't have teams (Apocalypse Rising)
    CHAMSLength = 500,
    Colors = {
		Enemy = Color3.new(255, 0, 21),
		Ally = Color3.new(0, 170, 255),
		Friend = Color3.new(141, 255, 0),
		Neutral = Color3.new(127, 127, 127),
		ColorOverride = nil -- Every player will have the chosen color regardless of enemy or ally.
	},

    CharAddedEvent = { }
}

function SaveSettings()
	local temp = { }
	local succ, out = pcall(function()
		temp.CHAMSLength = settings.CHAMSLength
		temp.Colors = { }
		for i, v in next, settings.Colors do
			temp.Colors[i] = tostring(v)
		end
		writefile("settings.txt", HTTP:JSONEncode(temp))
	end)
	if not succ then
		error(out)
	end
end

if settings.CHAMSLength > 2048 then
	settings.CHAMSLength = 2048
end

local wildrevolvertick = tick()
local wildrevolverteamdata = nil
function GetTeamColor(Plr)
	if Plr == nil then return nil end
	if not Plr:IsA("Player") then
		return nil
	end
	local PickedColor = settings.Colors.Enemy
	
	if Plr ~= nil then
		if game.PlaceId == 606849621 then
			if settings.Colors.ColorOverride == nil then
				if not settings.FreeForAll then
					if MyPlr.Team ~= nil and Plr.Team ~= nil then
						if settings.FriendList[Plr.Name] == nil then
							if MyPlr.Team.Name == "Prisoner" then
								if Plr.Team == MyPlr.Team or Plr.Team.Name == "Criminal" then
									PickedColor = settings.Colors.Ally
								else
									PickedColor = settings.Colors.Enemy
								end
							elseif MyPlr.Team.Name == "Criminal" then
								if Plr.Team == MyPlr.Team or Plr.Team.Name == "Prisoner" then
									PickedColor = settings.Colors.Ally
								else
									PickedColor = settings.Colors.Enemy
								end
							elseif MyPlr.Team.Name == "Police" then
								if Plr.Team == MyPlr.Team then
									PickedColor = settings.Colors.Ally
								else
									if Plr.Team.Name == "Criminal" then
										PickedColor = settings.Colors.Enemy
									elseif Plr.Team.Name == "Prisoner" then
										PickedColor = settings.Colors.Neutral
									end
								end
							end
						else
							PickedColor = settings.Colors.Friend
						end
					end
				else
					if settings.FriendList[Plr.Name] ~= nil then
						PickedColor = settings.Colors.Friend
					else
						PickedColor = settings.Colors.Enemy
					end
				end
			else
				PickedColor = settings.Colors.ColorOverride
			end
		elseif game.PlaceId == 155615604 then
			if settings.Colors.ColorOverride == nil then
				if MyPlr.Team ~= nil and Plr.Team ~= nil then
					if settings.FriendList[Plr.Name] == nil then
						if MyPlr.Team.Name == "Inmates" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = settings.Colors.Ally
							elseif Plr.Team.Name == "Guards" or Plr.Team.Name == "Criminals" then
								PickedColor = settings.Colors.Enemy
							else
								PickedColor = settings.Colors.Neutral
							end
						elseif MyPlr.Team.Name == "Guards" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = settings.Colors.Neutral
							elseif Plr.Team.Name == "Criminals" then
								PickedColor = settings.Colors.Enemy
							elseif Plr.Team.Name == "Guards" then
								PickColor = settings.Colors.Ally
							end
						elseif MyPlr.Team.Name == "Criminals" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = settings.Colors.Ally
							elseif Plr.Team.Name == "Guards" then
								PickedColor = settings.Colors.Enemy
							else
								PickedColor = settings.Colors.Neutral
							end
						end
					else
						PickedColor = settings.Colors.Friend
					end
				end
			else
				PickedColor = settings.Colors.ColorOverride
			end
		elseif game.PlaceId == 746820961 then
			if settings.Colors.ColorOverride == nil then
				if MyPlr:FindFirstChild("TeamC") and Plr:FindFirstChild("TeamC") then
					if Plr.TeamC.Value == MyPlr.TeamC.Value then
						PickedColor = settings.Colors.Ally
					else
						PickedColor = settings.Colors.Enemy
					end
				end
			else
				PickedColor = settings.Colors.ColorOverride
			end
		elseif game.PlaceId == 1382113806 then
			if settings.Colors.ColorOverride == nil then
				if MyPlr:FindFirstChild("role") and Plr:FindFirstChild("role") then
					if MyPlr.role.Value == "assassin" then
						if Plr.role.Value == "target" then
							PickedColor = settings.Colors.Enemy
						elseif Plr.role.Value == "guard" then
							PickedColor = Color3.new(1, 135 / 255, 0)
						else
							PickedColor = settings.Colors.Neutral
						end
					elseif MyPlr.role.Value == "target" then
						if Plr.role.Value == "guard" then
							PickedColor = settings.Colors.Ally
						elseif Plr.role.Value == "assassin" then
							PickedColor = settings.Colors.Enemy
						else
							PickedColor = settings.Colors.Neutral
						end
					elseif MyPlr.role.Value == "guard" then
						if Plr.role.Value == "target" then
							PickedColor = settings.Colors.Friend
						elseif Plr.role.Value == "guard" then
							PickedColor = settings.Colors.Ally
						elseif Plr.role.Value == "assassin" then
							PickedColor = settings.Colors.Enemy
						else
							PickedColor = settings.Colors.Neutral
						end
					else
						if MyPlr.role.Value == "none" then
							PickedColor = settings.Colors.Neutral
						end
					end
				end
			else
				PickedColor = settings.Colors.ColorOverride
			end
		elseif game.PlaceId == 1072809192 then
			if MyPlr:FindFirstChild("Backpack") and Plr:FindFirstChild("Backpack") then
				if MyPlr.Backpack:FindFirstChild("Knife") or MyChar:FindFirstChild("Knife") then
					if Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = settings.Colors.Enemy
					else
						PickedColor = Color3.new(1, 135 / 255, 0)
					end
				elseif MyPlr.Backpack:FindFirstChild("Revolver") or MyChar:FindFirstChild("Revolver") then
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = settings.Colors.Enemy
					elseif Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = settings.Colors.Enemy
					else
						PickedColor = settings.Colors.Ally
					end
				else
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = settings.Colors.Enemy
					elseif Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = settings.Colors.Ally
					else
						PickedColor = settings.Colors.Neutral
					end
				end
			end
		elseif game.PlaceId == 142823291 or game.PlaceId == 1122507250 then
			if MyPlr:FindFirstChild("Backpack") and Plr:FindFirstChild("Backpack") then
				if MyPlr.Backpack:FindFirstChild("Knife") or MyChar:FindFirstChild("Knife") then
					if (Plr.Backpack:FindFirstChild("Gun") or Plr.Backpack:FindFirstChild("Revolver")) or (Plr.Character:FindFirstChild("Gun") or Plr.Character:FindFirstChild("Revolver")) then
						PickedColor = settings.Colors.Enemy
					else
						PickedColor = Color3.new(1, 135 / 255, 0)
					end
				elseif (MyPlr.Backpack:FindFirstChild("Gun") or MyPlr.Backpack:FindFirstChild("Revolver")) or (MyChar:FindFirstChild("Gun") or MyChar:FindFirstChild("Revolver")) then
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = settings.Colors.Enemy
					else
						PickedColor = settings.Colors.Ally
					end
				else
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = settings.Colors.Enemy
					elseif (Plr.Backpack:FindFirstChild("Gun") or Plr.Backpack:FindFirstChild("Revolver")) or (Plr.Character:FindFirstChild("Gun") or Plr.Character:FindFirstChild("Revolver")) then
						PickedColor = settings.Colors.Ally
					else
						PickedColor = settings.Colors.Neutral
					end
				end
			end
		elseif game.PlaceId == 379614936 then
			if settings.Colors.ColorOverride == nil then
				if not settings.FriendList[Plr.Name] then
					local targ = MyPlr:FindFirstChild("PlayerGui"):FindFirstChild("ScreenGui"):FindFirstChild("UI"):FindFirstChild("Target"):FindFirstChild("Img"):FindFirstChild("PlayerText")
					if targ then
						if Plr.Name:lower() == targ.Text:lower() then
							PickedColor = settings.Colors.Enemy
						else
							PickedColor = settings.Colors.Neutral
						end
					else
						PickedColor = settings.Colors.Neutral
					end
				else
					PickedColor = settings.Colors.Friend
				end
			else
				PickedColor = settings.Colors.ColorOverride
			end
		elseif game.PlaceId == 983224898 then
			if (tick() - wildrevolvertick) > 10 or wildrevolverteamdata == nil then
				wildrevolverteamdata = RepStor.Functions.RequestGameData:InvokeServer()
				wildrevolvertick = tick()
				return settings.Colors.Neutral
			end
			local succ = pcall(function()
				if wildrevolverteamdata[Plr.Name] ~= nil then
					if settings.Colors.ColorOverride == nil then
						if not settings.FriendList[Plr.Name] then
							if wildrevolverteamdata[Plr.Name]["TeamName"] == wildrevolverteamdata[MyPlr.Name]["TeamName"] then
								PickedColor = settings.Colors.Ally
							else
								PickedColor = settings.Colors.Enemy
							end
						else
							PickedColor = settings.Colors.Friend
						end
					else
						PickedColor = settings.Colors.ColorOverride
					end
				else
					PickedColor = settings.Colors.Neutral
				end
			end)
			if not succ then
				wildrevolverteamdata = RepStor.Functions.RequestGameData:InvokeServer()
				wildrevolvertick = tick()
				return settings.Colors.Neutral
			end
		else
			if settings.Colors.ColorOverride == nil then
				if not settings.FreeForAll then
					if MyPlr.Team ~= Plr.Team and not settings.FriendList[Plr.Name] then
						PickedColor = settings.Colors.Enemy
					elseif MyPlr.Team == Plr.Team and not settings.FriendList[Plr.Name] then
						PickedColor = settings.Colors.Ally
					else
						PickedColor = settings.Colors.Friend
					end
				else
					if settings.FriendList[Plr.Name] ~= nil then
						PickedColor = settings.Colors.Friend
					else
						PickedColor = settings.Colors.Enemy
					end
				end
			else
				PickedColor = settings.Colors.ColorOverride
			end
		end
	end
	
	return PickedColor
end

function FindCham(Obj)
	for i, v in next, ItemChams:GetChildren() do
		if v.className == "ObjectValue" then
			if v.Value == Obj then
				return v.Parent
			end
		end
	end

	return nil
end

function UpdateChams(Obj)
	if Obj == nil then return end

	if Obj:IsA("Player") then
		local Find = PlayerChams:FindFirstChild(Obj.Name)
		local GetChar = Obj.Character

		local Trans = 0
		if GetChar and MyChar then
			local GetHead = GetChar:FindFirstChild("Head")
			local GetTor = GetChar:FindFirstChild("HumanoidRootPart")
			local MyHead = MyChar:FindFirstChild("Head")
			local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
			if GetHead and GetTor and MyHead and MyTor then
				if (MyTor.Position - GetTor.Position).magnitude > settings.CHAMSLength then
                    local function Tween_Trans(value, speed)
                        local tween_info = TweenInfo.new(speed, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                        local tween = tween_service:Create(camera, tween_info, {Trans = value})
                        tween:Play()
                    end
                    
                    Tween_Trans(1, 1.5)
				else
					--local MyCharStuff = MyChar:GetDescendants()
					local Ray = Ray.new(MyCam.CFrame.p, (GetTor.Position - MyCam.CFrame.p).unit * 2048)
					local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar})
					if part ~= nil then
						if part:IsDescendantOf(GetChar) then
							local function Tween_Trans(value, speed)
                                local tween_info = TweenInfo.new(speed, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                                local tween = tween_service:Create(camera, tween_info, {Trans = value})
                                tween:Play()
                            end
                            
                            Tween_Trans(0.9, 1.5)
						else
							Trans = 0
						end
					end
				end
			end
		end

		if Find then
			for i, v in next, Find:GetChildren() do
				if v.className ~= "ObjectValue" then
					v.Color3 = GetTeamColor(Obj) or settings.Colors.Neutral
					v.Transparency = Trans
				end
			end
		end
	end
end

function RemoveChams(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemChams
		if IsPlr then UseFolder = PlayerChams end

		local FindC = UseFolder:FindFirstChild(tostring(Obj)) or FindCham(Obj)
		if FindC then
			FindC:Destroy()
		end
	end
end

function CreateChams(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local Crap = nil
		local GetTor = nil
		local t = tick()
		if IsPlr then
			Obj = Obj.Character
			UseFolder = PlayerChams
		end
		if Obj == nil then return end
		GetTor = Obj:FindFirstChild("HumanoidRootPart") or Obj:WaitForChild("HumanoidRootPart")
		if IsPlr then Crap = Obj:GetChildren() else Crap = Obj:GetDescendants() end

		local FindC = ((IsPlr) and UseFolder:FindFirstChild(Obj.Name)) or FindCham(Obj)
		if not FindC then
			return
		end

		for _, P in next, Crap do
			if P:IsA("PVInstance") and P.Name ~= "HumanoidRootPart" then
				local Box = Instance.new("BoxHandleAdornment")
				Box.Size = GetSizeOfObject(P)
				Box.Name = "Cham"
				Box.Adornee = P
				Box.AlwaysOnTop = true
				Box.ZIndex = 5
				Box.Transparency = 0
				Box.Color3 = ((IsPlr) and GetTeamColor(Plrs:GetPlayerFromCharacter(Obj))) or settings.Colors.Neutral
				Box.Parent = FindC
			end
		end
	end
end

Plrs.PlayerAdded:connect(function(Plr)
	if settings.CharAddedEvent[Plr.Name] == nil then
		settings.CharAddedEvent[Plr.Name] = Plr.CharacterAdded:connect(function(Char)
			if settings.CHAMSEnabled then
				RemoveChams(Plr)
				CreateChams(Plr)
			end
			repeat wait() until Char:FindFirstChild("HumanoidRootPart")
		end)
	end
end)

Plrs.PlayerRemoving:connect(function(Plr)
	if settings.CharAddedEvent[Plr.Name] ~= nil then
		settings.CharAddedEvent[Plr.Name]:Disconnect()
		settings.CharAddedEvent[Plr.Name] = nil
	end
	RemoveChams(Plr)
end)



b:Toggle("Player Chams",function(bool)
    if bool then
        settings.CHAMSEnabled = true
    else
        settings.CHAMSEnabled = false
    end

    if settings.CHAMSEnabled then
        for _, v in next, Plrs:GetPlayers() do
            if v ~= MyPlr then
                if settings.CharAddedEvent[v.Name] == nil then
                    settings.CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
                        if settings.CHAMSEnabled then
                            RemoveChams(v)
                            CreateChams(v)
                        end
                        repeat wait() until Char:FindFirstChild("HumanoidRootPart")
                    end)
                end
                RemoveChams(v)
                CreateChams(v)
            end
        end
    end
end)

b:Box("Chams Length","number",function(value) -- "number" or "string"
    if value > 2048 then
        settings.CHAMSLength = 2048
    else
        settings.CHAMSLength = value
    end
end)





local succ, out = coroutine.resume(coroutine.create(function()
	while true do
		for _, v in next, Plrs:GetPlayers() do
			UpdateChams(v)
			Run.RenderStepped:wait()
		end
	end
end))

if not succ then
	error(out)
end