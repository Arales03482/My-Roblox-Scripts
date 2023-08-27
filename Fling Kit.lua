local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Main");
getgenv().FlingSwim=false;
getgenv().FlingSwimFly=false;
getgenv().FlingSwimFlySpeed=30;
getgenv().TouchFling=false;
getgenv().TouchFlingStrength=-20000;
getgenv().TouchFlingShouldSwim=false;
getgenv().FlipCharacter=false;
getgenv().FlipCharacterX=0;
getgenv().FlipCharacterY=0;
getgenv().FlipCharacterZ=0;
getgenv().FlipCharacterRotX=0;
getgenv().FlipCharacterRotY=0;
getgenv().FlipCharacterRotZ=180;
getgenv().UsePreAnimation=false;
getgenv().GoIntoGround=false;
getgenv().AntiLock=false;
getgenv().AntiAntiLock=false;
getgenv().PlayerNoclip=false;

--anti afk
if(getgenv().kuefg834rjiy983450~=nil)then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);wait(1);game:service("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);end);

local enums=Enum.HumanoidStateType:GetEnumItems();
table.remove(enums,table.find(enums,Enum.HumanoidStateType.None));
table.remove(enums,table.find(enums,Enum.HumanoidStateType.Swimming));
--table.remove(enums,table.find(enums,Enum.HumanoidStateType.Seated));
b:Toggle("Fling Swim",function(a)
    getgenv().FlingSwim=a;
    spawn(function()
        if(a==true)then 
            local active=true;
            local t=tick();
            local oldgrav=game:GetService("Workspace").Gravity;
		    game:GetService("Workspace").Gravity=0;
            local char=game:GetService("Players").LocalPlayer.Character;
            while(getgenv().FlingSwim==true)and(char~=nil)and(char:IsDescendantOf(game)==true)do 
                local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                local dt=game:GetService("RunService")[mode]:Wait();
                xpcall(function()
                    for _,a in pairs(char:GetDescendants())do 
                        if(a:IsA("BasePart"))then 
                            a.CanCollide=false;
                        end;
                    end;
                    if(char:FindFirstChildWhichIsA("Humanoid"):GetState()~=Enum.HumanoidStateType.Swimming)then 
                        char:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Swimming);
                    end;
                    game:GetService("RunService").Heartbeat:Wait();
                    for _,a in pairs(char:GetDescendants())do 
                        if(a:IsA("BasePart"))then 
                            a.CanCollide=false;
                        end;
                    end;
                    for _,enum in pairs(enums)do 
                        char:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(enum,false);
                    end;
                    char.HumanoidRootPart.Velocity=Vector3.zero;
                    char.HumanoidRootPart.AssemblyLinearVelocity=char.HumanoidRootPart.Velocity;
                    if(tick()-t>=0.1)then 
                        active=not(active);
                        t=tick();
                    end;
                    --if(active==true)then 
                        char.HumanoidRootPart.AssemblyAngularVelocity=Vector3.new(0,1000000,0);
                    --elseif(active==false)then 
                        --char.HumanoidRootPart.AssemblyAngularVelocity=Vector3.zero;
                    --end;
                    --game:GetService("Workspace").CurrentCamera.CameraSubject=char.HumanoidRootPart;
                    game:GetService("Workspace").CurrentCamera.CameraSubject=char.Head;
                    if(getgenv().FlingSwimFly==true)then 
                        local mod=Vector3.zero;
                        if(game:GetService("UserInputService"):GetFocusedTextBox()==nil)then 
                            local w=game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W);
                            local a=game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A);
                            local s=game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S);
                            local d=game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D);
                            local up=(game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space))or(game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.E));
                            local down=(game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift))or(game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Q));
                            local lvec=game:GetService("Workspace").CurrentCamera.CFrame.LookVector;
                            local rvec=game:GetService("Workspace").CurrentCamera.CFrame.RightVector;
                            if(w==true)then 
                                mod+=lvec;
                            end;if(a==true)then 
                                mod-=rvec;
                            end;if(s==true)then 
                                mod-=lvec;
                            end;if(d==true)then 
                                mod+=rvec;
                            end;if(up==true)then 
                                mod+=Vector3.new(0,1,0);
                            end;if(down==true)then 
                                mod-=Vector3.new(0,1,0);
                            end;
                            mod=Vector3.new(math.clamp(mod.X,-1,1),math.clamp(mod.Y,-1,1),math.clamp(mod.Z,-1,1));
                        end;
                        char.HumanoidRootPart.CFrame=char.HumanoidRootPart.CFrame+((mod*5)*dt*getgenv().FlingSwimFlySpeed);
                    end;
                end,warn);
            end;
            for _,enum in pairs(enums)do 
                char:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(enum,true);
            end;
            game:GetService("Workspace").Gravity=oldgrav;
            char.HumanoidRootPart.Velocity=Vector3.zero;
            char.HumanoidRootPart.RotVelocity=Vector3.zero;
            char.HumanoidRootPart.AssemblyAngularVelocity=Vector3.zero;
            char.HumanoidRootPart.AssemblyLinearVelocity=Vector3.zero;
            game:GetService("Workspace").CurrentCamera.CameraSubject=char:FindFirstChildWhichIsA("Humanoid");
        end;
    end);
end);
b:Toggle("Fling Swim Fly",function(a)
    getgenv().FlingSwimFly=a;
end);
b:Box("Fling Swim Fly Speed","number",function(a)
    getgenv().FlingSwimFlySpeed=a;
end);

b:Toggle("Touch Fling",function(a)
    getgenv().TouchFling=a;
    spawn(function()
        local rnd=Random.new(tick());
        while(getgenv().TouchFling==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                local PreVelocity=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(0,rnd:NextNumber(1,getgenv().TouchFlingStrength),0);
                game:GetService("RunService")[mode]:Wait();
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=PreVelocity;
            end);
        end;
    end);
    spawn(function()
        while(getgenv().TouchFling==true)and(game:GetService("RunService").PreAnimation:Wait())do 
            pcall(function()
                if(getgenv().TouchFlingShouldSwim==true)then 
                    local PreState=game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):GetState();
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Swimming);
                    game:GetService("RunService").PreRender:Wait();
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(PreState);
                end;
            end);
        end;
    end);
end);

b:Box("Touch Fling Strength","number",function(a)
    getgenv().TouchFlingStrength=math.clamp(tonumber(a),2,tonumber(a));
end);

b:Toggle("Touch Fling Should Swim",function(a)
    getgenv().TouchFlingShouldSwim=a;
end);

b:Toggle("Flip Character",function(a)
    getgenv().FlipCharacter=a;
    spawn(function()
        while(getgenv().FlipCharacter==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                local PreCFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=PreCFrame*CFrame.new(getgenv().FlipCharacterX,getgenv().FlipCharacterY,getgenv().FlipCharacterZ)*CFrame.Angles(math.rad(getgenv().FlipCharacterRotX),math.rad(getgenv().FlipCharacterRotY),math.rad(getgenv().FlipCharacterRotZ));
                game:GetService("RunService")[mode]:Wait();
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=PreCFrame;
            end);
        end;
    end);
end);

b:Box("Flip Character X","number",function(a)
    getgenv().FlipCharacterX=(tonumber(a))or(getgenv().FlipCharacterX);
end);

b:Box("Flip Character Y","number",function(a)
    getgenv().FlipCharacterY=(tonumber(a))or(getgenv().FlipCharacterY);
end);

b:Box("Flip Character Z","number",function(a)
    getgenv().FlipCharacterZ=(tonumber(a))or(getgenv().FlipCharacterZ);
end);

b:Box("Flip Character Rot X","number",function(a)
    getgenv().FlipCharacterRotX=(tonumber(a))or(getgenv().FlipCharacterRotX);
end);

b:Box("Flip Character Rot Y","number",function(a)
    getgenv().FlipCharacterRotY=(tonumber(a))or(getgenv().FlipCharacterRotY);
end);

b:Box("Flip Character Rot Z","number",function(a)
    getgenv().FlipCharacterRotZ=(tonumber(a))or(getgenv().FlipCharacterRotZ);
end);

b:Toggle("Use Pre Animation",function(a)
    getgenv().UsePreAnimation=a;
end);

b:Toggle("Go Into Ground",function(a)
    getgenv().GoIntoGround=a;
    spawn(function()
        local part=Instance.new("Part");
        part.Transparency=1;
        part.CanCollide=false;
        part.Anchored=true;
        part.Parent=game:GetService("JointsService");
        while(getgenv().GoIntoGround==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                local PreCFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=PreCFrame*CFrame.new(0,-10,0);
                game:GetService("RunService").PreRender:Wait();
                local offset=game:GetService("Players").LocalPlayer.Character.Humanoid.CameraOffset+Vector3.new(0,1.5,0);
                local p=PreCFrame.Position;
                local look=CFrame.lookAt(p,p+Vector3.new(game:GetService("Workspace").CurrentCamera.CFrame.LookVector.X*4,0,game:GetService("Workspace").CurrentCamera.CFrame.LookVector.Z*4));
                part.CFrame=look*CFrame.new(offset)*CFrame.Angles(math.rad(30),0,0);
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=look;
                game:GetService("Workspace").CurrentCamera.CameraSubject=part;
            end,warn);
        end;
        part:Destroy();
        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
    end);
end);

b:Toggle("Anti Lock",function(a)
    getgenv().AntiLock=a;
    spawn(function()
        local rnd=Random.new(tick());
        while(getgenv().AntiLock==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                local PreVelocity=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.new(500,0,0);
                game:GetService("RunService")[mode]:Wait();
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=PreVelocity;
            end);
        end;
    end);
end);

b:Toggle("Anti Anti Lock",function(a)
    getgenv().AntiAntiLock=a;
    spawn(function()
        while(getgenv().AntiAntiLock==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                for _,p in pairs(game.Players:GetChildren())do 
                    if(p.Name~=game.Players.LocalPlayer.Name)then 
                        local hrp=p.Character.HumanoidRootPart;
                        hrp.Velocity=Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z);
                        hrp.AssemblyLinearVelocity=Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z);
                    end;
                end;
            end);
        end;
    end);
end);

b:Toggle("Player Noclip",function(a)
    getgenv().PlayerNoclip=a;
    spawn(function()
        while(getgenv().PlayerNoclip==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                    if(a~=game:GetService("Players").LocalPlayer)and(a.Character~=nil)then 
                        for _,a in pairs(a.Character:GetDescendants())do 
                            if(a:IsA("BasePart"))then 
                                a.CanCollide=false;
                            end;
                        end;
                    end;
                end;
            end);
        end;
    end);
end);
