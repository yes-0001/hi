local Workspace = game:GetService("Workspace")

function CastleTown()
    

    Workspace.CantPlace.Part:Remove()

    for _, scr in pairs(Workspace.CantPlace:GetDescendants()) do
        if scr.ClassName == "Model" then
            for _, scr2 in pairs(scr:GetDescendants()) do
                if scr2.ClassName == "MeshPart" or scr2.Name == "Meshes/Tree4Leaves2" then
                    scr:Destroy()
                end
            end
        end
    end
end

function CorporateChaos()
    for _, scr in pairs(Workspace.Ground:GetDescendants()) do
        if scr.ClassName ~= "MeshPart" then
            scr:Destroy() --continue
        end
        --scr:Destroy()
    end
end

function VolcanoValley()
    for _, scr in pairs(Workspace.Ground:GetDescendants()) do
        if scr.ClassName ~= "MeshPart" then
            scr:Destroy() --continue
        end
        --scr:Destroy()
    end
    for _, scr in pairs(Workspace.CantPlace:GetDescendants()) do
        if scr.Name ~= "Meshes/rock" then
            scr:Destroy() --continue
        end
        --scr:Destroy()
    end
end

function OddportAcademy()
    Workspace.CantPlace.Part:Remove()

    for _, scr in pairs(Workspace.CantPlace:GetDescendants()) do
        if scr.Name == "PineTree2" then
            scr:Destroy() --continue
        end
        --scr:Destroy()
    end
end




if game:GetService("Lighting").FogColor == Color3.fromRGB(192, 192, 192) then
    VolcanoValley()
    print("Volcano Valley")
end
print("1")


-- keep everything under here that does not have print(game:GetService("Lighting").Sky
-- make sure they use Lighting.FogColor instead of Skybox
if game:GetService("Lighting").Sky.SkyboxBk == "rbxasset://textures/sky/sky512_bk.tex" then
    OddportAcademy()
    print("Oddport Academy")
end
print("2")


if game:GetService("Lighting").Sky.SkyboxBk == "http://www.roblox.com/asset/?version=1&id=133184290" then
    CastleTown()
    print("Castle Town")
end
print("3")


if game:GetService("Lighting").Sky.SkyboxBk == "rbxassetid://1009082031" then
    CorporateChaos()
    print("Corporate Chaos")
end
print("4")


if game:GetService("Lighting").Sky.SkyboxBk == "rbxassetid://2673551390" then
    print("Glowing Glacier")
end
print("5")


if game:GetService("Lighting").Sky.SkyboxBk == "http://www.roblox.com/asset/?id=122787983" then
    if game:GetService("Lighting").FogColor == Color3.fromRGB(204, 142, 105) then
        print("Canyon Calamity")
    end
    print("5.1")

    if game:GetService("Lighting").FogColor == Color3.fromRGB(180, 152, 116) then
        print("Desolate Desert")
    end
    print("5.2")
end
print("6")

