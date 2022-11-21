local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("Bot");
local h=a:CreateFolder("Annoy");
local b=a:CreateFolder("TP");
local d=a:CreateFolder("Body Position");
local c=a:CreateFolder("Look At");
local f=a:CreateFolder("Closest");
local r=a:CreateFolder("Player");
local v=a:CreateFolder("Kill");
local g=a:CreateFolder("Chat");
getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling=false;
getgenv().IIlIIIIlIllllllIlIIIllllIIllIl="";
getgenv().InputPlrAnnoy="";
getgenv().Annoy=false;
getgenv().InputPlrBP="";
getgenv().FollowBP=false;
getgenv().InputPlrLook="";
getgenv().LookAt=false;
getgenv().FollowClosestBP=false;
getgenv().LookAtClosest=false;
getgenv().Spinbot=false;
getgenv().KillAll=false;
getgenv().KillAuraRange=15;
getgenv().KillAura=false;
getgenv().PlayerToKill="";
getgenv().KillPlayer=false;
getgenv().ChatSpamSettings={ChatSpam=false;SpamText="SPONSORED BY UR MOM";SpamTextTo="All";Timeout=2.2};

--Anti AFK
if(getgenv().kuefg834rjiy983450==nil)then game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new());end);getgenv().kuefg834rjiy983450="nope not cracking this bitch today";end;

-- Infinite Yield Loader
spawn(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))();end);

-- Funcs
function getclosest()
    a=9e9;
    b=nil;
    for _,c in pairs(game:GetService("Players"):GetPlayers())do 
        pcall(function()
            d=(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-c.Character.HumanoidRootPart.Position).Magnitude
            if(d<a)then 
                if(c.Name~=game:GetService("Players").LocalPlayer.Name)then 
                    a=d;b=c;
                end;
            end;
        end);
    end;
    return(b);
end;

-- Main Script
-- Annoy Tab
h:Toggle("Annoy",function(a)
    getgenv().Annoy=a;
    if(getgenv().InputPlrAnnoy=="")then 
        print("Please input a player")
        getgenv().Annoy=false
    end

    if(getgenv().bp~=nil)then getgenv().bp:Destroy();end;if(getgenv().bpc~=nil)then getgenv().bpc:Destroy();end;
    getgenv().bp=Instance.new("BodyPosition");
    getgenv().bp.MaxForce=Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
    getgenv().bp.P=getgenv().bp.P*2;
    getgenv().bp.Position=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    getgenv().bpc=bp:Clone();

    spawn(function()
        while(getgenv().Annoy==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())do 
                    if(a:IsA("BasePart"))then 
                        a.CanCollide=false;
                    end;
                end;
                if(getgenv().bpc==nil)then getgenv().bpc=bp:Clone();end;
                getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
			    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks())do a:Stop(0);end;
                a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                b=game:GetService("Players")[getgenv().InputPlrAnnoy].Character.HumanoidRootPart.Position;
                c=game:GetService("Players")[getgenv().InputPlrAnnoy].Character.HumanoidRootPart.Velocity;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
                wait();
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,b);
                getgenv().bpc.Position=b;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(c.X,0,c.Z);
            end);
        end;
        
        wait();
        game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
        getgenv().bpc:Destroy();
        getgenv().bp:Destroy();
    end);

    spawn(function()
        while(getgenv().Annoy==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                local a=game:GetService("Players")[getgenv().InputPlrAnnoy].Character.HumanoidRootPart.Position;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(a.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y,a.Z));
            end);
        end;
    end);
    
    spawn(function()
        while(getgenv().Annoy==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Players")[getgenv().InputPlrAnnoy].Character.HumanoidRootPart.Position);
            end);
        end;
    end);
end);

h:Box("Player to Annoy","string",function(str)
    if(str=="")then 
        print("Please enter a player name");
    else 
        for _,k in pairs(game:GetService("Players"):GetPlayers())do 
            if(str:lower()==k.Name:sub(1,#str):lower())then 
                getgenv().InputPlrAnnoy=k.Name;
                if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrAnnoy)~=nil)then print("Target Chosen as "..getgenv().InputPlrAnnoy);end;
                return;
            end;
        end;
        if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrAnnoy)==nil)then print("Inputed player could not be found");getgenv().InputPlrAnnoy="";end;
    end;
end);

-- TP Tab
b:Toggle("Follow player",function(bool)
    getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling=bool;
    if(getgenv().IIlIIIIlIllllllIlIIIllllIIllIl=="")then 
        print("Please input a player")
        getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling=false
    end
    spawn(function()
        while(getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling==true)and(game:GetService("RunService").Stepped:Wait())do
            if(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Sit==true)then
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Jump=true
            end

            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame=game:GetService("Players")[getgenv().IIlIIIIlIllllllIlIIIllllIIllIl].Character:WaitForChild("HumanoidRootPart").CFrame*CFrame.new(0,0,15)
            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Velocity=Vector3.new(0,0,0)

            if(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Sit==true)then
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Jump=true
            end
        end
    end)
end);

b:Box("Player to Follow","string",function(str)
    if(str=="")then 
        print("Please enter a player name");
    else 
        for _,k in pairs(game:GetService("Players"):GetPlayers())do 
            if(str:lower()==k.Name:sub(1,#str):lower())then 
                getgenv().IIlIIIIlIllllllIlIIIllllIIllIl=k.Name;
                if(game:GetService("Players"):FindFirstChild(getgenv().IIlIIIIlIllllllIlIIIllllIIllIl)~=nil)then print("Target Chosen as "..getgenv().IIlIIIIlIllllllIlIIIllllIIllIl);end;
                return;
            end;
        end;
        if(game:GetService("Players"):FindFirstChild(getgenv().IIlIIIIlIllllllIlIIIllllIIllIl)==nil)then print("Inputed player could not be found");getgenv().IIlIIIIlIllllllIlIIIllllIIllIl="";end;
    end;
end);

-- Body Position Tab
d:Toggle("Follow",function(a)
    getgenv().FollowBP=a;
    if(getgenv().InputPlrBP=="")then 
        print("Please input a player")
        getgenv().FollowBP=false
    end

    if(getgenv().bp~=nil)then getgenv().bp:Destroy();end;if(getgenv().bpc~=nil)then getgenv().bpc:Destroy();end;
    getgenv().bp=Instance.new("BodyPosition");
    getgenv().bp.MaxForce=Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
    getgenv().bp.P=getgenv().bp.P*2;
    getgenv().bp.Position=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    getgenv().bpc=bp:Clone();

    spawn(function()
        while(getgenv().FollowBP==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())do 
                    if(a:IsA("BasePart"))then 
                        a.CanCollide=false;
                    end;
                end;
                if(getgenv().bpc==nil)then getgenv().bpc=bp:Clone();end;
                getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                if(game:GetService("Players").LocalPlayer.Character.Humanoid.Seated==false)then 
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
                    game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Seated==true)then 
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
                    game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                end;
                b=game:GetService("Players")[getgenv().InputPlrBP].Character.HumanoidRootPart.Position;
                c=game:GetService("Players")[getgenv().InputPlrBP].Character.HumanoidRootPart.Velocity;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,b);
                getgenv().bpc.Position=b;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(c.X,0,c.Z);
            end);
        end;
        
        wait();
        game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
        getgenv().bpc:Destroy();
        getgenv().bp:Destroy();
    end);
end);

d:Box("Player to Follow","string",function(str)
    if(str=="")then 
        print("Please enter a player name");
    else 
        for _,k in pairs(game:GetService("Players"):GetPlayers())do 
            if(str:lower()==k.Name:sub(1,#str):lower())then 
                getgenv().InputPlrBP=k.Name;
                if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrBP)~=nil)then print("Target Chosen as "..getgenv().InputPlrBP);end;
                return;
            end;
        end;
        if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrBP)==nil)then print("Inputed player could not be found");getgenv().InputPlrBP="";end;
    end;
end);

-- Look At Tab
c:Toggle("Look At",function(a)
    getgenv().LookAt=a;
    if(getgenv().InputPlrLook=="")then 
        print("Please input a player")
        getgenv().LookAt=false
    end

    spawn(function()
        while(getgenv().LookAt==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                b=game:GetService("Players"):FindFirstChild(getgenv().InputPlrLook).Character.HumanoidRootPart.Position
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
            end);
        end;
    end);
end)

c:Box("Player to Look At","string",function(str)
    if(str=="")then 
        print("Please enter a player name");
    else 
        for _,k in pairs(game:GetService("Players"):GetPlayers())do 
            if(str:lower()==k.Name:sub(1,#str):lower())then 
                getgenv().InputPlrLook=k.Name;
                if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrLook)~=nil)then print("Target Chosen as "..getgenv().InputPlrLook);end;
                return;
            end;
        end;
        if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrLook)==nil)then print("Inputed player could not be found");getgenv().InputPlrLook="";end;
    end;
end);

-- Closest Tab
f:Toggle("Follow Closest",function(a)
    getgenv().FollowClosestBP=a;

    if(getgenv().bp~=nil)then getgenv().bp:Destroy();end;if(getgenv().bpc~=nil)then getgenv().bpc:Destroy();end;
    getgenv().bp=Instance.new("BodyPosition");
    getgenv().bp.MaxForce=Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
    getgenv().bp.P=getgenv().bp.P*2;
    getgenv().bp.Position=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    getgenv().bpc=bp:Clone();

    spawn(function()
        while(getgenv().FollowClosestBP==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                if(getgenv().bpc==nil)then getgenv().bpc=bp:Clone();end;
                getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
			    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks())do a:Stop(0);end;
                a=getclosest();
                b=a.Character.HumanoidRootPart.Position;
                c=a.Character.HumanoidRootPart.Velocity;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,b);
                getgenv().bpc.Position=b;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(c.X,0,c.Z);
            end);
        end;
        
        wait();
        game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
        getgenv().bpc:Destroy();
        getgenv().bp:Destroy();
    end);
end)

f:Toggle("Look At Closest",function(a)
    getgenv().LookAtClosest=a;
    spawn(function()
        while(getgenv().LookAtClosest==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                b=getclosest().Character.HumanoidRootPart.Position
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
            end);
        end;
    end);
end);

-- Player Tab
r:Toggle("Spinbot",function(a)
    getgenv().Spinbot=a;
    print(a);
    spawn(function()
        while(getgenv().Spinbot==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(90),0);end);
        end;
    end);
end);

v:Toggle("Kill Aura",function(a)
    getgenv().KillAura=a;
    print(a);
    spawn(function()
        while(getgenv().KillAura==true)and(game:GetService("RunService").Stepped:Wait())do 
            for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                pcall(function()
                    if((a.Character.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=getgenv().KillAuraRange)and(a.Name~=game:GetService("Players").LocalPlayer.Name)and(a.Character.Humanoid.Health>0)and(a.Character.Humanoid.Health~=math.huge)then 
                        local tool=game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")or(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sword"));
                        if(tool)and(tool:FindFirstChild("Handle"))then 
                            for _,a in pairs(a.Character:GetChildren())do 
                                if(a:IsA("BasePart"))then 
                                    firetouchinterest(tool.Handle,a,0);
                                    firetouchinterest(tool.Handle,a,1);
                                end;
                            end;
                        end;
                    end;
                end);
            end;
        end;
    end);
end);

v:Slider("Kill Aura Range",{min=1;max=1000;precise=false},function(a)getgenv().KillAuraRange=a;end);

v:Box("Player to Loop Kill","string",function(str)
    if(str=="")then 
        print("Please enter a player name");
    else 
        for _,k in pairs(game:GetService("Players"):GetPlayers())do 
            if(str:lower()==k.Name:sub(1,#str):lower())then 
                getgenv().PlayerToKill=k.Name;
                if(game:GetService("Players"):FindFirstChild(getgenv().PlayerToKill)~=nil)then print("Target Chosen as "..getgenv().PlayerToKill);end;
                return;
            end;
        end;
        if(game:GetService("Players"):FindFirstChild(getgenv().PlayerToKill)==nil)then print("Inputed player could not be found");getgenv().PlayerToKill="";end;
    end;
end);

v:Toggle("Loop Kill",function(a)
    getgenv().KillPlayer=a;
    print(a);
    if(getgenv().PlayerToKill=="")then 
        print("Please input a player");
        getgenv().KillPlayer=false;
    end;
    spawn(function()
        while(getgenv().KillPlayer==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                local tool=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")or(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sword"));
                for _,a in pairs(game:GetService("Players")[getgenv().PlayerToKill].Character:GetChildren())do 
                    if(a:IsA("BasePart"))then 
                        firetouchinterest(tool.Handle,a,0);firetouchinterest(tool.Handle,a,1);
                    end;
                end;
            end);
        end;
    end);
end);

-- Chat Tab
g:Box("Text to Spam","string",function(a)getgenv().ChatSpamSettings.SpamText=a;end);
g:Box("Text Spam To Who","string",function(a)getgenv().ChatSpamSettings.SpamTextTo=a;end);
g:Box("Text Timeout","number",function(a)getgenv().ChatSpamSettings.Timeout=a;end);

g:Toggle("Spam",function(a)
    getgenv().ChatSpamSettings.ChatSpam=a;
    print(a);
    spawn(function()
        while(getgenv().ChatSpamSettings.ChatSpam==true)and(wait())do 
            pcall(function()game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().ChatSpamSettings.SpamText,getgenv().ChatSpamSettings.SpamTextTo);end);
            wait(getgenv().ChatSpamSettings.Timeout);
        end;
    end);
end);

g:Button("Bypasser",function()
    getgenv().method="fn";
    if(getgenv().BypasserLoaded==nil)or(getgenv().BypasserLoaded==false)then 
        spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/daddysyn/synergy/additional/betterbypasser",true))();getgenv().BypasserLoaded=true;end);
    end;
end);
