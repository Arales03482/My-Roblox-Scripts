local m="Loading Blade Ball Script by ARealer";
local done_loading=false;
local msg=Instance.new("Hint");
msg.Text=m;
msg.Parent=game:GetService("CoreGui");

spawn(function()
    local int=0;
    while(msg~=nil)and(msg:IsDescendantOf(game)==true)and(done_loading==false)and(wait(1))do 
        if(int<=3)then 
            msg.Text=msg.Text..".";
            int=int+1;
        end;
        if(int>=3)then 
            msg.Text=m;
            int=0;
        end;
    end;
end);

local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Main");
getgenv().AutoParry=false;
getgenv().LookAtBall=false;
getgenv().Aimbot=false;
local auto_parry_raw_input=false;
local auto_parry_range=20;
local current_aimbot_player=nil;

local parry_button_press_bind=game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ParryButtonPress");
local parry_attempt_rem=game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ParryAttempt");

local cam=game:GetService("Workspace").CurrentCamera;
local dirs={};
local view_dir={};
local mouse=game:GetService("Players").LocalPlayer:GetMouse();
local fake_cam=Instance.new("Camera");
local focusedBall=nil;
local secured_instances={fake_cam};

if(getgenv().Inst==nil)then getgenv().Inst=0;end;
getgenv().Inst+=1;

local cinst=getgenv().Inst;

local function parry_attempt()
    if(auto_parry_raw_input==true)then 
        parry_attempt_rem:FireServer(0.5,cam.CFrame,dirs,view_dir);
    elseif(auto_parry_raw_input==false)then 
        parry_button_press_bind:Fire();
    end;
end;

local function getPositionOnScreen(Vector)
    local Vec3,OnScreen=cam:WorldToScreen(Vector);
    return Vector2.new(Vec3.X,Vec3.Y),OnScreen;
end;

local function getMousePosition()
    return(game:GetService("UserInputService"):GetMouseLocation());
end;

--anti afk
if(getgenv().kuefg834rjiy983450~=nil)and(typeof(getgenv().kuefg834rjiy983450)=="RBXScriptConnection")then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:Connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new(0,0));end);

--main
b:Toggle("Auto Parry",function(a)
    getgenv().AutoParry=a;
    if(a==true)then 
        spawn(function()
            local BASE_THRESHOLD=0.15;
            local VELOCITY_SCALING_FACTOR_FAST=0.050;
            local VELOCITY_SCALING_FACTOR_SLOW=0.1;

            local function getDynamicThreshold(targetVelocityMagnitude)
                if(targetVelocityMagnitude>60)then 
                    return math.max(0.20,BASE_THRESHOLD-(targetVelocityMagnitude*VELOCITY_SCALING_FACTOR_FAST));
                elseif(targetVelocityMagnitude<=60)then 
                    return math.min(0.01,BASE_THRESHOLD+(targetVelocityMagnitude*VELOCITY_SCALING_FACTOR_SLOW));
                end;
            end;

            local function timeUntilImpact(origin,target,originVelocity,targetVelocity,distanceToOrigin)
                local directionToOrigin=(origin-target).Unit;
                local velocityTowardsPlayer=targetVelocity:Dot(directionToOrigin)-originVelocity:Dot(directionToOrigin);
                if(velocityTowardsPlayer<=0)then 
                    return(math.huge);
                end;
                return((distanceToOrigin-auto_parry_range)/velocityTowardsPlayer);
            end;
            local con;con=game:GetService("RunService").PreSimulation:Connect(function()--PostSimulation PreSimulation Heartbeat
                if(getgenv().AutoParry==false)then con:Disconnect();return;end;
                local character=game:GetService("Players").LocalPlayer.Character;
                if(character==nil)or(character.Parent~=game:GetService("Workspace").Alive)or(character:FindFirstChild("Highlight")==nil)then return;end;
                local hrp=character:FindFirstChild("HumanoidRootPart");
                if(hrp==nil)then return;end;
                local charVel=hrp.Velocity;
                local charPos=hrp.Position;
                local ball=focusedBall;
                if(ball~=nil)then 
                    local ballVel=ball.Velocity;
                    local ballPos=ball.Position;
                    local distanceToPlayer=(ballPos-charPos).Magnitude;
                    if(distanceToPlayer<=10)then 
                        parry_attempt();
                    end;
                    if(timeUntilImpact(charPos,ballPos,charVel,ballVel,distanceToPlayer)/(game:GetService("Players").LocalPlayer:GetNetworkPing()*20)<getDynamicThreshold(ballVel:Dot((charPos-ballPos).Unit)))then 
                        parry_attempt();
                    end;
                end;
            end);
            while(getgenv().AutoParry==true)do 
                game:GetService("RunService").PostSimulation:Wait();
            end;
            con:Disconnect();
        end);
    end;
end);
b:Toggle("Auto Parry Raw Input",function(a)
    auto_parry_raw_input=a;
end);
b:Slider("Auto Parry Range",{min=0;max=100;precise=false},function(a)
    auto_parry_range=tonumber(a);
end);
b:Button("Spam Parry (hold E)",function()end);

b:Toggle("Look At Ball",function(a)
    getgenv().LookAtBall=a;
    spawn(function()
        while(getgenv().LookAtBall==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                local ball=focusedBall;
                if(ball~=nil)and(game:GetService("Players").LocalPlayer.Character.Parent==game:GetService("Workspace").Alive)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate=false;
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(ball.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y,ball.Position.Z));
                else 
                    game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate=true;
                end;
            end);
        end;
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate=true;
        end);
    end);
end);

b:Box("FPSCap","number",function(a)
    if(tonumber(a)~=nil)then 
        setfpscap(tonumber(a));
    end;
end);

b:Toggle("Aimbot",function(a)
    getgenv().Aimbot=a;
end);

b:Button("Inf Upgrades",function(a)
    for _,a in pairs(game:GetService("Players").LocalPlayer.Upgrades:GetChildren())do 
        if(a:IsA("IntValue"))then 
            a.Value=908779319084589000;
        end;
    end;
end);

b:Button("Max Upgrades",function(a)
    for _,a in pairs(game:GetService("Players").LocalPlayer.Upgrades:GetChildren())do 
        if(a:IsA("IntValue"))then 
            a.Value=3;
        end;
    end;
end);

spawn(function()
    while(cinst==getgenv().Inst)and(game:GetService("RunService").PostSimulation:Wait())do 
        pcall(function()
            cam=game:GetService("Workspace").CurrentCamera;
            if(cam~=nil)then 
                table.clear(dirs);
                for _,plr in pairs(game:GetService("Players"):GetPlayers())do 
                    local char=plr.Character;
                    if(char~=nil)then 
                        local hrp=char:FindFirstChild("HumanoidRootPart");
                        if(hrp~=nil)then 
                            dirs[tostring(plr.UserId)]=cam:WorldToScreenPoint(hrp.Position);
                        end;
                    end;
                end;
                local last_input_type=game:GetService("ContextActionService"):GetLastInputType();
                if(last_input_type==Enum.UserInputType.Keyboard)or(last_input_type==Enum.UserInputType.MouseButton1)or(last_input_type==Enum.UserInputType.MouseButton2)then 
                    view_dir[1]=cam.ViewportSize.X/2;
                    view_dir[2]=cam.ViewportSize.Y/2;
                else 
                    view_dir[1]=mouse.X;
                    view_dir[2]=mouse.Y;
                end;
                local Closest=nil;
                local DistanceToMouse=nil;
                for _,Player in next,game:GetService("Players"):GetPlayers()do 
                    if(Player==LocalPlayer)then continue;end;
            
                    local Character=Player.Character;
                    if(Character==nil)then continue;end;
            
                    local HumanoidRootPart=Character:FindFirstChild("HumanoidRootPart");
                    local Humanoid=Character:FindFirstChildWhichIsA("Humanoid");
                    if(HumanoidRootPart==nil)or(Humanoid==nil)or((Humanoid~=nil)and(Humanoid.Health<=0))then continue;end;
            
                    local ScreenPosition,OnScreen=getPositionOnScreen(HumanoidRootPart.Position);
                    if(OnScreen==false)then continue;end;
            
                    local Distance=(getMousePosition()-ScreenPosition).Magnitude;
                    if(Distance<=((DistanceToMouse)or(math.huge)))then 
                        Closest=Player;
                        DistanceToMouse=Distance;
                    end;
                end;
                current_aimbot_player=Closest;
            end;
        end);
    end;
    fake_cam:Destroy();
end);

spawn(function()
    while(cinst==getgenv().Inst)and(game:GetService("RunService").PostSimulation:Wait())do 
        pcall(function()
            if(game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.E)==true)then 
                parry_attempt();
            end;
        end);
    end;
end);

spawn(function()
    while(cinst==getgenv().Inst)and(game:GetService("RunService").PreSimulation:Wait())do 
        pcall(function()
            for _,ball in pairs(game:GetService("Workspace").Balls:GetChildren())do 
                if(ball:IsA("BasePart"))and(((ball:GetAttribute("realBall")~=nil)and(ball:GetAttribute("realBall")==true))or(ball:GetAttribute("target")~=nil))then 
                    focusedBall=ball;
                    return;
                end;
            end;
            focusedBall=nil;
        end);
    end;
end);

xpcall(function()
    local GetDebugId=game.GetDebugId;

    local GetDebugIdHandler=Instance.new("BindableFunction");
    local GetDebugIDInvoke=GetDebugIdHandler.Invoke;

    function GetDebugIdHandler.OnInvoke(obj)
        return GetDebugId(obj);
    end;

    local function ThreadGetDebugId(obj)
        return GetDebugIDInvoke(GetDebugIdHandler,obj);
    end;

    local function blankfunction(...)
        return ...;
    end;

    local unhook=(oth)and(oth.unhook);
    local hook=(oth)and(oth.hook);
    local cloneref=(cloneref)or(blankfunction);
    local newcclosure=(newcclosure)or(blankfunction);
    local clonefunction=(clonefunction)or(blankfunction);
    local getinfo=(getinfo)or(debug.getinfo)or(blankfunction);

    local hookmetamethod=(hookmetamethod)or(((makewriteable~=nil)and(makereadonly~=nil)and(getrawmetatable~=nil))and(function(obj,metamethod,func)
        local old=getrawmetatable(obj);

        if(hookfunction~=nil)then 
            return(hookfunction(old[metamethod],func));
        else 
            local oldmetamethod=old[metamethod];
            makewriteable(old);
            old[metamethod]=func;
            makereadonly(old);
            return(oldmetamethod);
        end;
    end));

    local debug_info=clonefunction(debug.info);
    local typ=clonefunction(type);
    local typo=clonefunction(typeof);
    local wai=clonefunction(wait);
    local IsDescendantOf=clonefunction(game:GetService("Workspace").IsDescendantOf);

    local g=game;
    local rem=parry_attempt_rem;

    local rem_d=((rem~=nil)and(GetDebugId(rem)))or(rem);

    local function getFirstArg(...)
        return(...);
    end;

    local synv3=false;
    if(syn~=nil)and(identifyexecutor~=nil)then 
        local _,version=identifyexecutor();
        if(version~=nil)and(version:sub(1,2)=="v3")then 
            synv3=true;
        end;
    end;

    spawn(function()
        while(cinst==getgenv().Inst)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(secured_instances)do 
                    a.Name=randomString();
                end;
            end);
        end;
    end);

    if(getgenv().nchookexec==true)then 
        if(getgenv().oldnc~=nil)then 
            local originalnamecall=getgenv().oldnc;
            if(synv3==true)then 
                unhook(getrawmetatable(game).__namecall,originalnamecall);
                restorefunction(originalnamecall);
            elseif(synv3==false)then 
                if(hookmetamethod~=nil)then 
                    hookmetamethod(game,"__namecall",originalnamecall);
                else 
                    hookfunction(getrawmetatable(game).__namecall,originalnamecall);
                end;
            end;
        end;
        if(getgenv().oldfncts~=nil)then 
            local oldfunctions=getgenv().oldfncts;
            if(synv3==true)then 
                unhook(g_shared.Screenshake,oldfunctions[1]);
                unhook(g_shared.ScreenshakeS,oldfunctions[2]);
                unhook(g_shared.VFX,oldfunctions[3]);
                unhook(g_scripts.wait,oldfunctions[4]);
                restorefunction(oldfunctions[1]);
                restorefunction(oldfunctions[2]);
                restorefunction(oldfunctions[3]);
                restorefunction(oldfunctions[4]);
            elseif(synv3==false)then 
                hookfunction(g_shared.Screenshake,oldfunctions[1]);
                hookfunction(g_shared.ScreenshakeS,oldfunctions[2]);
                hookfunction(g_shared.VFX,oldfunctions[3]);
                hookfunction(g_scripts.wait,oldfunctions[4]);
            end;
        end;
    end;
    getgenv().nchookexec=true;

    local oldnamecall;
    local newnc=newcclosure(function(...)
        local method=getnamecallmethod();
        if(method~=nil)and(typ(method)=="string")and(method~=nil)and(cinst==getgenv().Inst)and(typo(...)=="Instance")then 
            local call_target=cloneref(...);
            if(call_target~=nil)then 
                local args={select(2,...)};
                local caller=getcallingscript();
                local call_target_id=ThreadGetDebugId(call_target);
                if(checkcaller()==false)and(call_target_id==rem_d)and(getgenv().Aimbot==true)and(cam~=nil)and(fake_cam~=nil)then 
                    local target=current_aimbot_player;
                    if(target~=nil)and(current_aimbot_target.Character~=nil)then 
                        local target_hrp=target.Character:FindFirstChild("HumanoidRootPart");
                        if(target_hrp~=nil)then 
                            fake_cam.CFrame=CFrame.lookAt(target_hrp.Position+Vector3.new(0,0,1),target_hrp.Position);
                            args[2]=fake_cam.CFrame;
                            table.clear(args[3]);
                            args[3]={[tostring(target.UserId)]=fake_cam:WorldToScreenPoint(target_hrp.Position)};
                            args[4][1]=1;
                            args[4][2]=1;
                            setnamecallmethod(method);
                        end;
                    end;
                end;
            end;
        end;
        return oldnamecall(...);
    end);

    if(synv3==true)then 
        oldnamecall=hook(getrawmetatable(game).__namecall,clonefunction(newnc));
    elseif(synv3==false)then 
        if(hookmetamethod~=nil)then 
            oldnamecall=hookmetamethod(game,"__namecall",clonefunction(newnc));
        else 
            oldnamecall=hookfunction(getrawmetatable(game).__namecall,clonefunction(newnc));
        end;
    end;

    getgenv().oldnc=oldnamecall;
end,function()
    done_loading=true;
    wait(1.2);
    msg.Text="Unable to load namecall hook code. Aimbot wont work!";
    wait(10);
end);

if(done_loading==false)then 
    done_loading=true;
end;
msg:Destroy();
