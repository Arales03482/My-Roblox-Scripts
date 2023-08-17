local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Main");
getgenv().AutoClick=false;
getgenv().AutoClickZombie=false;
getgenv().AutoBeastMode=false;
getgenv().AutoCollectGems=false;
getgenv().AutoCollectGemsAlt=false;
getgenv().AutoRebirth=false;
getgenv().AutoRebirthAmount=1;
getgenv().AutoSuperRebirth=false;
getgenv().AutoSuperRebirthAmount=1;
getgenv().AutoBuySelectedPet=false;
getgenv().AutoBuyPet="basic";
getgenv().NoPopupEffects=false;

--anti afk
if(getgenv().kuefg834rjiy9s83450~=nil)then getgenv().kuefg834rjiy9s83450:Disconnect();end;getgenv().kuefg834rjiy9s83450=game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);wait(1);game:service("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);end);

local rebirth_map={
    ["1"]=1,
    ["10"]=10,
    ["100"]=100,
    ["1k"]=1000,
    ["10k"]=10000,
    ["100k"]=100000,
    ["1M"]=1000000,
    ["10M"]=10000000,
    ["100M"]=100000000,
    ["1B"]=1000000000,
    ["10B"]=10000000000,
};
local rebirth_selection={"1","10","100","1k","10k","100k","1M","10M","100M","1B","10B"};
local pet_selection={"desert","lava","toxic","ocean","winter","storm","forest","candy","space","blocky","fire","premium","deluxe","omega","dominus","future","infinity","city","basic","impostor","moon","halloween"};

b:Toggle("Auto Click",function(a)
    getgenv().AutoClick=a;
    spawn(function()
        while(getgenv().AutoClick==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("ClickService"):WaitForChild("Click"):FireServer(math.huge);
            end);
        end;
    end);
end);

b:Toggle("Auto Click Zombie",function(a)
    getgenv().AutoClickZombie=a;
    spawn(function()
        while(getgenv().AutoClickZombie==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("CursorCannonService"):WaitForChild("FireBoss"):FireServer("Zombie");
            end);
        end;
    end);
end);

b:Toggle("Auto Click Players",function(a)
    getgenv().AutoClickPlayers=a;
    spawn(function()
        while(getgenv().AutoClickPlayers==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                    if(a~=game:GetService("Players").LocalPlayer)and(a:FindFirstChild("Flags")~=nil)and(a:FindFirstChild("Flags"):FindFirstChild("InSafezone")~=nil)and(a:FindFirstChild("Flags"):FindFirstChild("InSafezone").Value==false)then 
                        game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("CursorCannonService"):WaitForChild("FireCursor"):FireServer(a);
                    end;
                end;
            end);
        end;
    end);
end);

b:Toggle("Auto Beast Mode",function(a)
    getgenv().AutoBeastMode=a;
    spawn(function()
        while(getgenv().AutoBeastMode==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("BeastModeService"):WaitForChild("Begin"):FireServer();
            end);
        end;
    end);
end);

b:Toggle("Auto Collect Gems",function(a)
    getgenv().AutoCollectGems=a;
    spawn(function()
        local old=game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame;
        while(getgenv().AutoCollectGems==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Workspace").ScriptObjects:GetChildren())do 
                    if(getgenv().AutoCollectGems==true)and(a:IsA("Model"))and(a.Name=="BasePickup")and(game:GetService("Players").LocalPlayer.Character~=nil)and(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")~=nil)and(a:FindFirstChild("HumanoidRootPart")~=nil)and(a:FindFirstChild("HumanoidRootPart"):FindFirstChildWhichIsA("TouchTransmitter")~=nil)then 
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame=a:FindFirstChild("HumanoidRootPart").CFrame;
                        wait(0.2);
                    end;
                end;
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame=old;
            end);
        end;
    end);
end);

b:Toggle("Auto Collect Gems Alt (may crash)",function(a)
    getgenv().AutoCollectGemsAlt=a;
    spawn(function()
        while(getgenv().AutoCollectGemsAlt==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Workspace").ScriptObjects:GetChildren())do 
                    if(a:IsA("Model"))and(a.Name=="BasePickup")and(game:GetService("Players").LocalPlayer.Character~=nil)and(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")~=nil)and(a:FindFirstChild("HumanoidRootPart")~=nil)and(a:FindFirstChild("HumanoidRootPart"):FindFirstChildWhichIsA("TouchTransmitter")~=nil)then 
                        firetouchinterest(a:FindFirstChild("HumanoidRootPart"):FindFirstChildWhichIsA("TouchTransmitter"),game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),0);
                        firetouchinterest(a:FindFirstChild("HumanoidRootPart"):FindFirstChildWhichIsA("TouchTransmitter"),game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),1);
                    end;
                end;
            end);
        end;
    end);
end);

b:Toggle("Auto Rebirth",function(a)
    getgenv().AutoRebirth=a;
    spawn(function()
        while(getgenv().AutoRebirth==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(getgenv().AutoRebirthAmount);
            end);
        end;
    end);
end);
b:Dropdown("Auto Rebirth Amount",rebirth_selection,true,function(a)
    getgenv().AutoRebirthAmount=rebirth_map[a];
end);

b:Toggle("Auto Super Rebirth",function(a)
    getgenv().AutoSuperRebirth=a;
    spawn(function()
        while(getgenv().AutoSuperRebirth==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuySuperRebirths"):FireServer(getgenv().AutoSuperRebirthAmount);
            end);
        end;
    end);
end);
b:Dropdown("Auto Super Rebirth Amount",rebirth_selection,true,function(a)
    getgenv().AutoSuperRebirthAmount=rebirth_map[a];
end);

b:Toggle("Auto Buy Selected Pet",function(a)
    getgenv().AutoBuySelectedPet=a;
    spawn(function()
        while(getgenv().AutoBuySelectedPet==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer(getgenv().AutoBuyPet);
            end);
        end;
    end);
end);
b:Button("Buy Selected Pet Once",function()
    game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer(getgenv().AutoBuyPet);
end);
b:Dropdown("Auto Buy Pet",pet_selection,true,function(a)
    getgenv().AutoBuyPet=a;
end);

b:Toggle("No Popup Effects",function(a)
    getgenv().NoPopupEffects=a;
    spawn(function()
        while(getgenv().NoPopupEffects==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.PopupEffects:ClearAllChildren();
            end);
        end;
    end);
end);
