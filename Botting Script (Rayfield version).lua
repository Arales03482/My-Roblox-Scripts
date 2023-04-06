-- Cache
local game,loadstring,getgenv,spawn,pcall,xpcall,ypcall,print,warn,error,request,http_request,http,syn=
    game,loadstring,getgenv,spawn,pcall,xpcall,ypcall,print,warn,error,request,http_request,http,syn;

-- Main
local t=loadstring(game:HttpGet("https://raw.githubusercontent.com/Bacon42069/My-Roblox-Scripts/main/Bacon%20Utils/src.lua"))();
local gui=loadstring(game:HttpGet('https://raw.githubusercontent.com/Bacon42069/Rayfield/main/source'))();
local win=gui:CreateWindow({
    Name="Bot",
    LoadingTitle="Bot Script",
    LoadingSubtitle="by ARealer#8020",
    ConfigurationSaving={
       Enabled=false,
       FolderName=nil,
       FileName="BotScriptByARealer_8020"
    },
    Discord={
       Enabled=false,
       Invite="noinvitelink",
       RememberJoins=true
    },
    KeySystem=false,
    KeySettings={
       Title="Bot",
       Subtitle="what",
       Note="huh????",
       FileName="NO",
       SaveKey=false,
       GrabKeyFromSite=false,
       Key=""
    }
});
local b=win:CreateTab("TP",0);
local d=win:CreateTab("Body Position",0);
local c=win:CreateTab("Look At",0);
local h=win:CreateTab("Annoy",0);
local j=win:CreateTab("Car Annoy",0);
local u=win:CreateTab("Circle",0);
local f=win:CreateTab("Closest",0);
local l=win:CreateTab("Other Players",0);
local r=win:CreateTab("Player",0);
local v=win:CreateTab("Kill",0);
local g=win:CreateTab("Chat",0);
local s=win:CreateTab("Loaders",0);
local i=win:CreateTab("GUI",0);
getgenv().lIlIlIIIIIIIIllIIlIIIIllIlIlIIbingchiling=false;
getgenv().IIlIIIIlIllllllIlIIIllllIIllIl="";
getgenv().InputPlrBP="";
getgenv().FollowBP=false;
getgenv().InputPlrLook="";
getgenv().LookAt=false;
getgenv().InputPlrAnnoy="";
getgenv().LookAtEmote="";
getgenv().Annoy=false;
getgenv().InputPlrCarAnnoy="";
getgenv().CarAnnoy=false;
getgenv().bavMulti=1;
getgenv().FollowClosestBP=false;
getgenv().LookAtClosest=false;
getgenv().LookAtClosestEmote="";
getgenv().NoclipOthers=false;
getgenv().NoclipOthersAura=false;
getgenv().NoclipOthersAuraRange=10;
getgenv().CirclePlayer=false;
getgenv().CircleSpeed=10/20;
getgenv().CircleDistance=20;
getgenv().CircleHeight=1;
getgenv().InputPlrCircle="";
getgenv().Spinbot=false;
getgenv().Noclip=false;
getgenv().KillAuraRange=15;
getgenv().KillAura=false;
getgenv().PlayerToKill="";
getgenv().KillPlayer=false;
getgenv().KillAll=false;
getgenv().Method1=false;
getgenv().AutoTP=false;
getgenv().ChatSpamSettings={ChatSpam=false;SpamText="SPONSORED BY UR MOM";SpamTextTo="All";Timeout=2.2};

--Anti AFK
if(getgenv().kuefg834rjiy983450==nil)then game:GetService("Players").LocalPlayer.Idled:Connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new());end);getgenv().kuefg834rjiy983450="nope not cracking this bitch today";end;

--Walkspeed Init
if(getgenv().wsran==nil)or(getgenv().wsran==false)then getgenv().wsran=true;getgenv().ws=16;spawn(function()while(getgenv().wsran==true)and(game:GetService("RunService").Stepped:Wait())do pcall(function()game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed=getgenv().ws;end);end;end);end;

-- Funcs
local function getclosest()
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

local function getClosestPlayer()
    local range=9e9;
    local plr=nil;
    pcall(function()
        for _,cPlr in pairs(game:GetService("Players"):GetPlayers())do 
            if(cPlr.Name~="AZ16ke")and(cPlr.Name~="Schimpanskyy")and(cPlr.Name~="ARealPerson29")and(cPlr.Character~=nil)and(cPlr.Character:FindFirstChildWhichIsA("ForceField")==nil)and(cPlr.Name~=game:GetService("Players").LocalPlayer.Name)and(cPlr.Character.Humanoid.Health>0)and(cPlr.Character.Humanoid.Health~=math.huge)then 
                if(game.PlaceId==11756661207)then 
                    local dist=(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"]-cPlr["Character"]["HumanoidRootPart"]["Position"])["magnitude"];
                    if(dist<range)then 
                        range=dist;
                        plr=cPlr;
                    end;
                elseif(game.PlaceId~=11756661207)and(((cPlr.Team~=game:GetService("Players").LocalPlayer.Team)and(cPlr.Team~=game:GetService("Teams"):FindFirstChild("Not Playing"))and(cPlr.Neutral==false))or(cPlr.Neutral==true))then 
                    local dist=(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"]-cPlr["Character"]["HumanoidRootPart"]["Position"])["magnitude"];
                    if(dist<range)then 
                        range=dist;
                        plr=cPlr;
                    end;
                end;
            end;
        end;
    end);
    return(plr);
end;

-- Main Script
-- TP Tab
b:CreateToggle({
    Name="Follow player",
    CurrentValue=false,
    Flag="FollowPlayer",
    Callback=function(bool)
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
    end;
});

b:CreateInput({
    Name="Player to Follow",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(str)
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
    end;
});

-- Body Position Tab
d:CreateToggle({
    Name="Follow",
    CurrentValue=false,
    Flag="Follow",
    Callback=function(a)
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
    end;
});

d:CreateInput({
    Name="Player to Follow",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(str)
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
    end;
});

-- Look At Tab
c:CreateToggle({
    Name="Look At",
    CurrentValue=false,
    Flag="LookAt",
    Callback=function(a)
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
                    game:GetService("Players").LocalPlayer.Character.Animate.PlayEmote:Invoke(getgenv().LookAtEmote);
                end);
            end;
        end);
    end;
})
c:CreateInput({
    Name="Emote To Play While Looking At Player",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(_)
        getgenv().LookAtEmote=_;
    end;
});
c:CreateInput({
    Name="Player to Look At",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(str)
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
end});

-- Annoy Tab
h:CreateToggle({
    Name="Annoy",
    CurrentValue=false,
    Flag="Annoy",
    Callback=function(a)
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
    end;
});
h:CreateInput({
    Name="Player to Annoy",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(str)
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
    end;
});

-- Car Annoy Tab
if(game.PlaceId==4924922222)then 
    j:CreateToggle({
        Name="Car Annoy (brookhaven warning extreme shake)",
        CurrentValue=false,
        Flag="CarAnnoy",
        Callback=function(a)
            getgenv().CarAnnoy=a;
            if(getgenv().InputPlrCarAnnoy=="")then 
                print("Please input a player");
                getgenv().CarAnnoy=false;
            end;

            if(getgenv().bp~=nil)then getgenv().bp:Destroy();end;if(getgenv().bpc~=nil)then getgenv().bpc:Destroy();end;
            if(getgenv().bav~=nil)then getgenv().bav:Destroy();end;if(getgenv().bavc~=nil)then getgenv().bavc:Destroy();end;
            getgenv().bp=Instance.new("BodyPosition");
            getgenv().bav=Instance.new("BodyAngularVelocity");
            getgenv().bp.MaxForce=Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
            getgenv().bp.P=getgenv().bp.P*2;
            getgenv().bp.Position=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position;
            getgenv().bav.AngularVelocity=t["RndVec3"](-10,10)*getgenv().bavMulti;
            getgenv().bav.MaxTorque=Vector3.new(math.huge,math.huge,math.huge);
            getgenv().bav.P=math.huge;
            getgenv().bpc=getgenv().bp:Clone();
            getgenv().bavc=getgenv().bav:Clone();

            spawn(function()
                while(getgenv().CarAnnoy==true)and(game:GetService("RunService").Stepped:Wait())do 
                    pcall(function()
                        for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                            if(__:IsA("BasePart"))then 
                                __["CanCollide"]=false;
                            end;
                        end;
                        if(getgenv().bpc==nil)then getgenv().bpc=getgenv().bp:Clone();end;
                        if(getgenv().bavc==nil)then getgenv().bavc=getgenv().bav:Clone();end;
                        getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                        getgenv().bavc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                        getgenv().bavc.AngularVelocity=t["RndVec3"](-10,10)*getgenv().bavMulti;
                        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                        a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position;
                        b=game:GetService("Players")[getgenv().InputPlrCarAnnoy].Character.HumanoidRootPart.Position;
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
                        getgenv().bpc.Position=b;
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0);
                    end);
                end;
                
                wait();
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
                getgenv().bp:Destroy();
                getgenv().bav:Destroy();
                getgenv().bpc:Destroy();
                getgenv().bavc:Destroy();
            end);
        end;
    });

    j:CreateInput({
        Name="Player to Car Annoy",
        PlaceholderText="",
        RemoveTextAfterFocusLost=false,
        Callback=function(str)
            if(str=="")then 
                warn("Please enter a player name");
            else 
                for _,k in pairs(game:GetService("Players"):GetPlayers())do 
                    if(str:lower()==k.Name:sub(1,#str):lower())then 
                        getgenv().InputPlrCarAnnoy=k.Name;
                        if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrCarAnnoy)~=nil)then print("Target Chosen as "..getgenv().InputPlrCarAnnoy);end;
                        return;
                    end;
                end;
                if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrCarAnnoy)==nil)then print("Inputed player could not be found");getgenv().InputPlrCarAnnoy="";end;
            end;
        end;
    });
    j:CreateInput({
        Name="Angular Multiplier",
        PlaceholderText="",
        RemoveTextAfterFocusLost=false,
        Callback=function(_)
            if(tonumber(_)~=nil)then 
                getgenv().bavMulti=tonumber(_);
            end;
        end;
    });
    j:CreateButton({
        Name="Noclip Car",
        Callback=function()
            local car=game:GetService("Workspace").Vehicles:FindFirstChild(game:GetService("Players").LocalPlayer.Name.."Car");
            if(car~=nil)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit==true)then 
                for _,__ in pairs(car:GetDescendants())do 
                    if(__:IsA("BasePart"))and(__["CanCollide"]==true)then 
                        __["CanCollide"]=false;
                    end;
                end;
            end;
        end;
    });
else 
    j:CreateToggle({
        Name="Car Annoy",
        CurrentValue=false,
        Flag="CarAnnoy",
        Callback=function(a)
            getgenv().CarAnnoy=a;
            if(getgenv().InputPlrCarAnnoy=="")then 
                print("Please input a player");
                getgenv().CarAnnoy=false;
            end;

            if(getgenv().bp~=nil)then getgenv().bp:Destroy();end;if(getgenv().bpc~=nil)then getgenv().bpc:Destroy();end;
            if(getgenv().bav~=nil)then getgenv().bav:Destroy();end;if(getgenv().bavc~=nil)then getgenv().bavc:Destroy();end;
            getgenv().bp=Instance.new("BodyPosition");
            getgenv().bav=Instance.new("BodyAngularVelocity");
            getgenv().bp.MaxForce=Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
            getgenv().bp.P=getgenv().bp.P*2;
            getgenv().bp.Position=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position;
            getgenv().bav.AngularVelocity=t["RndVec3"](-10,10)*getgenv().bavMulti;
            getgenv().bav.MaxTorque=Vector3.new(math.huge,math.huge,math.huge);
            getgenv().bav.P=math.huge;
            getgenv().bpc=getgenv().bp:Clone();
            getgenv().bavc=getgenv().bav:Clone();

            spawn(function()
                while(getgenv().CarAnnoy==true)and(game:GetService("RunService").Stepped:Wait())do 
                    pcall(function()
                        for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                            if(__:IsA("BasePart"))then 
                                __["CanCollide"]=false;
                            end;
                        end;
                        if(getgenv().bpc==nil)then getgenv().bpc=getgenv().bp:Clone();end;
                        if(getgenv().bavc==nil)then getgenv().bavc=getgenv().bav:Clone();end;
                        getgenv().bpc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                        getgenv().bavc.Parent=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                        getgenv().bavc.AngularVelocity=t["RndVec3"](-10,10)*getgenv().bavMulti;
                        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                        a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position;
                        b=game:GetService("Players")[getgenv().InputPlrCarAnnoy].Character.HumanoidRootPart.Position;
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
                        getgenv().bpc.Position=b;
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0);
                    end);
                end;
                
                wait();
                game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
                getgenv().bp:Destroy();
                getgenv().bav:Destroy();
                getgenv().bpc:Destroy();
                getgenv().bavc:Destroy();
            end);
        end;
    });
    j:CreateInput({
        Name="Player to Car Annoy",
        PlaceholderText="",
        RemoveTextAfterFocusLost=false,
        Callback=function(str)
            if(str=="")then 
                warn("Please enter a player name");
            else 
                for _,k in pairs(game:GetService("Players"):GetPlayers())do 
                    if(str:lower()==k.Name:sub(1,#str):lower())then 
                        getgenv().InputPlrCarAnnoy=k.Name;
                        if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrCarAnnoy)~=nil)then print("Target Chosen as "..getgenv().InputPlrCarAnnoy);end;
                        return;
                    end;
                end;
                if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrCarAnnoy)==nil)then print("Inputed player could not be found");getgenv().InputPlrCarAnnoy="";end;
            end;
        end;
    });
    j:CreateInput({
        Name="Angular Multiplier",
        PlaceholderText="",
        RemoveTextAfterFocusLost=false,
        Callback=function(_)
            if(tonumber(_)~=nil)then 
                getgenv().bavMulti=tonumber(_);
            end;
        end;
    });
    j:CreateButton({
        Name="Noclip Car",
        Callback=function()
            local car=t.getFirstModelOfPart(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").SeatPart);
            if(car~=nil)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit==true)then 
                for _,__ in pairs(car:GetDescendants())do 
                    if(__:IsA("BasePart"))and(__["CanCollide"]==true)then 
                        __["CanCollide"]=false;
                    end;
                end;
            end;
        end;
    });
end;

-- Circle
u:CreateToggle({
    Name="Circle Player",
    CurrentValue=false,
    Flag="CirclePlayer",
    Callback=function(a)
        getgenv().CirclePlayer=a;
        if(getgenv().InputPlrCircle=="")then 
            print("Please input a player");
            getgenv().CirclePlayer=false;
        end;

        spawn(function()
            local currentAngle=0;
            while(getgenv().CirclePlayer==true)do 
                local _,dt=game:GetService("RunService").Stepped:Wait();
                currentAngle+=getgenv().CircleSpeed*math.pi*dt;
                xpcall(function()
                    local target=game:GetService("Players")[getgenv().InputPlrCircle].Character;
                    if(target~=nil)then 
                        local ltarget=(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LowerTorso"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head"));
                        target=(target:FindFirstChild("HumanoidRootPart"))or(target:FindFirstChild("Torso"))or(target:FindFirstChild("UpperTorso"))or(target:FindFirstChild("LowerTorso"))or(target:FindFirstChild("Head"));
                        local p=CFrame.lookAt(target.Position+Vector3.new(0,getgenv().CircleHeight,0)+Vector3.new(getgenv().CircleDistance*math.sin(currentAngle),6.5,getgenv().CircleDistance*math.cos(currentAngle)),target.Position);
                        ltarget.CFrame=p;
                        ltarget.Velocity=Vector3.new(0,0,0);
                        game:GetService("Workspace").CurrentCamera.CameraSubject=target;
                        game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
                        game:GetService("Players").LocalPlayer.Character.Humanoid.PlatformStand=true;
                    end;
                end,print);
            end;
            game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
            game:GetService("Players").LocalPlayer.Character.Humanoid.PlatformStand=false;
            game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
        end);
    end;
});
u:CreateInput({
    Name="Circle Speed",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(a)
        if(tonumber(a)~=nil)then 
            getgenv().CircleSpeed=(a/20)or(getgenv().CircleSpeed);
            print(a/20);
        end;
    end;
});
u:CreateInput({
    Name="Circle Distance",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(a)
        if(tonumber(a)~=nil)then 
            getgenv().CircleDistance=(a)or(getgenv().CircleDistance);
            print(a);
        end;
    end;
});
u:CreateInput({
    Name="Circle Height",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(a)
        if(tonumber(a)~=nil)then 
            getgenv().CircleHeight=(a)or(getgenv().CircleHeight);
            print(a);
        end;
    end;
});
u:CreateInput({
    Name="Player to Circle",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(str)
        if(str=="")then 
            warn("Please enter a player name");
        else 
            for _,k in pairs(game:GetService("Players"):GetPlayers())do 
                if(str:lower()==k.Name:sub(1,#str):lower())then 
                    getgenv().InputPlrCircle=k.Name;
                    if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrCircle)~=nil)then print("Target Chosen as "..getgenv().InputPlrCircle);end;
                    return;
                end;
            end;
            if(game:GetService("Players"):FindFirstChild(getgenv().InputPlrCircle)==nil)then print("Inputed player could not be found");getgenv().InputPlrCircle="";end;
        end;
    end;
});

-- Closest Tab
f:CreateToggle({
    Name="Follow Closest",
    CurrentValue=false,
    Flag="FollowClosest",
    Callback=function(a)
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
    end;
});

f:CreateToggle({
    Name="Look At Closest",
    CurrentValue=false,
    Flag="LookAtClosest",
    Callback=function(a)
        getgenv().LookAtClosest=a;
        spawn(function()
            while(getgenv().LookAtClosest==true)and(game:GetService("RunService").Stepped:Wait())do 
                pcall(function()
                    a=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                    b=getclosest().Character.HumanoidRootPart.Position
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(b.X,a.Y,b.Z));
                    game:GetService("Players").LocalPlayer.Character.Animate.PlayEmote:Invoke(getgenv().LookAtClosestEmote);
                end);
            end;
        end);
    end;
});
f:CreateInput({
    Name="Emote to Play While Looking at Player",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(_)
        if(tonumber(a)~=nil)then 
            getgenv().LookAtClosestEmote=_;
        end;
    end;
});

-- Other Players Tab
l:CreateToggle({
    Name="Noclip Others",
    CurrentValue=false,
    Flag="NoclipOthers",
    Callback=function(a)
        getgenv().NoclipOthers=a;
        print(a);
        spawn(function()
            while(getgenv().NoclipOthers==true)and(game:GetService("RunService").Stepped:Wait())do 
                pcall(function()
                    for _,__ in pairs(game:GetService("Players"):GetPlayers())do 
                        if(__~=game:GetService("Players")["LocalPlayer"])then 
                            for _,__ in pairs(__["Character"]:GetDescendants())do 
                                if(__:IsA("BasePart"))then 
                                    __["CanCollide"]=false;
                                end;
                            end;
                        end;
                    end;
                end);
            end;
        end);
    end;
});

l:CreateToggle({
    Name="Noclip Others Aura",
    CurrentValue=false,
    Flag="NoclipOthersAura",
    Callback=function(a)
        getgenv().NoclipOthersAura=a;
        print(a);
        spawn(function()
            while(getgenv().NoclipOthersAura==true)and(game:GetService("RunService").Stepped:Wait())do 
                pcall(function()
                    for _,__ in pairs(game:GetService("Players"):GetPlayers())do 
                        if(__~=game:GetService("Players")["LocalPlayer"])and((__["Character"]["HumanoidRootPart"]["Position"]-game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"]<=getgenv().NoclipOthersAuraRange)then 
                            for _,__ in pairs(__["Character"]:GetDescendants())do 
                                if(__:IsA("BasePart"))then 
                                    __["CanCollide"]=false;
                                end;
                            end;
                        end;
                    end;
                end);
            end;
        end);
    end;
});

l:CreateSlider({
    Name="Noclip Others Aura Range",
    Range={1,100},
    Increment=1,
    Suffix="Range",
    CurrentValue=10,
    Flag="NoclipOthersAuraRange",
    Callback=function(a)
        getgenv().NoclipOthersAuraRange=a;
        print(a);
    end;
});

-- Player Tab
r:CreateToggle({
    Name="Spinbot",
    CurrentValue=false,
    Flag="Spinbot",
    Callback=function(a)
        getgenv().Spinbot=a;
        print(a);
        spawn(function()
            while(getgenv().Spinbot==true)and(game:GetService("RunService").Stepped:Wait())do 
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(90),0);
                end);
            end;
        end);
    end;
});

r:CreateToggle({
    Name="Noclip",
    CurrentValue=false,
    Flag="Noclip",
    Callback=function(a)
        getgenv().Noclip=a;
        print(a);
        spawn(function()
            while(getgenv().Noclip==true)and(game:GetService("RunService").Stepped:Wait())do 
                pcall(function()
                    for _,__ in pairs(game:GetService("Players")["LocalPlayer"]["Character"]:GetDescendants())do 
                        if(__:IsA("BasePart"))then 
                            __["CanCollide"]=false;
                        end;
                    end;
                end);
            end;
        end);
    end;
});

r:CreateSlider({
    Name="Walkspeed",
    Range={16,200},
    Increment=1,
    Suffix="Walkspeed",
    CurrentValue=16,
    Flag="Walkspeed",
    Callback=function(a)
        getgenv().ws=a;
    end;
});

-- Kill Tab
v:CreateToggle({
    Name="Kill Aura",
    CurrentValue=false,
    Flag="KillAura",
    Callback=function(a)
        getgenv().KillAura=a;
        print(a);
        spawn(function()
            while(getgenv().KillAura==true)and(wait(0.1))do 
                pcall(function()
                    for _,plr in pairs(game:GetService("Players"):GetPlayers())do 
                        if((plr.Character.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=getgenv().KillAuraRange)and(plr.Character:FindFirstChildWhichIsA("ForceField")==nil)and(plr.Name~=game:GetService("Players").LocalPlayer.Name)and(plr.Character.Humanoid.Health>0)and(plr.Character.Humanoid.Health~=math.huge)then 
                            if(game.PlaceId==11756661207)then 
                                local tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                                if(tool)and(tool:FindFirstChild("Handle"))then 
                                    for _,a in pairs(plr.Character:GetChildren())do 
                                        if(a:IsA("BasePart"))then 
                                            if(getgenv().Method1==true)then 
                                                if(tool:FindFirstChild("Activate")~=nil)and(tool:FindFirstChild("Activate"):IsA("RemoteEvent"))then 
                                                    tool:FindFirstChild("Activate"):FireServer(a.Position,a);
                                                elseif(tool:FindFirstChild("Activate")==nil)and(tool:IsA("Tool"))then 
                                                    tool:Activate();
                                                end;
                                            end;
                                            if(getgenv().AutoTP==true)then 
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(plr.Character.HumanoidRootPart.Position)
                                            end;
                                            firetouchinterest(tool.Handle,a,0);
                                            firetouchinterest(tool.Handle,a,1);
                                        end;
                                    end;
                                end;
                            elseif(game.PlaceId~=11756661207)and(((plr.Team~=game:GetService("Players").LocalPlayer.Team)and(plr.Neutral==false))or(plr.Neutral==true))then 
                                local tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                                if(tool)and(tool:FindFirstChild("Handle"))then 
                                    for _,a in pairs(plr.Character:GetChildren())do 
                                        if(a:IsA("BasePart"))then 
                                            if(getgenv().Method1==true)then 
                                                if(tool:FindFirstChild("Activate")~=nil)and(tool:FindFirstChild("Activate"):IsA("RemoteEvent"))then 
                                                    tool:FindFirstChild("Activate"):FireServer(a.Position,a);
                                                elseif(tool:FindFirstChild("Activate")==nil)and(tool:IsA("Tool"))then 
                                                    tool:Activate();
                                                end;
                                            end;
                                            if(getgenv().AutoTP==true)then 
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(plr.Character.HumanoidRootPart.Position)
                                            end;
                                            firetouchinterest(tool.Handle,a,0);
                                            firetouchinterest(tool.Handle,a,1);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
            end;
        end);
    end;
});
v:CreateSlider({
    Name="Kill Aura Range",
    Range={1,250},
    Increment=1,
    Suffix="Range",
    CurrentValue=15,
    Flag="KillAuraRange",
    Callback=function(a)
        getgenv().KillAuraRange=a;
    end;
});

v:CreateInput({
    Name="Player to Loop Kill",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(str)
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
    end;
});

v:CreateToggle({
    Name="Loop Kill",
    CurrentValue=false,
    Flag="LoopKill",
    Callback=function(a)
        getgenv().KillPlayer=a;
        print(a);
        if(getgenv().PlayerToKill=="")then 
            print("Please input a player");
            getgenv().KillPlayer=false;
        end;
        spawn(function()
            while(getgenv().KillPlayer==true)and(game:GetService("RunService").Stepped:Wait())do 
                pcall(function()
                    for _,__ in pairs(game:GetService("Players")["LocalPlayer"]["Character"]:GetDescendants())do 
                        if(__:IsA("BasePart"))then
                            __["CanCollide"]=false;
                        end;
                    end;
                    if(game:GetService("Players")[getgenv().PlayerToKill]~=nil)and(getgenv().AutoTP==true)then 
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(game:GetService("Players")[getgenv().PlayerToKill].Character.HumanoidRootPart.Position.X+7.5-math.floor(math.random(0,15)),game:GetService("Players")[getgenv().PlayerToKill].Character.HumanoidRootPart.Position.Y+7.5,game:GetService("Players")[getgenv().PlayerToKill].Character.HumanoidRootPart.Position.Z+7.5-math.floor(math.random(0,15)));
                    end;
                    local tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                    if(game.PlaceId==6104994594)then 
                        if(game:GetService("Workspace"):FindFirstChild("WaterParts")~=nil)then 
                            game:GetService("Workspace")["WaterParts"]:Destroy();
                        end;if(tool==nil)then 
                            game:GetService("ReplicatedStorage").Remotes.EquipTool:FireServer(game:GetService("Players").LocalPlayer.Backpack.Sword);
                            wait(0.5);
                            tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                        end;if(tool~=nil)and(tool.Name~="Sword")then 
                            game:GetService("ReplicatedStorage").Remotes.EquipTool:FireServer(game:GetService("Players").LocalPlayer.Backpack.Sword);
                            wait(0.5);
                            tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                        end;
                    end;
                    if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then game:GetService("Players").LocalPlayer.Character.Humanoid.Sit=false;end;
                    for _,a in pairs(game:GetService("Players")[getgenv().PlayerToKill].Character:GetChildren())do 
                        if(a:IsA("BasePart"))and(game:GetService("Players")[getgenv().PlayerToKill].Character:FindFirstChildWhichIsA("ForceField")==nil)then 
                            if(getgenv().Method1==true)then 
                                if(tool:FindFirstChild("Activate")~=nil)and(tool:FindFirstChild("Activate"):IsA("RemoteEvent"))then 
                                    tool:FindFirstChild("Activate"):FireServer(a.Position,a);
                                elseif(tool:FindFirstChild("Activate")==nil)and(tool:IsA("Tool"))then 
                                    tool:Activate();
                                end;
                            end;
                            firetouchinterest(tool.Handle,a,0);
                            firetouchinterest(tool.Handle,a,1);
                        end;
                    end;
                end);
            end;
        end);
    end;
});

v:CreateToggle({
    Name="Kill All",
    CurrentValue=false,
    Flag="KillAll",
    Callback=function(a)
        getgenv().KillAll=a;
        print(a);
        spawn(function()
            while(getgenv().KillAll==true)and(wait(0.05))do 
                pcall(function()
                    for _,__ in pairs(game:GetService("Players")["LocalPlayer"]["Character"]:GetDescendants())do 
                        if(__:IsA("BasePart"))then
                            __["CanCollide"]=false;
                        end;
                    end;
                    local plr=getClosestPlayer();
                    if(plr~=nil)then 
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(plr.Character.HumanoidRootPart.Position.X+7.5-math.floor(math.random(0,15)),plr.Character.HumanoidRootPart.Position.Y+7.5,plr.Character.HumanoidRootPart.Position.Z+7.5-math.floor(math.random(0,15)));
                    elseif(plr==nil)then 
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(0,1000,0);
                    end;
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0);
                    local tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                    if(game.PlaceId==6104994594)then 
                        if(game:GetService("Workspace"):FindFirstChild("WaterParts")~=nil)then 
                            game:GetService("Workspace")["WaterParts"]:Destroy();
                        end;if(tool==nil)then 
                            game:GetService("ReplicatedStorage").Remotes.EquipTool:FireServer(game:GetService("Players").LocalPlayer.Backpack.Sword);
                            wait(0.5);
                            tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                        end;if(tool~=nil)and(tool.Name~="Sword")then 
                            game:GetService("ReplicatedStorage").Remotes.EquipTool:FireServer(game:GetService("Players").LocalPlayer.Backpack.Sword);
                            wait(0.5);
                            tool=(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Model"));
                        end;
                    end;
                    if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then game:GetService("Players").LocalPlayer.Character.Humanoid.Sit=false;end;
                    if(tool~=nil)and(tool:FindFirstChild("Handle"))then 
                        for _,a in pairs(plr.Character:GetChildren())do 
                            if(a:IsA("BasePart"))then 
                                if(getgenv().Method1==true)then 
                                    if(tool:FindFirstChild("Activate")~=nil)and(tool:FindFirstChild("Activate"):IsA("RemoteEvent"))then 
                                        tool:FindFirstChild("Activate"):FireServer(a.Position,a);
                                    elseif(tool:FindFirstChild("Activate")==nil)and(tool:IsA("Tool"))then 
                                        tool:Activate();
                                    end;
                                end;
                                firetouchinterest(tool.Handle,a,0);
                                firetouchinterest(tool.Handle,a,1);
                            end;
                        end;
                    end;
                end);
            end;
        end);
    end;
});

v:CreateToggle({
    Name="Method 1",
    CurrentValue=false,
    Flag="Method1",
    Callback=function(a)
        getgenv().Method1=a;
        print(a);
    end;
});

v:CreateToggle({
    Name="Auto Teleport",
    CurrentValue=false,
    Flag="AutoTeleport",
    Callback=function(a)
        getgenv().AutoTP=a;
        print(a);
    end;
});

if(game.PlaceId==6104994594)then 
    v:CreateButton({
        Name="Remove Water Damage",
        Callback=function()
            if(game:GetService("Workspace"):FindFirstChild("WaterParts")~=nil)then 
                game:GetService("Workspace")["WaterParts"]:Destroy();
            end;
        end;
    });
end;

-- Chat Tab
g:CreateInput({
    Name="Text to Spam",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(a)
        getgenv().ChatSpamSettings.SpamText=a;
    end;
});
g:CreateInput({
    Name="Text Spam to Who",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(a)
        if(str=="")then 
            print("Please enter a player name");
        else 
            for _,k in pairs(game:GetService("Players"):GetPlayers())do 
                if(str:lower()==k.Name:sub(1,#str):lower())then 
                    getgenv().ChatSpamSettings.SpamTextTo=k.Name;
                    if(game:GetService("Players"):FindFirstChild(getgenv().ChatSpamSettings.SpamTextTo)~=nil)then print("Target Chosen as "..getgenv().ChatSpamSettings.SpamTextTo);end;
                    return;
                end;
            end;
            if(game:GetService("Players"):FindFirstChild(getgenv().ChatSpamSettings.SpamTextTo)==nil)then print("Inputed player could not be found");getgenv().ChatSpamSettings.SpamTextTo="";end;
        end;
    end;
});
g:CreateInput({
    Name="Text Timeout",
    PlaceholderText="",
    RemoveTextAfterFocusLost=false,
    Callback=function(a)
        getgenv().ChatSpamSettings.Timeout=a;
    end;
});

g:CreateToggle({
    Name="Spam",
    CurrentValue=false,
    Flag="Spam",
    Callback=function(a)
        getgenv().ChatSpamSettings.ChatSpam=a;
        print(a);
        spawn(function()
            while(getgenv().ChatSpamSettings.ChatSpam==true)and(wait())do 
                pcall(function()game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().ChatSpamSettings.SpamText,getgenv().ChatSpamSettings.SpamTextTo);end);
                wait(getgenv().ChatSpamSettings.Timeout);
            end;
        end);
    end;
});

-- Loaders Tab
s:CreateButton({
    Name="Infinite Yield",
    Callback=function()
        spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();end);
    end;
});

s:CreateButton({
    Name="Nexus Exploits",
    Callback=function()
        spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main",true))();end);
    end;
});

s:CreateButton({
    Name="FE R6 Invis Tool",
    Callback=function()
        spawn(function()loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))();end);
    end;
});

s:CreateButton({
    Name="Yeet GUI ver.Trollface",
    Callback=function()
        spawn(function()
            getgenv().Yeeting=false;
            local lp=game:FindService("Players").LocalPlayer
                
            local function gplr(String)
                local Found={}
                local strl=String:lower()
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
                    Title="YEET UI",
                    Text=str,
                    Icon="rbxassetid://2005276185",
                    Duration=dur or 3
                })
            end

            if(game:GetService("CoreGui"):FindFirstChild("FE Yeet Gui")~=nil)then game:GetService("CoreGui"):FindFirstChild("FE Yeet Gui"):Destroy();end;
            local FEYeetGui=Instance.new("ScreenGui")
            local Main=Instance.new("ImageLabel")
            local Top=Instance.new("Frame")
            local Title=Instance.new("TextLabel")
            local TextBox=Instance.new("TextBox")
            local TextButton1=Instance.new("TextButton")
            local TextButton2=Instance.new("TextButton")

            FEYeetGui.Name="FE Yeet Gui"
            FEYeetGui.Parent=game:GetService("CoreGui")
            FEYeetGui.ResetOnSpawn=false

            Main.Name="Main"
            Main.Parent=FEYeetGui
            Main.Active=true
            Main.Draggable=true
            Main.BackgroundColor3=Color3.fromRGB(255, 255, 255)
            Main.BorderSizePixel=0
            Main.Position=UDim2.new(0.17, 0, 0.46, 0)
            Main.Size=UDim2.new(0, 454, 0, 218)
            Main.Image="rbxassetid://2005276185"

            Top.Name="Top"
            Top.Parent=Main
            Top.BackgroundColor3=Color3.fromRGB(57, 57, 57)
            Top.BorderSizePixel=0
            Top.Size=UDim2.new(0, 454, 0, 44)

            Title.Name="Title"
            Title.Parent=Top
            Title.BackgroundColor3=Color3.fromRGB(49, 49, 49)
            Title.BorderSizePixel=0
            Title.Position=UDim2.new(0, 0, 0.295454562, 0)
            Title.Size=UDim2.new(0, 454, 0, 30)
            Title.Font=Enum.Font.SourceSans
            Title.Text="FE Yeet Gui (trollface edition)"
            Title.TextColor3=Color3.fromRGB(255, 255, 255)
            Title.TextScaled=true
            Title.TextSize=14.000
            Title.TextWrapped=true

            TextBox.Parent=Main
            TextBox.BackgroundColor3=Color3.fromRGB(49, 49, 49)
            TextBox.BorderSizePixel=0
            TextBox.Position=UDim2.new(0.07, 0, 0.27, 0)
            TextBox.Size=UDim2.new(0, 388, 0, 62)
            TextBox.Font=Enum.Font.SourceSans
            TextBox.PlaceholderText="Who do i yeet(can be shortened)"
            TextBox.Text=""
            TextBox.TextColor3=Color3.fromRGB(255, 255, 255)
            TextBox.TextScaled=true
            TextBox.TextSize=14.000
            TextBox.TextWrapped=true

            TextButton1.Parent=Main
            TextButton1.BackgroundColor3=Color3.fromRGB(49, 49, 49)
            TextButton1.BorderSizePixel=0
            TextButton1.Position=UDim2.new(0.1, 0, 0.6, 0)
            TextButton1.Size=UDim2.new(0, 359, 0, 25)
            TextButton1.Font=Enum.Font.SourceSans
            TextButton1.Text="Cheese em'"
            TextButton1.TextColor3=Color3.fromRGB(255, 255, 255)
            TextButton1.TextScaled=true
            TextButton1.TextSize=14.000
            TextButton1.TextWrapped=true

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
                            Thrust.Location=Target.Character.HumanoidRootPart.Position;
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

            TextButton2.Parent=Main
            TextButton2.BackgroundColor3=Color3.fromRGB(49, 49, 49)
            TextButton2.BorderSizePixel=0
            TextButton2.Position=UDim2.new(0.1, 0, 0.8, 0)
            TextButton2.Size=UDim2.new(0, 359, 0, 25)
            TextButton2.Font=Enum.Font.SourceSans
            TextButton2.Text="Stop"
            TextButton2.TextColor3=Color3.fromRGB(255, 255, 255)
            TextButton2.TextScaled=true
            TextButton2.TextSize=14.000
            TextButton2.TextWrapped=true

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
    end;
});

s:CreateButton({
    Name="Bedwars",
    Callback=function()
        spawn(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",true))();end);
    end;
});

s:CreateButton({
    Name="Eclipse Hub",
    Callback=function()
        spawn(function()
            if(true==true)then 
                local msg=Instance.new("Message",game:GetService("Workspace"));
                msg.Text="Eclipse hub currently does not work by executing after the game launched";
                game:GetService("Debris"):AddItem(msg,5);
                return;
            end;
            if(getgenv().mainKey==nil)then 
                getgenv().mainKey="nil";
            end;
            local requests,curl,header=(request)or(http_request)or((http)and(http.request))or((syn)and(syn.request)),"https://api.eclipsehub.xyz/auth?key="..tostring(getgenv().mainKey),{["User-Agent"]="Eclipse"};
            local req={Url=curl,Headers=header};
            assert((loadstring)and(requests),"Executor not Supported");
            loadstring(requests(req).Body)();
        end);
    end;
});

s:CreateButton({
    Name="No Prompt Wait",
    Callback=function()
        if(getgenv().NoPromptWait~=nil)then getgenv().NoPromptWait:Disconnect();end;
        getgenv().NoPromptWait=game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(_)
            fireproximityprompt(_);
        end);
    end;
});

i:CreateButton({
    Name="Destroy GUI",
    Callback=function()
        gui:Destroy();
    end;
});
