local socket;
local currentUsers={};
local lastdatas={};
local data={};
local items="{'HumanoidRootPart','Torso','Left Arm','Right Arm','Left Leg','Right Leg','Head'}";
local game=game;

--Anti AFK
if(getgenv().kuefg834rjiy983450==nil)then game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new());end);getgenv().kuefg834rjiy983450="nope not cracking this bitch today";end;

if(getgenv().hosturl==nil)then getgenv().hosturl="ws://192.168.1.177:2344/";end;
if(getgenv().vizfreq==nil)then getgenv().vizfreq=0.1;end;

local socker=((Krnl~=nil)and(Krnl.WebSocket~=nil)and(Krnl.WebSocket.connect))or((syn~=nil)and(syn.websocket~=nil)and(syn.websocket.connect));

if(game:IsLoaded()==false)then 
    game.Loaded:Wait();
end;
if(getgenv().visualizepart==nil)then 
    getgenv().visualizepart=Instance.new("Part");
    visualizepart.Material="ForceField";
    visualizepart.Name="Visualizer";
    visualizepart.Color=Color3.fromRGB(255,0,0);
    visualizepart.CFrame=CFrame.new(0,0,0);
    visualizepart.Size=Vector3.new(2,2,1);
    visualizepart.Anchored=true;
    visualizepart.CanCollide=false;
end;

local hser=game:GetService("HttpService");
local deb=game:GetService("Debris");
local encodeo=hser.JSONEncode;
local decodeo=hser.JSONDecode;
local debaddo=deb.AddItem;
function encode(...)
    return(encodeo(hser,...));
end;
function decode(...)
    return(decodeo(hser,...));
end;
function debadd(...)
    return(debaddo(deb,...));
end;
function toTable(s,def)
	if(s:find('^%s*{'))then 
        if(s:find('[^\'"%w_]function[^\'"%w_]'))then return(def);end;
        s='return '..s;
        local chunk=loadstring(s,'tbl','t',{});
        if(chunk==nil)then return(def);end;
        local ok,ret=pcall(chunk);
        if(ok==true)then 
            return(ret)
        elseif(ok==false)then 
            return(def);
        end;
    end;
    return(def);
end;

if(socker==nil)then 
    error("Executor not supported!");
end;

getgenv().testcdesync=false;
getgenv().visualizepart.CFrame=CFrame.new(0,0,0);
if(Krnl~=nil)then 
    wait(2.5);
end;
wait(5);
getgenv().testcdesync=true;

local closed=false;
spawn(function()
    while(getgenv().testcdesync==true)and(wait())do 
        xpcall(function()
            closed=false;
            socket=socker(getgenv().hosturl);
            socket.OnMessage:Connect(function(msg)
                local spi=msg:split("´");
                if(spi[1]=="cons")then 
                    local pending={};
                    for a,b in pairs(decode(((spi[2]~="")and(spi[2]))or("{}")))do 
                        print(a,b);
                        if(game:GetService("Players"):FindFirstChild(a)~=nil)and(a~=game:GetService("Players").Name)then 
                            table.insert(pending,game:GetService("Players"):FindFirstChild(a));
                        end;
                    end;
                    print(((spi[2]~="")and(spi[2]))or("{}"));
                    currentUsers=pending;
                    lastdatas={};
                elseif(spi[1]=="data")and(spi[2]=="lagviz")and(spi[3]==game:GetService("Players").LocalPlayer.Name)and(spi[4]~=game:GetService("Players").LocalPlayer.Name)then 
                    print(spi[6]);
                    local ritems=toTable(spi[5],items);
                    local rdata=toTable(spi[6],{["HumanoidRootPart"]={Position=Vector3.new(0,0,0),Rotation=Vector3.new(0,0,0),Size=Vector3.new(2,2,1)}});
                    for _,item in pairs(ritems)do 
                        spawn(function()
                            local pt=game:GetService("Players").LocalPlayer.Character:FindFirstChild(item);
                            local dt=rdata[item];
                            if(pt~=nil)and(dt~=nil)then 
                                local vp=pt:FindFirstChild("Visualizer");
                                if(vp==nil)then 
                                    vp=visualizepart:Clone();
                                    vp.Parent=pt;
                                end;
                                vp.Position=dt["Position"];
                                vp.Rotation=dt["Rotation"];
                                vp.Size=dt["Size"];
                            end;
                        end);
                    end;
                end;
            end);
            socket:Send("auth´"..game:GetService("Players").LocalPlayer.Name);
            local c;c=socket.OnClose:Connect(function()closed=true;end);
            while(getgenv().testcdesync==true)and(closed==false)do wait();end;
            pcall(function()c:Disconnect();socket:Close();end);
            socket=nil;
        end,print);
    end;
end);

if((getgenv().hostuser~=nil)and(getgenv().hostuser~=game:GetService("Players").LocalPlayer.Name))or(getgenv().hostuser==nil)or(getgenv().hostuser=="nil")then 
    spawn(function()
        while(getgenv().testcdesync==true)do 
            xpcall(function()
                if(socket~=nil)then 
                    local ttbl=toTable(items,{'HumanoidRootPart','Torso','Left Arm','Right Arm','Left Leg','Right Leg','Head'});
                    for b,a in pairs(currentUsers)do 
                        if(a~=nil)and(a.Parent~=nil)and(a.Character~=nil)and(a.Name~=game:GetService("Players").LocalPlayer.Name)then 
                            local data="{";
                            for _,part in pairs(a.Character:GetChildren())do 
                                if(part:IsA("BasePart"))and(table.find(ttbl,part.Name))then 
                                    local pos=CFrame.new(0,0,0);
                                    local rot=CFrame.new(0,0,0);
                                    local sz=Vector3.new(2,2,1);pcall(function()pos=part.Position;rot=part.Rotation;sz=part.Size;end);
                                    data=data.."['"..part.Name.."'] = {Position = Vector3.new("..string.format("%3i, %3i, %3i",pos.X,pos.Y,pos.Z).."), Rotation = Vector3.new("..tostring(rot).."), Size = Vector3.new("..tostring(string.format("%3i, %3i, %3i",pos.X,pos.Y,pos.Z))..")}, "
                                end;
                            end;
                            data=data:sub(1,data:len()-2);
                            data=data.."}";
                            local hrppos=CFrame.new(0,0,0);
                            local hrprot=CFrame.new(0,0,0);
                            local hrpsz=Vector3.new(2,2,1);pcall(function()hrppos=a.Character.HumanoidRootPart.Position;hrprot=a.Character.HumanoidRootPart.Rotation;hrpsz=a.Character.HumanoidRootPart.Size;end);
                            local gdata="{Position = Vector3.new("..string.format("%3i, %3i, %3i",hrppos.X,hrppos.Y,hrppos.Z).."), Rotation = Vector3.new("..string.format("%3i, %3i, %3i",hrprot.X,hrprot.Y,hrprot.Z).."), Size = Vector3.new("..tostring(string.format("%3i, %3i, %3i",hrpsz.X,hrpsz.Y,hrpsz.Z))..")}"
                            if(lastdatas[a.Name]~=gdata)then 
                                lastdatas[a.Name]=gdata;
                                print(gdata);
                                socket:Send("data´lagviz´"..a.Name.."´"..game:GetService("Players").LocalPlayer.Name.."´"..items.."´"..data);
                            end;
                        elseif(a~=nil)and(a.Name==game:GetService("Players").LocalPlayer.Name)then 
                            table.remove(currentUsers,b);
                        end;
                    end;
                end;
            end,print);
            wait(getgenv().vizfreq);
        end;
    end);
end;

game:GetService("Players").PlayerRemoving:Connect(function(a)
    if(a.Name==game:GetService("Players").LocalPlayer.Name)then 
        getgenv().testcdesync=false;
    end;
end);
