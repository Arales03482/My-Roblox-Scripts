local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dsc/CanyInfsGG");
local b=a:CreateFolder("Main");
getgenv().GetMallows=false;
getgenv().OpenChests=false;
getgenv().ChestTweenCompleted=false;

-- Loaders
-- Anti AFK
if(getgenv().kuefg834rjiy983450==nil)then game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new());end);getgenv().kuefg834rjiy983450="nope not cracking this bitch today";end;

-- Infinite Yield Loader
spawn(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))();end);

-- Funcs
function getClosestChest(prevChest)
    local range=9e9;
    local chest=nil;
    for _,cChest in pairs(game:GetService("Workspace").Scenery.Chests.ChestObjects:GetChildren())do 
        if(cChest.Name=="Chest")and(cChest:IsA("Model"))and(cChest~=prevChest)and(cChest:FindFirstChild("Hitbox")~=nil)and(cChest.Hitbox:FindFirstChild("TouchInterest")~=nil)and(cChest:FindFirstChild("Open")~=nil)and(cChest:FindFirstChild("Open").Value==false)then 
            local dist=(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"]-cChest["Hitbox"]["Position"])["Magnitude"];
            if(dist<range)then 
                range=dist;
                chest=cChest;
            end;
        end;
    end;
    if(chest==nil)then chest=game:GetService("Workspace").Scenery.Chests.ChestObjects:FindFirstChild("Chest");end;
    return(chest);
end;

b:Button("Move Stuff",function()
    spawn(function()
        game:GetService("ReplicatedStorage").Events.ItemPlacement.RemoteEvent:FireServer("PlaceItem","TentCurveGreen",CFrame.new(Vector3.new(-2798,230.7,-3368.5)),"tents");
        game:GetService("ReplicatedStorage").Events.ItemPlacement.RemoteEvent:FireServer("PlaceItem","MallowMachine",CFrame.new(Vector3.new(-2798,230,-3368.5)),"campingItems");
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-2798,230,-3368.5));
    end);
end);

b:Toggle("Auto Collect Mallows",function(a)
    getgenv().GetMallows=a;
    print(a);
    spawn(function()
        while(getgenv().GetMallows==true)and(game:GetService("RunService").Stepped:Wait())do 
            for _,k in pairs(game.Workspace.PlayerCampingItems:WaitForChild(game:GetService("Players").LocalPlayer.Name):GetChildren())do 
                if(k.Name=="MallowMachine")then 
                    k:WaitForChild("MallowScript"):WaitForChild("RetrieveEvent"):FireServer(math.random(1,100000));
                end;
            end;
        end;
    end);
end);

b:Toggle("Auto Open Chests",function(a)
    getgenv().OpenChests=a;
    print(a);
    local done=false;
    spawn(function()
        local oldCF;pcall(function()oldCF=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;end);
        local prevChest=nil;
        while(getgenv().ChestTweenCompleted==false)do wait();end;
        while(getgenv().OpenChests==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                getgenv().ChestTweenCompleted=false;
                local chest=getClosestChest(prevChest);
                prevChest=chest;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=chest.Hitbox.CFrame*CFrame.new(0,0,-60);
                local info=TweenInfo.new(0.7,Enum.EasingStyle.Linear);
                local a=game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,info,{CFrame=chest.Hitbox.CFrame});
                a.Completed:Connect(function()getgenv().ChestTweenCompleted=true;end);
                a:Play();
                while(getgenv().ChestTweenCompleted==false)do wait();end;
                wait(0.6);
            end);
        end;
        pcall(function()
            done=true;
            wait();
            game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=oldCF;
        end);
    end);

    spawn(function()
        while((getgenv().OpenChests==true)or(done==false))and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==false)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
                elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks())do a:Stop(0);end;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0);
            end);
        end;
    end);
end);
