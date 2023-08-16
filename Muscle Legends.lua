local rem=game:GetService("Players").LocalPlayer:WaitForChild("bodyMovementEvent");

local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Main");
getgenv().AutoLift=false;
getgenv().AutoPunch=false;
getgenv().KillSelectedTarget=false;
getgenv().KillTarget="";
getgenv().Spinbot=false;
getgenv().CharacterSpinbot=false;
getgenv().AFKSpot=false;
getgenv().HeadDisappear=false;

if(getgenv().insta==nil)then getgenv().insta=0;end;
if(getgenv().insta~=nil)then getgenv().insta+=1;end;
local cinst=getgenv().insta;

--anti afk
if(getgenv().kuefg834rjiy9s83450~=nil)then getgenv().kuefg834rjiy9s83450:Disconnect();end;getgenv().kuefg834rjiy9s83450=game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);wait(1);game:service("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);end);

b:Toggle("Auto Lift",function(a)
    getgenv().AutoLift=a;
    spawn(function()
        while(getgenv().AutoLift==true)and(game:GetService("RunService").Heartbeat:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer("rep");
            end);
        end;
    end);
end);

b:Button("No Punch Cooldown",function()
    local tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Punch"))or(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Punch"));
    tool.attackTime.Value=0;
end);

b:Toggle("Auto Punch",function(a)
    getgenv().AutoPunch=a;
    spawn(function()
        while(getgenv().AutoPunch==true)and(wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer("punch","leftHand");
                game:GetService("RunService").RenderStepped:Wait();
                game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer("punch","rightHand");
            end);
        end;
    end);
end);

b:Toggle("Kill Selected Target",function(a)
    getgenv().KillSelectedTarget=a;
    spawn(function()
        while(getgenv().KillSelectedTarget==true)and(game:GetService("RunService").Heartbeat:Wait())do 
            xpcall(function()
                if(getgenv().KillTarget~=nil)and(getgenv().KillTarget~="")then 
                    local player=game:GetService("Players"):FindFirstChild(getgenv().KillTarget);
                    if(player~=nil)then 
                        if(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LeftHand")~=nil)and(player.Character:FindFirstChild("Head")~=nil)then 
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LeftHand"),player.Character:FindFirstChild("Head"),0);
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LeftHand"),player.Character:FindFirstChild("Head"),1);
                        end;
                        if(game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightHand")~=nil)and(player.Character:FindFirstChild("Head")~=nil)then 
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightHand"),player.Character:FindFirstChild("Head"),0);
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightHand"),player.Character:FindFirstChild("Head"),1);
                        end;
                        if(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LeftHand")~=nil)and(player.Character:FindFirstChild("HumanoidRootPart")~=nil)then 
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LeftHand"),player.Character:FindFirstChild("HumanoidRootPart"),0);
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LeftHand"),player.Character:FindFirstChild("HumanoidRootPart"),1);
                        end;
                        if(game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightHand")~=nil)and(player.Character:FindFirstChild("HumanoidRootPart")~=nil)then 
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightHand"),player.Character:FindFirstChild("HumanoidRootPart"),0);
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightHand"),player.Character:FindFirstChild("HumanoidRootPart"),1);
                        end;
                    end;
                end;
            end,warn);
        end;
    end);
end);
b:Box("Kill Target","string",function(str)
    if(str~="")then 
        for _,k in pairs(game:GetService("Players"):GetPlayers())do 
            if(str:lower()==k.Name:sub(1,#str):lower())and(k.Name~=game:GetService("Players").LocalPlayer.Name)then 
                getgenv().KillTarget=k.Name;
                return;
            end;
        end;
    end;
end);

b:Toggle("Spinbot",function(a)
    getgenv().Spinbot=a;
end);

b:Toggle("Character Spinbot",function(a)
    getgenv().CharacterSpinbot=a;
    spawn(function()
        while(getgenv().CharacterSpinbot==true)and(game:GetService("RunService").Heartbeat:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(80),0);
            end);
        end;
    end);
end);

b:Toggle("AFK Spot",function(a)
    getgenv().AFKSpot=a;
    spawn(function()
        while(getgenv().AFKSpot==true)and(game:GetService("RunService").Heartbeat:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(math.random(10000,1000000),math.random(10000,1000000),math.random(10000,1000000));
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.zero;
            end);
        end;
    end);
end);

b:Toggle("Head Disappear (fe)",function(a)
    getgenv().HeadDisappear=a;
end);

local oldNamecall;oldNamecall=hookmetamethod(game,"__namecall",newcclosure(function(Self,arg1,...)
    local method=getnamecallmethod();
    if(cinst==getgenv().insta)and(Self==rem)and(method=="FireServer")and(arg1~=nil)and(type(arg1)=="number")then 
        if(getgenv().HeadDisappear==true)then 
            arg1=-1000000;
        end;if(getgenv().Spinbot==true)then 
            arg1=math.random(-360,360);
        end;
    end;
    return oldNamecall(Self,arg1,...);
end));
