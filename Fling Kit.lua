local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Fling");
local c=a:CreateFolder("Teleporting");
local d=a:CreateFolder("Fun");
local f=a:CreateFolder("Settings");
getgenv().FlingSwim=false;
getgenv().FlingSwimFly=false;
getgenv().FlingSwimFlySpeed=30;
getgenv().TouchFling=false;
getgenv().TouchFlingX=-812983092810382981;
getgenv().TouchFlingY=812983092810382981;
getgenv().TouchFlingZ=-812983092810382981;
getgenv().TouchFlingUseCharacterLookVector=false;
getgenv().TouchFlingShouldSwim=false;
getgenv().FlipCharacter=false;
getgenv().FlipCharacterX=0;
getgenv().FlipCharacterY=0;
getgenv().FlipCharacterZ=0;
getgenv().FlipCharacterRotX=0;
getgenv().FlipCharacterRotY=0;
getgenv().FlipCharacterRotZ=180;
getgenv().FlipCharacterRandomize=false;
getgenv().SmallHRP=false;
getgenv().UsePreAnimation=false;
getgenv().UseCameraBypass=false;
getgenv().tp=false;
getgenv().tprotx=0;
getgenv().tproty=0;
getgenv().tprotz=0;
getgenv().tpxoffset=0;
getgenv().tpyoffset=0;
getgenv().tpzoffset=15;
getgenv().tpvelprediction=false;
getgenv().tpvelpredictionamt=0.55;
getgenv().tpplayer="";
getgenv().AntiAFK=false;
getgenv().GoIntoGround=false;
getgenv().LockAngles=false;
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
    return(false);
end;

local function fixVector(vec)
	return(Vector3.new(math.cos(math.atan2(vec.Z,vec.X)),0,math.sin(math.atan2(vec.Z,vec.X))));
end;

--anti afk
if(getgenv().kuefg834rjiy983450~=nil)and(typeof(getgenv().kuefg834rjiy983450)=="RBXScriptConnection")then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:Connect(function()if(getgenv().AntiAFK==true)then game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new(0,0));end;end);

local enums=Enum.HumanoidStateType:GetEnumItems();
table.remove(enums,table.find(enums,Enum.HumanoidStateType.None));
table.remove(enums,table.find(enums,Enum.HumanoidStateType.Swimming));
--table.remove(enums,table.find(enums,Enum.HumanoidStateType.Seated));
b:Toggle("Touch Fling",function(a)
    getgenv().TouchFling=a;
    spawn(function()
        local rnd=Random.new(tick());
        while(getgenv().TouchFling==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                local PreVelocity=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity;
                local vel=Vector3.new(getgenv().TouchFlingX-math.min(rnd:NextNumber(0,10),getgenv().TouchFlingZ),getgenv().TouchFlingY-math.min(rnd:NextNumber(0,10),getgenv().TouchFlingZ),getgenv().TouchFlingZ-math.min(rnd:NextNumber(0,10),getgenv().TouchFlingZ));
                if(getgenv().TouchFlingUseCharacterLookVector==true)then 
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=(CFrame.fromAxisAngle(Vector3.new(1,0,0),vel.X)*CFrame.fromAxisAngle(Vector3.new(0,1,0),vel.Y)*CFrame.fromAxisAngle(Vector3.new(0,0,1),vel.Z)):VectorToWorldSpace(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector)*vel;
                elseif(getgenv().TouchFlingUseCharacterLookVector==false)then 
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=vel;
                end;
                game:GetService("RunService")[mode]:Wait();
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=PreVelocity;
            end,warn);
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
b:Box("Touch Fling X","number",function(a)
    getgenv().TouchFlingX=(tonumber(a))or(getgenv().TouchFlingX);
end);
b:Box("Touch Fling Y","number",function(a)
    getgenv().TouchFlingY=(tonumber(a))or(getgenv().TouchFlingY);
end);
b:Box("Touch Fling Z","number",function(a)
    getgenv().TouchFlingZ=(tonumber(a))or(getgenv().TouchFlingZ);
end);
b:Toggle("Touch Fling Use Character LookVector",function(a)
    getgenv().TouchFlingUseCharacterLookVector=a;
end);
b:Toggle("Touch Fling Should Swim",function(a)
    getgenv().TouchFlingShouldSwim=a;
end);

d:Toggle("Flip Character",function(a)
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
d:Box("Flip Character X","number",function(a)
    getgenv().FlipCharacterX=(tonumber(a))or(getgenv().FlipCharacterX);
end);
d:Box("Flip Character Y","number",function(a)
    getgenv().FlipCharacterY=(tonumber(a))or(getgenv().FlipCharacterY);
end);
d:Box("Flip Character Z","number",function(a)
    getgenv().FlipCharacterZ=(tonumber(a))or(getgenv().FlipCharacterZ);
end);
d:Box("Flip Character Rot X","number",function(a)
    getgenv().FlipCharacterRotX=(tonumber(a))or(getgenv().FlipCharacterRotX);
end);
d:Box("Flip Character Rot Y","number",function(a)
    getgenv().FlipCharacterRotY=(tonumber(a))or(getgenv().FlipCharacterRotY);
end);
d:Box("Flip Character Rot Z","number",function(a)
    getgenv().FlipCharacterRotZ=(tonumber(a))or(getgenv().FlipCharacterRotZ);
end);
d:Toggle("Flip Character Randomize",function(a)
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

d:Toggle("Small HRP",function(a)
    getgenv().SmallHRP=a;
    spawn(function()
        local part=Instance.new("Part");
        part.Size=Vector3.zero;
        part.Transparency=1;
        part.CanCollide=true;
        part.CanQuery=false;
        part.CanTouch=false;
        part.Massless=true;
        part.Anchored=false;

        local weldc=Instance.new("WeldConstraint");
        weldc.Part0=part;
        weldc.Parent=part;

        local weld=Instance.new("Weld");
        weld.Part0=part;
        weld.Parent=part;

        part.Parent=game:GetService("Workspace");
        secured_instances[#secured_instances+1]=part;
        local con3;con3=part.AncestryChanged:Connect(function(_,p)
            if(part==nil)or(part:IsDescendantOf(game)==false)then 
                con3:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,part));
                pcall(function()
                    table.remove(secured_instances,table.find(secured_instances,part));
                    part:Destroy();
                end);
            end;
        end);
        
        while(getgenv().SmallHRP==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                local hrp=(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("LowerTorso"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Body"))or(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"));
                if(hrp~=nil)then 
                    part.Anchored=false;
                    part.Velocity=Vector3.zero;
                    weld.Part1=hrp;
                    game:GetService("RunService").PostSimulation:Wait();
                    weldc.Part1=hrp;
                elseif(hrp==nil)then 
                    error("Could not find hrp");
                end;
            end,function(...)
                --warn(...);
                part.Anchored=true;
            end);
        end;
        part:Destroy();
    end);
end);

f:Toggle("Use Pre Animation",function(a)
    getgenv().UsePreAnimation=a;
end);

f:Toggle("Use Camera Bypass",function(a)
    getgenv().UseCameraBypass=a;
end);

c:Toggle("Follow player",function(a)
    getgenv().tp=a;
    if(getgenv().tpplayer=="")then 
        warn("Please input a player");
        getgenv().tp=false;
        return;
    end;
    spawn(function()
        while(getgenv().tp==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if(__:IsA("BasePart"))then
                        __.CanCollide=false;
                    end;
                end;
                if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==false)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false);
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,false);
                    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll);
                elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,true);
                    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
                local cf=game:GetService("Players")[getgenv().tpplayer].Character.HumanoidRootPart.CFrame*CFrame.new(getgenv().tpxoffset,getgenv().tpyoffset,getgenv().tpzoffset)*CFrame.Angles(math.rad(getgenv().tprotx),math.rad(getgenv().tproty),math.rad(getgenv().tprotz));
                if(getgenv().tpvelprediction==true)then 
                    cf=cf+game:GetService("Players")[getgenv().tpplayer].Character.HumanoidRootPart.Velocity*getgenv().tpvelpredictionamt;
                end;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=cf;
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.zero;
                for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())do 
                    if(a:IsA("BasePart"))then 
                        a.CanTouch=false;
                    end;
                end;
            end);
        end;
        for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())do 
            if(a:IsA("BasePart"))then 
                a.CanTouch=true;
            end;
        end;
        game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
        game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,true);
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
    end);
end);
c:Box("Follow Player Rotation X","number",function(_)
    if(tonumber(_)~=nil)then 
        getgenv().tprotx=tonumber(_);
    end;
end);
c:Box("Follow Player Rotation Y","number",function(_)
    if(tonumber(_)~=nil)then 
        getgenv().tproty=tonumber(_);
    end;
end);
c:Box("Follow Player Rotation Z","number",function(_)
    if(tonumber(_)~=nil)then 
        getgenv().tprotz=tonumber(_);
    end;
end);
c:Box("Follow Player Offset X","number",function(_)
    if(tonumber(_)~=nil)then 
        getgenv().tpxoffset=tonumber(_);
    end;
end);
c:Box("Follow Player Offset Y","number",function(_)
    if(tonumber(_)~=nil)then 
        getgenv().tpyoffset=tonumber(_);
    end;
end);
c:Box("Follow Player Offset Z","number",function(_)
    if(tonumber(_)~=nil)then 
        getgenv().tpzoffset=tonumber(_);
    end;
end);
c:Toggle("Follow Player Velocity Prediction",function(a)
    getgenv().tpvelprediction=a;
end);
c:Slider("Follow Player Prediction Amount",{min=0;max=50},function(_)
    if(tonumber(_)~=nil)then 
        getgenv().tpvelpredictionamt=tonumber(_);
    end;
end);
c:Box("Player to Follow","string",function(str)
    if(str=="")then 
        warn("Please enter a player name");
    else 
        for _,k in pairs(game:GetService("Players"):GetPlayers())do 
            if(str:lower()==k.Name:sub(1,#str):lower())then 
                getgenv().tpplayer=k.Name;
                if(game:GetService("Players"):FindFirstChild(getgenv().tpplayer)~=nil)then print("Target Chosen as "..getgenv().tpplayer);end;
                return;
            end;
        end;
        if(game:GetService("Players"):FindFirstChild(getgenv().tpplayer)==nil)then print("Inputed player could not be found");getgenv().tpplayer="";end;
    end;
end);

d:Toggle("Go Into Ground",function(a)
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

d:Toggle("Lock Angles",function(a)
    getgenv().LockAngles=a;
    spawn(function()
        while(getgenv().LockAngles==true)and(game:GetService("RunService").PreRender:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)*CFrame.fromEulerAnglesXYZ(game:GetService("Workspace").CurrentCamera.CFrame:ToEulerAngles(Enum.RotationOrder.XYZ));
            end);
        end;
    end);
end);

d:Toggle("Anti AFK",function(a)
    getgenv().AntiAFK=a;
end);

d:Toggle("Spam Swim",function(a)
    getgenv().SpamSwim=a;
    spawn(function()
        while(getgenv().SpamSwim==true)and(game:GetService("RunService").PreAnimation:Wait())do 
            pcall(function()
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping);
            end);
        end;
    end);
end);

d:Toggle("Anti Lock",function(a)
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

d:Toggle("Anti Anti Lock",function(a)
    getgenv().AntiAntiLock=a;
    spawn(function()
        while(getgenv().AntiAntiLock==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                for _,p in pairs(game:GetService("Players"):GetChildren())do 
                    if(p.Name~=game:GetService("Players").LocalPlayer.Name)then 
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
        local cons={};
        local function cadded(plr,char)
            if(cons[plr.UserId.."CharacterDescendantAdded"]~=nil)then cons[plr.UserId.."CharacterDescendantAdded"]:Disconnect();cons[plr.UserId.."CharacterDescendantAdded"]=nil;end;
            local function iadded(a)
                if(getgenv().PlayerNoclip==true)then 
                    if(a:IsA("BasePart"))and(a.Name~="HumanoidRootPart")then 
                        spawn(function()
                            while(getgenv().PlayerNoclip==true)and(a~=nil)and(a:IsDescendantOf(game)==true)do 
                                pcall(function()
                                    a.CanCollide=false;
                                end);
                                game:GetService("RunService").Stepped:Wait();
                            end;
                        end);
                    end;if(IsAConstraint(a)==true)then 
                        spawn(function()
                            while(getgenv().PlayerNoclip==true)and(a~=nil)and(a:IsDescendantOf(game)==true)do 
                                pcall(function()
                                    a.Enabled=false;
                                end);
                                game:GetService("RunService").Stepped:Wait();
                            end;
                        end);
                    end;
                end;
            end;
            cons[plr.UserId.."CharacterDescendantAdded"]=char.DescendantAdded:Connect(iadded);
            for _,a in pairs(char:GetDescendants())do 
                iadded(a);
            end;
        end;
        local function added(plr)
            if(plr.Name~=game:GetService("Players").LocalPlayer.Name)then 
                if(cons[plr.UserId.."CharacterDescendantAdded"]~=nil)then cons[plr.UserId.."CharacterDescendantAdded"]:Disconnect();cons[plr.UserId.."CharacterDescendantAdded"]=nil;end;
                if(cons[plr.UserId.."CharacterAdded"]~=nil)then cons[plr.UserId.."CharacterAdded"]:Disconnect();cons[plr.UserId.."CharacterAdded"]=nil;end;
                cons[plr.UserId.."CharacterAdded"]=plr.CharacterAdded:Connect(function(char)
                    cadded(plr,char);
                end);
                if(plr.Character~=nil)then 
                    cadded(plr,plr.Character);
                end;
            end;
        end;
        local con;con=game:GetService("Players").PlayerAdded:Connect(added);
        for _,a in pairs(game:GetService("Players"):GetPlayers())do 
            added(a);
        end;
        while(getgenv().PlayerNoclip==true)do game:GetService("RunService").Stepped:Wait();end;
        if(con~=nil)then con:Disconnect();end;
        if(cons~=nil)then 
            for _,con1 in pairs(cons)do 
                if(con1~=nil)then 
                    con1:Disconnect();
                end;
            end;
        end;
        for _,plr in pairs(game:GetService("Players"):GetPlayers())do 
            if(plr.Name~=game:GetService("Players").LocalPlayer.Name)and(plr.Character~=nil)then 
                for _,a in pairs(plr.Character:GetDescendants())do 
                    if(a:IsA("BasePart"))and(a.Name~="HumanoidRootPart")then 
                        a.CanCollide=false;
                    end;if(IsAConstraint(a)==true)then 
                        a.Enabled=false;
                    end;
                end;
            end;
        end;
    end);
end);

f:DestroyGui();

spawn(function()
    while(cinst==getgenv().Inst)and(game:GetService("RunService").Stepped:Wait())do 
        pcall(function()
            for _,a in pairs(secured_instances)do 
                a.Name=randomString();
            end;
        end);
    end;
end);
