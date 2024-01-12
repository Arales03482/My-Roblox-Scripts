-- autofarm prob broken idc to update it bc i dont like roblox that much anymore and motivation

--A Autofarm Script For the Roblox Game: https://www.roblox.com/games/6811842210 (THIS AUTOFARM DOES NOT WORK CONSISTENTLY)

speed = 500

function run()
local stages = game.workspace:WaitForChild("CurrentStages")
local ui = game.Players.LocalPlayer.PlayerGui.Shop.Shop.Mutators.ScrollingFrame:FindFirstChild"Festive Gifts"
if ui:GetChildren()[7].Visible == true and stages:FindFirstChild"1":FindFirstChild"Start Platform":FindFirstChild"FestiveGift" then
    print("Festive Gifts is Active")
    print("Festive Gifts Autofarm Started")
    wait(3)
    local char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = CFrame.new(stages:FindFirstChild"1":FindFirstChild"Start Platform":FindFirstChild"FestiveGift".Position)
    wait(1)
    if stages:FindFirstChild"2":FindFirstChild"Start Platform":FindFirstChild"FestiveGift" then
        local char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(stages:FindFirstChild"2":FindFirstChild"Start Platform":FindFirstChild"FestiveGift".Position)
        wait(1)
    end
    if stages:FindFirstChild"3":FindFirstChild"Start Platform" then
        local char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(stages:FindFirstChild"3":FindFirstChild"Start Platform":FindFirstChild"FestiveGift".Position)
        wait(1)
    end
    if stages:FindFirstChild"4":FindFirstChild"Start Platform" then
        local char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(stages:FindFirstChild"4":FindFirstChild"Start Platform":FindFirstChild"FestiveGift".Position)
        wait(1)
    end
    if stages:FindFirstChild"5":FindFirstChild"Start Platform" then
        local char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(stages:FindFirstChild"5":FindFirstChild"Start Platform":FindFirstChild"FestiveGift".Position)
        wait(1)
    end
    if stages:FindFirstChild"RunEnd":FindFirstChild"FinishPlatform" then
        local char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(stages:FindFirstChild"RunEnd":FindFirstChild"FinishPlatform":FindFirstChild"FestiveGift".Position)
        wait(1)
    end
    if ui:GetChildren()[7].Visible == false then
        print("Festive Gifts is Not Active")
    end
end
local target = stages:WaitForChild"RunEnd":WaitForChild"SpawnPoint".Position
local target2 = stages:WaitForChild"RunEnd":WaitForChild"EndWall"
local dist = (char.HumanoidRootPart.Position - target).magnitude
local tweenspeed = dist/tonumber(speed)

local ts = game:GetService('TweenService')

local part = char.HumanoidRootPart
local ti = TweenInfo.new(tweenspeed, Enum.EasingStyle.Linear)
local tp = {CFrame = CFrame.new(target)}

char.HumanoidRootPart.CFrame = CFrame.new(0, 3000, 0)

local tween = ts:Create(part, ti, tp)

tween.Completed:Connect(function()
    wait(0.5)
	char.HumanoidRootPart.CFrame = CFrame.new(target2.Position)
    char.Humanoid.Jump = true
    wait(0.5)
    char.HumanoidRootPart.CFrame = CFrame.new(target)
end)

tween:Play()
end

repeat
char = game.Players.LocalPlayer.Character
run()
game:FindService("RunService").Heartbeat:wait()
wait(10)
until not game
