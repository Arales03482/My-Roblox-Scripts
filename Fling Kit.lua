local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Main");
getgenv().FlingSwim=false;
getgenv().FlingSwimFly=false;
getgenv().FlingSwimFlySpeed=20;
getgenv().PlayerNoclip=false;

--anti afk
if(getgenv().kuefg834rjiy983450~=nil)then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);wait(1);game:service("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);end);

local enums=Enum.HumanoidStateType:GetEnumItems();
table.remove(enums,table.find(enums,Enum.HumanoidStateType.None));
b:Toggle("Fling Swim",function(a)
    getgenv().FlingSwim=a;
    spawn(function()
        if(a==true)then 
            local active=true;
            local t=tick();
            local oldgrav=game:GetService("Workspace").Gravity;
		    game:GetService("Workspace").Gravity=0;
            while(getgenv().FlingSwim==true)do 
                local dt=game:GetService("RunService").Heartbeat:Wait();
                xpcall(function()
                    for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                        if(a:IsA("BasePart"))then 
                            a.CanCollide=false;
                        end;
                    end;
                    if(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):GetState()~=Enum.HumanoidStateType.Swimming)then 
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Swimming);
                    end;
                    game:GetService("RunService").Heartbeat:Wait();
                    for _,a in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do 
                        if(a:IsA("BasePart"))then 
                            a.CanCollide=false;
                        end;
                    end;
                    for _,enum in pairs(enums)do 
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(enum,false);
                    end;
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.zero;
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity;
                    if(tick()-t>=0.1)then 
                        active=not(active);
                        t=tick();
                    end;
                    --if(active==true)then 
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity=Vector3.new(0,1000000,0);
                    --elseif(active==false)then 
                        --game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity=Vector3.zero;
                    --end;
                    --game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                    game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character.Head;
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
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame+((mod*5)*dt*getgenv().FlingSwimFlySpeed);
                    end;
                end,warn);
            end;
            for _,enum in pairs(enums)do 
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(enum,true);
            end;
            game:GetService("Workspace").Gravity=oldgrav;
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.zero;
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.RotVelocity=Vector3.zero;
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity=Vector3.zero;
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity=Vector3.zero;
            game:GetService("Workspace").CurrentCamera.CameraSubject=game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid");
        end;
    end);
end);
b:Toggle("Fling Swim Fly",function(a)
    getgenv().FlingSwimFly=a;
end);
b:Box("Fling Swim Fly Speed","number",function(a)
    getgenv().FlingSwimFlySpeed=a;
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
