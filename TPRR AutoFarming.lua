local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dsc/MoneyInfsGG");
local b=a:CreateFolder("Main");
local c=a:CreateFolder("Admin");
getgenv().AutoCollectTapes=false;
getgenv().AutoCollectCoinDrops=false;
getgenv().PopAllAtriumBallons=false;
getgenv().AutoSetTime=false;
getgenv().AutoSetTimeNumber=6;

--Anti AFK
if(getgenv().kuefg834rjiy983450~=nil)and(typeof(getgenv().kuefg834rjiy983450)=="RBXScriptConnection")then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:Connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new(0,0));end);

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

b:Button("Server Hop",function(a)
    local queue_teleport=((syn)and(syn.queue_on_teleport))or(queue_on_teleport)or((fluxus)and(fluxus.queue_on_teleport));
    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(status)
        if(status==Enum.TeleportState.InProgress)and(queue_teleport~=nil)then 
            queue_teleport("wait(0.5);if(game:IsLoaded()==false)then game.Loaded:Wait();end;loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Arales03482/My-Roblox-Scripts/main/TPRR%20AutoFarming.lua\"))();");
        end;
    end);
    spawn(function()
        local fullurl=string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100",game.PlaceId);
        local url_data={Url=fullurl};
        local cursor=nil;
        local servers={};
        while(wait())do 
            xpcall(function()
                while(wait())do 
                    table.clear(servers);
                    url_data.Url=((cursor~=nil)and(fullurl.."&cursor="..cursor))or(fullurl);
    
                    local req=requester(url_data);
                    local body=game:GetService("HttpService"):JSONDecode(req.Body);
                    if(body==nil)or(body.data==nil)or(body.data[1]==nil)then 
                        cursor=nil;
                        table.clear(body);
                        body=nil;
                        break;
                    end;
                    local data=body.data;
                    if(cursor==body.nextPageCursor)and(cursor~=nil)then 
                        cursor=nil;
                        table.clear(body);
                        body=nil;
                        break;
                    end;
                    cursor=body.nextPageCursor;
                    if(body~=nil)and(data~=nil)then 
                        for _,server_data in next,data do 
                            if(type(server_data)=="table")and(tonumber(server_data.playing)~=nil)and(tonumber(server_data.maxPlayers)~=nil)and(server_data.playing<server_data.maxPlayers)and(server_data.id~=game.JobId)and(table.find(getgenv().last_servers,server_data.id)==nil)then 
                                servers[#servers+1]=server_data.id;
                            end;
                            table.clear(server_data);
                            server_data=nil;
                        end;
                        table.clear(data);
                        table.clear(body);
                        data=nil;
                        body=nil;
                    end;
                    print(#servers);
                    if(#servers>=1)then 
                        break;
                    end;
                    table.clear(servers);
                end;
                if(#servers>=1)then 
                    local serverid=servers[math.random(1,#servers)];
                    table.clear(servers);
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,serverid,game:GetService("Players").LocalPlayer);
                    game:GetService("Players").LocalPlayer.OnTeleport:Wait();
                end;
                table.clear(servers);
            end,warn);
        end;
    end);
end);
