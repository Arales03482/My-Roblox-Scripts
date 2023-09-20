local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dsc/MoneyInfsGG");
local b=a:CreateFolder("Main");
local c=a:CreateFolder("Admin");
getgenv().AutoCollectTapes=false;
getgenv().AutoCollectCoinDrops=false;
getgenv().PopAllAtriumBallons=false;
getgenv().AutoSetTime=false;
getgenv().AutoSetTimeNumber=6;

--Anti AFK
if(getgenv().kuefg834rjiy983450==nil)then game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new());end);getgenv().kuefg834rjiy983450="nope not cracking this bitch today";end;

-- Infinite Yield Loader
spawn(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))();end);

-- Main Script
b:Toggle("Auto Collect Tapes",function(a)
    getgenv().AutoCollectTapes=a;
    print(a);
    spawn(function()
        while(getgenv().AutoCollectTapes==true)and(wait(0.1))do 
            pcall(function()
                for _,tp in pairs(game:GetService("Workspace"):GetChildren())do 
                    if(tp["Name"]=="Tape")then 
                        firetouchinterest(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"],tp,0);
                        firetouchinterest(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"],tp,1);
                    end;
                end;
            end);
        end;
    end);
end);

b:Toggle("Auto Collect Coin Drops",function(a)
    getgenv().AutoCollectCoinDrops=a;
    print(a);
    spawn(function()
        while(getgenv().AutoCollectCoinDrops==true)and(wait(0.05))do 
            pcall(function()
                for _,model in pairs(game:GetService("Workspace"):GetChildren())do 
                    local part=model:FindFirstChildWhichIsA("Part");
                    if((model["Name"]=="TicketModel")or(model["Name"]=="CoinModel"))and(model:IsA("Model"))and(part~=nil)then 
                        --local old=game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["CFrame"];
                        --game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["CFrame"]=part["CFrame"];
                        wait(0.35);
                        firetouchinterest(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"],part,0);
                        firetouchinterest(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"],part,1);
                        wait(0.1);
                        --game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["CFrame"]=old;
                    end;
                end;
            end);
        end;
    end);
end);

b:Toggle("Pop All Atrium Ballons",function(a)
    getgenv().PopAllAtriumBallons=a;
    print(a);
    spawn(function()
        while(getgenv().PopAllAtriumBallons==true)and(wait(0.05))do 
            pcall(function()
                for _,ballon in pairs(game:GetService("Workspace").Outside.Map.NEWATRIUM.NewAtriumScripted._scriptedstuff.BalloonStuff.Balloons:GetChildren())do 
                    local hitbox=ballon:FindFirstChild("Hitbox");
                    local meshpart=ballon:FindFirstChild("MainMesh");
                    if(ballon:IsA("Model"))and(hitbox~=nil)and(meshpart~=nil)and(meshpart.Transparency~=1)and(getgenv().PopAllAtriumBallons==true)then 
                        --game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["CFrame"]=hitbox["CFrame"];
                        --wait(0.35);
                        firetouchinterest(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"],hitbox,0);
                        firetouchinterest(game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"],hitbox,1);
                        wait(0.1);
                    end;
                end;
            end);
        end;
    end);
    spawn(function()
        while(getgenv().PopAllAtriumBallons==true)and(game:GetService("RunService")["Stepped"]:Wait())do 
            pcall(function()
                game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["Velocity"]=Vector3["new"](game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["Velocity"]["X"],-65,game:GetService("Players")["LocalPlayer"]["Character"]["HumanoidRootPart"]["Velocity"]["Z"]);
            end);
        end;
    end);
end);

c:Toggle("Auto Set Time",function(a)
    getgenv().AutoSetTime=a;
    print(a);
    spawn(function()
        while(getgenv().AutoSetTime==true)and(wait(0.05))do 
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("PrivateServerAdminRemote"):InvokeServer("TimeChange",getgenv().AutoSetTimeNumber);
            end);
        end;
    end);
end);
c:Box("Auto Set Time Amount","number",function(a)
    getgenv().AutoSetTimeNumber=a;
    print(a);
end);
