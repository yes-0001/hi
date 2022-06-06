local Workspace = game:GetService("Workspace")

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