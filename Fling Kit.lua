local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/MarksNewHat98/backups-for-backups-of-ui-libs/refs/heads/main/wall%20v3.lua'))():CreateWindow("dotr");
local b=a:CreateFolder("Fling");
local c=a:CreateFolder("Teleporting");
local d=a:CreateFolder("Fun");
local f=a:CreateFolder("Settings");
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
getgenv().FlipCharacterGlobal=false;
getgenv().SmallHRP=false;
getgenv().UsePreAnimation=false;
getgenv().UseCameraBypass=true;
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
getgenv().AntiFling=false;
getgenv().AntiVoid=false;
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

function getRoot(char)
	local rootPart=(char)and((char:FindFirstChild('HumanoidRootPart'))or(char:FindFirstChild('Torso'))or(char:FindFirstChild('UpperTorso'))or(char:FindFirstChildWhichIsA("BasePart",true)));
	return rootPart;
end;

--anti afk
if(getgenv().kuefg834rjiy983450~=nil)and(typeof(getgenv().kuefg834rjiy983450)=="RBXScriptConnection")then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:Connect(function()if(getgenv().AntiAFK==true)then game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new(0,0));end;end);

local enums=Enum.HumanoidStateType:GetEnumItems();
table.remove(enums,table.find(enums,Enum.HumanoidStateType.None));
table.remove(enums,table.find(enums,Enum.HumanoidStateType.Swimming));
--table.remove(enums,table.find(enums,Enum.HumanoidStateType.Seated));
b:Toggle("Touch Fling",function(a)
    getgenv().TouchFling=a;
    task.spawn(function()
        local rnd=Random.new(tick());
        while(getgenv().TouchFling==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                local PreVelocity=getRoot(game:GetService("Players").LocalPlayer.Character).Velocity;
                local vel=Vector3.new(getgenv().TouchFlingX,getgenv().TouchFlingY,getgenv().TouchFlingZ);
                if(getgenv().TouchFlingUseCharacterLookVector==true)then 
                    getRoot(game:GetService("Players").LocalPlayer.Character).Velocity=getRoot(game:GetService("Players").LocalPlayer.Character).CFrame.LookVector*vel;
                elseif(getgenv().TouchFlingUseCharacterLookVector==false)then 
                    getRoot(game:GetService("Players").LocalPlayer.Character).Velocity=Vector3.new(vel.X-math.min(rnd:NextNumber(0,10),vel.Z),vel.Y-math.min(rnd:NextNumber(0,10),vel.Z),vel.Z-math.min(rnd:NextNumber(0,10),vel.Z));
                end;
                game:GetService("RunService")[mode]:Wait();
                getRoot(game:GetService("Players").LocalPlayer.Character).Velocity=PreVelocity;
            end,warn);
        end;
    end);
    task.spawn(function()
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
    task.spawn(function()
        local part_d=Instance.new("Part");
        part_d.Size=Vector3.zero;
        part_d.Transparency=1;
        part_d.CanCollide=false;
        part_d.CanQuery=false;
        part_d.CanTouch=false;
        part_d.Anchored=true;
        local part=part_d:Clone();

        local visualizer=Instance.new("Part");
        visualizer.Transparency=1;
        visualizer.CanCollide=false;
        visualizer.CanQuery=false;
        visualizer.CanTouch=false;
        visualizer.Anchored=true;
        visualizer.Parent=game:GetService("CoreGui");
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
            if(visualizer==nil)or(visualizer:IsDescendantOf(game)==false)then 
                con1:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,esp));
                esp:Destroy();
            end;
        end);
        while(getgenv().FlipCharacter==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                if(part==nil)or(part:IsDescendantOf(game)==nil)then 
                    local old_part=part;
                    part=part_d:Clone();
                    part.Parent=game:GetService("Workspace");
                    secured_instances[#secured_instances+1]=part;
                    if(old_part~=nil)then 
                        old_part:Destroy();
                    end;
                    
                    local con2;con2=part.AncestryChanged:Connect(function(_,p)
                        if(part==nil)or(part:IsDescendantOf(game)==false)then 
                            con2:Disconnect();
                            table.remove(secured_instances,table.find(secured_instances,part));
                        end;
                    end);
                    local con3;con3=part_d.AncestryChanged:Connect(function(_,p)
                        if(part_d==nil)or(part_d:IsDescendantOf(game)==false)then 
                            con3:Disconnect();
                            table.remove(secured_instances,table.find(secured_instances,part));
                        end;
                    end);
                end;
                if(game:GetService("Players").LocalPlayer.Character~=nil)then 
                    local mode=((getgenv().UsePreAnimation==true)and("PreAnimation"))or("PreRender");
                    local lroot=getRoot(game:GetService("Players").LocalPlayer.Character);
                    local PreCFrame=lroot.CFrame;
                    local c_offset=game:GetService("Players").LocalPlayer.Character.Humanoid.CameraOffset+Vector3.new(0,1.5,0);
                    local V=CFrame.new(getgenv().FlipCharacterX,getgenv().FlipCharacterY,getgenv().FlipCharacterZ)*CFrame.Angles(math.rad(getgenv().FlipCharacterRotX),math.rad(getgenv().FlipCharacterRotY),math.rad(getgenv().FlipCharacterRotZ));
                    local set_pos=(getgenv().FlipCharacterGlobal)and(V)or(PreCFrame*V);
                    lroot.CFrame=set_pos;
                    part.CFrame=PreCFrame*CFrame.new(c_offset);
                    esp.Size=lroot.Size;
                    visualizer.Size=lroot.Size;
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
                        lroot.CFrame=look;
                        game:GetService("Workspace").CurrentCamera.CameraSubject=part;
                    elseif(getgenv().UseCameraBypass==false)then 
                        lroot.CFrame=PreCFrame;
                    end;
                else 
                    if(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"))then 
                        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid");
                    end;
                    visualizer.CFrame=CFrame.new(math.huge,math.huge,math.huge);
                    part.CFrame=visualizer.CFrame;
                end;
            end,warn);
        end;
        part_d:Destroy();
        visualizer:Destroy();
        esp:Destroy();
        if(old_part~=nil)then 
            old_part:Destroy();
        end;
        if(part~=nil)then 
            part:Destroy();
        end;
        if(getgenv().UseCameraBypass==true)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"))then 
            game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid");
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
    task.spawn(function()
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
d:Toggle("Flip Character Global CFrame",function(a)
    getgenv().FlipCharacterGlobal=a;
end);

d:Toggle("Small HRP",function(a)
    getgenv().SmallHRP=a;
    if(a==true)then 
        task.spawn(function()
            local con1=game:GetService("RunService").Stepped:Connect(function()
                for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if(__:IsA("BasePart"))then
                        __.CanCollide=false;
                    end;
                end;
            end);
            while(getgenv().SmallHRP==true)do task.wait();end;
            con1:Disconnect()
        end);
        task.spawn(function()
            local part=Instance.new("Part");
            part.Size=Vector3.zero;
            part.Transparency=1;
            part.CanCollide=true;
            part.CanQuery=false;
            part.CanTouch=false;
            part.Massless=true;
            part.Anchored=false;
            part.Parent=game:GetService("Workspace");

            local weldc=Instance.new("WeldConstraint");
            weldc.Part0=part;
            weldc.Parent=part;

            secured_instances[#secured_instances+1]=part;
            local con3;con3=part.AncestryChanged:Connect(function(_,p)
                if(part==nil)or(part:IsDescendantOf(game)==false)then 
                    con3:Disconnect();
                    table.remove(secured_instances,table.find(secured_instances,part));
                end;
            end);
            
            while(getgenv().SmallHRP==true)and(game:GetService("RunService").PreRender:Wait())do 
                xpcall(function()
                    local hrp=getRoot(game:GetService("Players").LocalPlayer.Character)or(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Body"));
                    if(hrp~=nil)then 
                        part.CanCollide=true;
                        part.Anchored=false;
                        part.Position=hrp.Position;
                        part.Rotation=hrp.Rotation;
                        weldc.Part1=hrp;
                    elseif(hrp==nil)then 
                        error("Could not find hrp");
                    end;
                end,function(...)
                    --warn(...);
                    part.CanCollide=false;
                    part.Anchored=true;
                end);
            end;
            part:Destroy();
        end);
    end;
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
    task.spawn(function()
        local old_cf=getRoot(game:GetService("Players").LocalPlayer.Character).CFrame;
        while(getgenv().tp==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                for _,__ in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                    if(__:IsA("BasePart"))then
                        __.CanCollide=false;
                    end;
                end;
                local lroot=getRoot(game:GetService("Players").LocalPlayer.Character);
                local target=game:GetService("Players"):FindFirstChild(getgenv().tpplayer);
                game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false);
                game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true);
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll);
                if(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==false)then 
                elseif(game:GetService("Players").LocalPlayer.Character.Humanoid.Sit==true)or(target==nil)then 
                    game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
                    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
                local troot=getRoot(target.Character);
                if(target~=nil)and(target.Character~=nil)and(troot~=nil)then 
                    local troot=getRoot(target.Character);
                    local cf=troot.CFrame*CFrame.new(getgenv().tpxoffset,getgenv().tpyoffset,getgenv().tpzoffset)*CFrame.Angles(math.rad(getgenv().tprotx),math.rad(getgenv().tproty),math.rad(getgenv().tprotz));
                    if(getgenv().tpvelprediction==true)then 
                        cf=cf+troot.Velocity*getgenv().tpvelpredictionamt;
                    end;
                    lroot.CFrame=cf;
                else 
                    lroot.CFrame=old_cf;
                end;
                game:GetService("RunService").PreRender:Wait();
                lroot.Velocity=Vector3.zero;
            end,warn);
        end;
        for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())do 
            if(a:IsA("BasePart"))then 
                a.CanTouch=true;
            end;
        end;
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true);
            game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,true);
            game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true);
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
        end);
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

c:Toggle("No Touch",function(a)
    getgenv().NoTouch=a;
    task.spawn(function()
        while(getgenv().NoTouch==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
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
    end);
end);

d:Toggle("Go Into Ground",function(a)
    getgenv().GoIntoGround=a;
    task.spawn(function()
        local part_d=Instance.new("Part");
        part_d.Size=Vector3.zero;
        part_d.Transparency=1;
        part_d.CanCollide=false;
        part_d.CanQuery=false;
        part_d.CanTouch=false;
        part_d.Anchored=true;
        local part=part_d:Clone();

        local visualizer=Instance.new("Part");
        visualizer.Transparency=1;
        visualizer.CanCollide=false;
        visualizer.CanQuery=false;
        visualizer.CanTouch=false;
        visualizer.Anchored=true;
        visualizer.Parent=game:GetService("CoreGui");
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
            if(visualizer==nil)or(visualizer:IsDescendantOf(game)==false)then 
                con1:Disconnect();
                table.remove(secured_instances,table.find(secured_instances,esp));
                esp:Destroy();
            end;
        end);
        while(getgenv().GoIntoGround==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            xpcall(function()
                if(part==nil)or(part:IsDescendantOf(game)==nil)then 
                    local old_part=part;
                    part=part_d:Clone();
                    part.Parent=game:GetService("CoreGui");
                    secured_instances[#secured_instances+1]=part;
                    if(old_part~=nil)then 
                        old_part:Destroy();
                    end;

                    local con2;con2=part.AncestryChanged:Connect(function(_,p)
                        if(part==nil)or(part:IsDescendantOf(game)==false)then 
                            con2:Disconnect();
                            table.remove(secured_instances,table.find(secured_instances,part));
                        end;
                    end);
                    local con3;con3=part_d.AncestryChanged:Connect(function(_,p)
                        if(part_d==nil)or(part_d:IsDescendantOf(game)==false)then 
                            con3:Disconnect();
                            table.remove(secured_instances,table.find(secured_instances,part));
                        end;
                    end);
                end;
                if(game:GetService("Players").LocalPlayer.Character~=nil)then 
                    local PreCFrame=getRoot(game:GetService("Players").LocalPlayer.Character).CFrame;
                    local c_offset=game:GetService("Players").LocalPlayer.Character.Humanoid.CameraOffset+Vector3.new(0,1.5,0);
                    local set_pos=PreCFrame*CFrame.new(0,-10,0)*CFrame.Angles(0,math.rad(math.random(-10,10)),0);
                    getRoot(game:GetService("Players").LocalPlayer.Character).CFrame=set_pos;
                    part.CFrame=PreCFrame*CFrame.new(c_offset);
                    esp.Size=getRoot(game:GetService("Players").LocalPlayer.Character).Size;
                    visualizer.Size=getRoot(game:GetService("Players").LocalPlayer.Character).Size;
                    visualizer.CFrame=set_pos;
                    game:GetService("Workspace").CurrentCamera.CameraSubject=part;
                    game:GetService("RunService").PreRender:Wait();
                    local look=PreCFrame;
                    if(game:GetService("UserInputService").MouseBehavior==Enum.MouseBehavior.LockCenter)then 
                        local p=PreCFrame.Position;
                        look=CFrame.lookAt(p,p+Vector3.new(game:GetService("Workspace").CurrentCamera.CFrame.LookVector.X*4,0,game:GetService("Workspace").CurrentCamera.CFrame.LookVector.Z*4));
                    end;
                    part.CFrame=look*CFrame.new(c_offset);
                    getRoot(game:GetService("Players").LocalPlayer.Character).CFrame=look;
                    game:GetService("Workspace").CurrentCamera.CameraSubject=part;
                else 
                    if(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"))then 
                        game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid");
                    end;
                    visualizer.CFrame=CFrame.new(math.huge,math.huge,math.huge);
                    part.CFrame=visualizer.CFrame;
                end;
            end,warn);
        end;
        part_d:Destroy();
        visualizer:Destroy();
        esp:Destroy();
        if(old_part~=nil)then 
            old_part:Destroy();
        end;
        if(part~=nil)then 
            part:Destroy();
        end;
        if(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"))then 
            game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid");
        end;
    end);
    --[[spawn(function()
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
    end);]]
end);

d:Toggle("Lock Angles",function(a)
    getgenv().LockAngles=a;
    task.spawn(function()
        while(getgenv().LockAngles==true)and(game:GetService("RunService").PreRender:Wait())do 
            pcall(function()
                if(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit==false)then 
                    local ang_y,ang_x,ang_z=game:GetService("Workspace").CurrentCamera.CFrame:ToEulerAngles(Enum.RotationOrder.YXZ);
                    getRoot(game:GetService("Players").LocalPlayer.Character).CFrame=CFrame.new(getRoot(game:GetService("Players").LocalPlayer.Character).Position)*CFrame.fromEulerAnglesXYZ(0,ang_x,ang_z);
                end;
            end);
        end;
    end);
end);

d:Toggle("Anti AFK",function(a)
    getgenv().AntiAFK=a;
end);

d:Toggle("Spam Swim",function(a)
    getgenv().SpamSwim=a;
    task.spawn(function()
        while(getgenv().SpamSwim==true)and(game:GetService("RunService").PreRender:Wait())do 
            pcall(function()
                if(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):GetState()~=Enum.HumanoidStateType.Jumping)then 
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping);
                end;
            end);
        end;
    end);
end);

d:Toggle("Anti Lock",function(a)
    getgenv().AntiLock=a;
    task.spawn(function()
        local rnd=Random.new(tick()+((Random.new()):NextNumber()));
        while(getgenv().AntiLock==true)and(game:GetService("RunService").PostSimulation:Wait())do 
            pcall(function()
                local PreVelocity=getRoot(game:GetService("Players").LocalPlayer.Character).Velocity;
                getRoot(game:GetService("Players").LocalPlayer.Character).Velocity=Vector3.new(rnd:NextNumber(200,500),0,0);
                game:GetService("RunService").PreRender:Wait();
                getRoot(game:GetService("Players").LocalPlayer.Character).Velocity=PreVelocity;
            end);
        end;
    end);
end);

d:Toggle("Anti Fling",function(a)
    getgenv().AntiFling=a;
    task.spawn(function()
        local cons={};
        while(getgenv().AntiFling==true)and(game:GetService("RunService").PreRender:Wait())do 
            pcall(function()
                for _,p in pairs(game:GetService("Players"):GetChildren())do 
                    if(p.Name~=game:GetService("Players").LocalPlayer.Name)and(p.Character~=nil)then 
                        task.spawn(function()
                            for _,b in pairs(p.Character:GetDescendants())do 
                                if(b:IsA("BasePart"))and(cons[b]==nil)then 
                                    local con;con=game:GetService("RunService").Stepped:Connect(function()
                                        if(b==nil)or(b:IsDescendantOf(game)==false)then 
                                            con:Disconnect();
                                            return;
                                        end;
                                        b.Velocity=Vector3.new(0,0,0);
                                        b.AssemblyLinearVelocity=Vector3.new(0,0,0);
                                    end);
                                    cons[b]=con;
                                end;
                            end;
                        end);
                    end;
                end;
            end);
        end;
        for b,c in pairs(cons)do 
            if(c~=nil)then 
                c:Disconnect();
            end;
        end;
        table.clear(cons);
    end);
end);

d:Toggle("Anti Void",function(a)
    getgenv().AntiVoid=a;
    task.spawn(function()
		local _destroyheight=workspace.FallenPartsDestroyHeight;
        while(getgenv().AntiVoid==true)do 
		    workspace.FallenPartsDestroyHeight=0/0;
            task.wait()
        end;
		workspace.FallenPartsDestroyHeight=_destroyheight;
    end);
end);

b:Toggle("Other Player Noclip",function(a)
    getgenv().PlayerNoclip=a;
    task.spawn(function()
        local cons={};
        local function cadded(plr,char)
            if(cons[plr.UserId.."CharacterDescendantAdded"]~=nil)then cons[plr.UserId.."CharacterDescendantAdded"]:Disconnect();cons[plr.UserId.."CharacterDescendantAdded"]=nil;end;
            local function iadded(a)
                if(getgenv().PlayerNoclip==true)then 
                    if(a:IsA("BasePart"))then 
                        task.spawn(function()
                            while(getgenv().PlayerNoclip==true)and(a~=nil)and(a:IsDescendantOf(game)==true)do 
                                pcall(function()
                                    a.CanCollide=false;
                                end);
                                game:GetService("RunService").PreRender:Wait();
                            end;
                        end);
                    end;if(IsAConstraint(a)==true)then 
                        task.spawn(function()
                            while(getgenv().PlayerNoclip==true)and(a~=nil)and(a:IsDescendantOf(game)==true)do 
                                pcall(function()
                                    a.Enabled=false;
                                end);
                                game:GetService("RunService").PreRender:Wait();
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
        while(getgenv().PlayerNoclip==true)do game:GetService("RunService").PreRender:Wait();end;
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
                    if(a:IsA("BasePart"))then 
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
