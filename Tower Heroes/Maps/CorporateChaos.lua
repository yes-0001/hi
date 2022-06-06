local Workspace = game:GetService("Workspace")

for _, scr in pairs(Workspace.Ground:GetDescendants()) do
    if scr.ClassName ~= "MeshPart" then
        scr:Destroy() --continue
    end
    --scr:Destroy()
end