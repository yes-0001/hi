local Workspace = game:GetService("Workspace")

Workspace.CantPlace.Part:Remove()

for _, scr in pairs(Workspace.CantPlace:GetDescendants()) do
    if scr.Name == "PineTree2" then
        scr:Destroy() --continue
    end
    --scr:Destroy()
end