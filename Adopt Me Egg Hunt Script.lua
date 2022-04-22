speed = 500

function run()
if game.Workspace:FindFirstChild("MainMap/Default") ~= "MainMap/Default" then
    for _, v in pairs(game.Workspace:WaitForChild("EasterEggs"):WaitForChild("Visuals"):GetChildren()) do
        if v:FindFirstChild"Meshes/CollectableEgg_CollectableEgg_1".Transparency == 0 then
            if char.Humanoid.Sit == true then
                char.Humanoid.Jump = true
            end
            local dist = (char.HumanoidRootPart.Position - v:FindFirstChild"Meshes/CollectableEgg_CollectableEgg_1".Position).magnitude
            local tweenspeed = dist/tonumber(speed)

            local ts = game:GetService('TweenService')

            local part = char.HumanoidRootPart
            local ti = TweenInfo.new(tweenspeed, Enum.EasingStyle.Linear)
            local tp = {CFrame = CFrame.new(v:FindFirstChild"Meshes/CollectableEgg_CollectableEgg_1".Position)}

            local tween = ts:Create(part, ti, tp)

            tween.Completed:Connect(function()
                wait(0.5)
                if char.Humanoid.Sit == true then
                    char.Humanoid.Jump = true
                end
            end)

            tween:Play()
        end
    end
end
end

repeat
spawn(function()
    for _,v in pairs(game.Workspace:WaitForChild"Interiors":WaitForChild"MainMap/Default":WaitForChild"Doors":GetChildren()) do
        for _,v in pairs(v:GetChildren()) do
            if v.Name == "WorkingParts" then
                v = v:WaitForChild("TouchToEnter")
                local pos = Vector3.new(-321, -34, -1973)
                v.Position = pos
            end
        end
    end
end)
char = game.Players.LocalPlayer.Character
run()
wait(1)
until not game.Players.LocalPlayer.Character:WaitForChild("Head")
