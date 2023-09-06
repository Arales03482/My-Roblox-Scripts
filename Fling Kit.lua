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
getgenv().FlipCharacterRandomize=false;
getgenv().UsePreAnimation=false;
getgenv().UseCameraBypass=false;
getgenv().GoIntoGround=false;
getgenv().SpamSwim=false;
getgenv().AntiLock=false;
getgenv().AntiAntiLock=false;
getgenv().PlayerNoclip=false;

local secured_instances={};

if(getgenv().Inst==nil)then getgenv().Inst=0;end;
getgenv().Inst+=1;

local cinst=getgenv().Inst;

--functions
local function randomString()
	local length=math.random(10,150);
	local array="";
	for i=1,length do 
		array=array..string.char(math.random(1,150))..math.random(-100,100);
	end;
	return(array);
end;

local function IsAConstraint(a)
    if(a:IsA("BallSocketConstraint"))or(a:IsA("HingeConstraint"))or(a:IsA("PrismaticConstraint"))or(a:IsA("CylindricalConstraint"))or(a:IsA("SpringConstraint"))or(a:IsA("TorsionSpringConstraint"))or(a:IsA("UniversalConstraint"))or(a:IsA("RopeConstraint"))or(a:IsA("RodConstraint"))or(a:IsA("PlaneConstraint"))or(a:IsA("RigidConstraint"))or(a:IsA("NoCollisionConstraint"))then 
        return(true);
    end;
    return(true);
end;

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
        local part_d=Instance.new("Part");
        part_d.Size=Vector3.zero;
        part_d.Transparency=1;
        part_d.CanCollide=false;
        part_d.CanQuery=false;
        part_d.CanTouch=false;
        part_d.Anchored=true;
        part_d.Parent=game:GetService("CoreGui");
        secured_instances[#secured_instances+1]=part_d;
        local part=part_d:Clone();
        local con3;con3=part_d.AncestryChanged:Connect(function(_,p)
            if(part_d==nil)or(part_d:IsDescendantOf(game)==false)then 
                con3:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,part_d));
                pcall(function()
                    table.remove(secured_instances,table.find(secured_instances,part));
                    part:Destroy();
                end);
            end;
        end);

        local visualizer=Instance.new("Part");
        visualizer.Transparency=1;
        visualizer.CanCollide=false;
        visualizer.CanQuery=false;
        visualizer.CanTouch=false;
        visualizer.Anchored=true;
        visualizer.Parent=game:GetService("Workspace");
        secured_instances[#secured_instances+1]=visualizer;
        local con;con=part_d.AncestryChanged:Connect(function(_,p)
            if(part_d==nil)or(part_d:IsDescendantOf(game)==false)then 
                con:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,visualizer));
                visualizer:Destroy();
            end;
        end);

        local esp=Instance.new("BoxHandleAdornment");
        esp.Adornee=visualizer;
        esp.Color3=Color3.fromRGB(13,105,172);
        esp.Transparency=0.4;
        esp.ZIndex=10;
        esp.AlwaysOnTop=true;
        esp.Visible=true;
        esp.Parent=game:GetService("CoreGui");
        secured_instances[#secured_instances+1]=esp;
        local con1;con1=visualizer.AncestryChanged:Connect(function(_,p)
            if(visualizer==nil)or(visualizer:IsDescendantOf(game)==false)or(part==nil)or(part:IsDescendantOf(game)==false)then 
                con1:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,esp));
                esp.Adornee=nil;
                esp.Visible=false;
                esp:Destroy();
            end;
        end);
        while(getgenv().FlipCharacter==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                if(part==nil)or(part:IsDescendantOf(game)==nil)then 
                    local old_part=part;
                    part=part_d:Clone();
                    pcall(function()
                        old_part:Destroy();
                    end);
                end;
                if(table.find(secured_instances,part)==nil)then 
                    secured_instances[#secured_instances+1]=part;
                end;
                if(game:GetService("Players").LocalPlayer.Character~=nil)then 
                    pcall(function()
                        part.Parent=game:GetService("Players").LocalPlayer.Character;
                    end);
                    local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                    local PreCFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;
                    local c_offset=game:GetService("Players").LocalPlayer.Character.Humanoid.CameraOffset+Vector3.new(0,1.5,0);
                    local set_pos=PreCFrame*CFrame.new(getgenv().FlipCharacterX,getgenv().FlipCharacterY,getgenv().FlipCharacterZ)*CFrame.Angles(math.rad(getgenv().FlipCharacterRotX),math.rad(getgenv().FlipCharacterRotY),math.rad(getgenv().FlipCharacterRotZ));
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=set_pos;
                    part.CFrame=PreCFrame*CFrame.new(c_offset);
                    esp.Size=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size;
                    visualizer.Size=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size;
                    visualizer.CFrame=set_pos;
                    if(getgenv().UseCameraBypass==true)then 
                        game:GetService("Workspace").CurrentCamera.CameraSubject=part;
                    end;
                    game:GetService("RunService")[mode]:Wait();
                    local look=PreCFrame;
                    if(game:GetService("UserInputService").MouseBehavior==Enum.MouseBehavior.LockCenter)then 
                        local p=PreCFrame.Position;
                        look=CFrame.lookAt(p,p+Vector3.new(game:GetService("Workspace").CurrentCamera.CFrame.LookVector.X*4,0,game:GetService("Workspace").CurrentCamera.CFrame.LookVector.Z*4));
                    end;
                    part.CFrame=look*CFrame.new(c_offset);
                    if(getgenv().UseCameraBypass==true)then 
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=look;
                        game:GetService("Workspace").CurrentCamera.CameraSubject=part;
                    elseif(getgenv().UseCameraBypass==false)then 
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=PreCFrame;
                    end;
                else 
                    pcall(function()
                        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
                    end);
                    visualizer.CFrame=CFrame.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge);
                    part.CFrame=visualizer.CFrame;
                end;
            end,warn);
        end;
        part_d:Destroy();
        if(getgenv().UseCameraBypass==true)then 
            game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
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

b:Toggle("Flip Character Randomize",function(a)
    getgenv().FlipCharacterRandomize=a;
    spawn(function()
        local random=Random.new(tick());
        while(getgenv().FlipCharacterRandomize==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                getgenv().FlipCharacterX=random:NextNumber(-10,10);
                getgenv().FlipCharacterY=random:NextNumber(-10,10);
                getgenv().FlipCharacterZ=random:NextNumber(-10,10);
                getgenv().FlipCharacterRotX=random:NextNumber(-360,360);
                getgenv().FlipCharacterRotY=random:NextNumber(-360,360);
                getgenv().FlipCharacterRotZ=random:NextNumber(-360,360);
            end);
        end;
    end);
end);

b:Toggle("Use Pre Animation",function(a)
    getgenv().UsePreAnimation=a;
end);

b:Toggle("Use Camera Bypass",function(a)
    getgenv().UseCameraBypass=a;
end);

b:Toggle("Go Into Ground",function(a)
    getgenv().GoIntoGround=a;
    spawn(function()
        local part_d=Instance.new("Part");
        part_d.Size=Vector3.zero;
        part_d.Transparency=1;
        part_d.CanCollide=false;
        part_d.CanQuery=false;
        part_d.CanTouch=false;
        part_d.Anchored=true;
        part_d.Parent=game:GetService("CoreGui");
        secured_instances[#secured_instances+1]=part_d;
        local part=part_d:Clone();
        local con3;con3=part_d.AncestryChanged:Connect(function(_,p)
            if(part_d==nil)or(part_d:IsDescendantOf(game)==false)then 
                con3:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,part_d));
                pcall(function()
                    table.remove(secured_instances,table.find(secured_instances,part));
                    part:Destroy();
                end);
            end;
        end);

        local visualizer=Instance.new("Part");
        visualizer.Transparency=1;
        visualizer.CanCollide=false;
        visualizer.CanQuery=false;
        visualizer.CanTouch=false;
        visualizer.Anchored=true;
        visualizer.Parent=game:GetService("Workspace");
        secured_instances[#secured_instances+1]=visualizer;
        local con;con=part_d.AncestryChanged:Connect(function(_,p)
            if(part_d==nil)or(part_d:IsDescendantOf(game)==false)then 
                con:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,visualizer));
                visualizer:Destroy();
            end;
        end);

        local esp=Instance.new("BoxHandleAdornment");
        esp.Adornee=visualizer;
        esp.Color3=Color3.fromRGB(13,105,172);
        esp.Transparency=0.4;
        esp.ZIndex=10;
        esp.AlwaysOnTop=true;
        esp.Visible=true;
        esp.Parent=game:GetService("CoreGui");
        secured_instances[#secured_instances+1]=esp;
        local con1;con1=visualizer.AncestryChanged:Connect(function(_,p)
            if(visualizer==nil)or(visualizer:IsDescendantOf(game)==false)or(part==nil)or(part:IsDescendantOf(game)==false)then 
                con1:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,esp));
                esp.Adornee=nil;
                esp.Visible=false;
                esp:Destroy();
            end;
        end);
        while(getgenv().GoIntoGround==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                if(part==nil)or(part:IsDescendantOf(game)==nil)then 
                    local old_part=part;
                    part=part_d:Clone();
                    pcall(function()
                        old_part:Destroy();
                    end);
                end;
                if(table.find(secured_instances,part)==nil)then 
                    secured_instances[#secured_instances+1]=part;
                end;
                if(game:GetService("Players").LocalPlayer.Character~=nil)then 
                    pcall(function()
                        part.Parent=game:GetService("Players").LocalPlayer.Character;
                    end);
                    local PreCFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;
                    local c_offset=game:GetService("Players").LocalPlayer.Character.Humanoid.CameraOffset+Vector3.new(0,1.5,0);
                    local set_pos=PreCFrame*CFrame.new(0,-10,0)*CFrame.Angles(0,math.rad(math.random(-10,10)),0);
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=set_pos;
                    part.CFrame=PreCFrame*CFrame.new(c_offset);
                    esp.Size=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size;
                    visualizer.Size=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size;
                    visualizer.CFrame=set_pos;
                    game:GetService("Workspace").CurrentCamera.CameraSubject=part;
                    game:GetService("RunService").PreRender:Wait();
                    local look=PreCFrame;
                    if(game:GetService("UserInputService").MouseBehavior==Enum.MouseBehavior.LockCenter)then 
                        local p=PreCFrame.Position;
                        look=CFrame.lookAt(p,p+Vector3.new(game:GetService("Workspace").CurrentCamera.CFrame.LookVector.X*4,0,game:GetService("Workspace").CurrentCamera.CFrame.LookVector.Z*4));
                    end;
                    part.CFrame=look*CFrame.new(c_offset);
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=look;
                    game:GetService("Workspace").CurrentCamera.CameraSubject=part;
                else 
                    pcall(function()
                        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
                    end);
                end;
            end,warn);
        end;
        part_d:Destroy();
        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Humanoid;
    end);
    spawn(function()
        while(getgenv().GoIntoGround==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if((a:IsA("BasePart"))and((a.Name=="Right Arm")or(a.Name=="Left Arm")or(a.Name=="Right Leg")or(a.Name=="Left Leg")or(a.Name=="Torso")or(a.Name=="Head")))or((a:IsA("BasePart"))and(a:FindFirstAncestorWhichIsA("Accessory")~=nil))or(a:IsA("Decal"))then 
                        a.Transparency=0.9;
                    end;
                end;
            end);
        end;
        for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
            if((a:IsA("BasePart"))and((a.Name=="Right Arm")or(a.Name=="Left Arm")or(a.Name=="Right Leg")or(a.Name=="Left Leg")or(a.Name=="Torso")or(a.Name=="Head")))or((a:IsA("BasePart"))and(a:FindFirstAncestorWhichIsA("Accessory")~=nil))or(a:IsA("Decal"))then 
                a.Transparency=0;
            end;
        end;
    end);
end);

b:Toggle("Spam Swim",function(a)
    getgenv().SpamSwim=a;
    spawn(function()
        while(getgenv().SpamSwim==true)and(game:GetService("RunService").PreAnimation:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Swimming);
                game:GetService("RunService").PreAnimation:Wait();
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping);
            end);
        end;
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

b:Toggle("Other Player Noclip",function(a)
    getgenv().PlayerNoclip=a;
    spawn(function()
        while(getgenv().PlayerNoclip==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                    if(a~=game:GetService("Players").LocalPlayer)and(a.Character~=nil)then 
                        for _,a in pairs(a.Character:GetDescendants())do 
                            if(a:IsA("BasePart"))then 
                                a.CanCollide=false;
                            end;if(IsAConstraint(a)==true)then 
                                a.Enabled=false;
                            end;
                        end;
                    end;
                end;
            end);
        end;
        for _,a in pairs(game:GetService("Players"):GetPlayers())do 
            if(a~=game:GetService("Players").LocalPlayer)and(a.Character~=nil)then 
                for _,a in pairs(a.Character:GetDescendants())do 
                    if(a:IsA("HingeConstraint"))or(a:IsA("BallSocketConstraint"))or(a:IsA("NoCollisionConstraint"))then 
                        a.Enabled=true;
                    end;
                end;
            end;
        end;
    end);
end);

spawn(function()
    while(cinst==getgenv().Inst)and(game:GetService("RunService").Stepped:Wait())do 
        pcall(function()
            for _,a in pairs(secured_instances)do 
                a.Name=randomString();
            end;
        end);
    end;
end);
