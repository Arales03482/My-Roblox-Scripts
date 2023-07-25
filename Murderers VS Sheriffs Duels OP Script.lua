local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Main");
local auto_equip_selected="Gun";
local auto_queue_gamemode="Classic";
local auto_queue_vs_mode=2;
getgenv().AutoKillGun=false;
getgenv().AutoKillKnife=false;
getgenv().AutoEquipGun=false;
getgenv().AutoEquipKnife=false;
getgenv().AutoClassicSelect=false;
getgenv().AutoEquip=false;
getgenv().AutoQueue=false;

local tags=require(game:GetService("ReplicatedStorage").Modules.Tags);

--anti afk
if(getgenv().kuefg834rjiy983450~=nil)then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);wait(1);game:service("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);end);

b:Toggle("Auto Kill Gun",function(a)
    getgenv().AutoKillGun=a;
    spawn(function()
        while(getgenv().AutoKillGun==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                    if(a.Name~="ARealPerson29Mobile")and(a.Name~="ARealPerson29")and(a.Name~="ARealPerson25")and(a.Character~=nil)and(a.Character:IsDescendantOf(game)==true)and(a.Character:FindFirstChildWhichIsA("Humanoid")~=nil)and(a.Character:FindFirstChildWhichIsA("Humanoid").Health>=1)and(a.Team~=game:GetService("Players").LocalPlayer.Team)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")~=nil)and(game:GetService("CollectionService"):HasTag(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"),tags.GUN_TOOL)~=nil)then 
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Shoot"):FireServer(a.Character.HumanoidRootPart.Part.Position,a.Character.HumanoidRootPart.Part.Position,a.Character.HumanoidRootPart.Part,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position);
                    end;
                end;
            end);
        end;
    end);
end);

b:Toggle("Auto Kill Knife",function(a)
    getgenv().AutoKillKnife=a;
    spawn(function()
        while(getgenv().AutoKillKnife==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                    if(a.Name~="ARealPerson29Mobile")and(a.Name~="ARealPerson29")and(a.Name~="ARealPerson25")and(a.Character~=nil)and(a.Character:IsDescendantOf(game)==true)and(a.Character:FindFirstChildWhichIsA("Humanoid")~=nil)and(a.Character:FindFirstChildWhichIsA("Humanoid").Health>=1)and(a.Team~=game:GetService("Players").LocalPlayer.Team)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")~=nil)and(game:GetService("CollectionService"):HasTag(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"),tags.KNIFE_TOOL)~=nil)then 
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Stab"):FireServer(a.Character.HumanoidRootPart);
                    end;
                end;
            end);
        end;
    end);
end);

local maping={
    ["Gun"]="GUN_TOOL",
    ["Knife"]="KNIFE_TOOL",
};
local maping2={
    ["GUN_TOOL"]="Sheriff",
    ["KNIFE_TOOL"]="Murderer",
};
b:Toggle("Auto Classic Select",function(a)
    getgenv().AutoClassicSelect=a;
    spawn(function()
        while(getgenv().AutoClassicSelect==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                if(game:GetService("Players").LocalPlayer.Team~=nil)then 
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("OnRoleSelection"):FireServer(maping2[auto_equip_selected]);
                    game:GetService("Players").LocalPlayer.PlayerGui.RoleSelection.Enabled=false;
                end;
            end);
        end;
    end);
end);
b:Toggle("Auto Equip",function(a)
    getgenv().AutoEquip=a;
    spawn(function()
        while(getgenv().AutoEquip==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren())do 
                    if(game:GetService("CollectionService"):HasTag(a,tags[auto_equip_selected])~=nil)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")~=a)then 
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(a);
                    end;
                end;
            end);
        end;
    end);
end);
b:Dropdown("Auto Equip Selected",{"Gun","Knife"},true,function(a)
    auto_equip_selected=maping[a];
end);

b:Toggle("Auto Queue",function(a)
    getgenv().AutoQueue=a;
    spawn(function()
        while(getgenv().AutoQueue==true)and(game:GetService("RunService").Stepped:Wait())do 
            xpcall(function()
                if(game:GetService("Players").LocalPlayer.Team==nil)then 
                    local place=nil;
                    for _,a in pairs(game:GetService("Workspace"):GetChildren())do 
                        if(a:IsA("Folder"))and(a.Name=="Folder")and(place==nil)then 
                            for _,a in pairs(a:GetChildren())do 
                                if(a:IsA("Folder"))and(a.Name=="Folder")and(place==nil)and(a:FindFirstChild("MatchContainer")~=nil)and(a:FindFirstChild("MatchContainer"):GetAttribute("Gamemode")==auto_queue_gamemode)and((a:FindFirstChild("MatchContainer"):GetAttribute("MinPlayerCount")==auto_queue_vs_mode)or((a:FindFirstChild("MatchContainer"):GetAttribute("MinPlayerCount")==nil)and(auto_queue_vs_mode==2)))then 
                                    for _,a in pairs(a:FindFirstChild("MatchContainer"):GetChildren())do 
                                        if(a:IsA("BasePart"))and(a.Name=="Stand")and(place==nil)then 
                                            for _,a in pairs(a:GetChildren())do 
                                                if(a:IsA("ObjectValue"))and(a.Name=="StandCharacter")and(place==nil)and((a.Value==nil)or(a.Value==game:GetService("Players").LocalPlayer))then 
                                                    place=a.Parent.Ring.Position+Vector3.new(0,2.5,0);
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if(place~=nil)then 
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(place);
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.zero;
                    end;
                end;
            end,warn);
        end;
    end);
end);
b:Dropdown("Auto Queue Mode",{"Classic","Duality"},true,function(a)
    auto_queue_gamemode=a;
end);
b:Dropdown("Auto Queue VS Mode",{"1","2","4"},true,function(a)
    auto_queue_vs_mode=tonumber(a)+tonumber(a);
end);
