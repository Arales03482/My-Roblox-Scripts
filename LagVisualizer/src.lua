local socket;
local currentUsers={};
local data={};
local game=game;

if(getgenv().hosturl==nil)then getgenv().hosturl="ws://192.168.1.177:2344/";end;

local socker=((Krnl)and(Krnl.WebSocket)and(Krnl.WebSocket.connect))or((syn)and(syn.websocket)and(syn.websocket.connect));

if(socker==nil)then 
    error("Executor not supported!");
end;

if(game:IsLoaded()==false)then 
    game.Loaded:Wait();
end;
if(getgenv().visualizepart==nil)then 
    getgenv().visualizepart=Instance.new("Part");
    visualizepart.Material="ForceField";
    visualizepart.Name="Visualizer";
    visualizepart.Color=Color3.fromRGB(255,0,0);
    visualizepart.CFrame=CFrame.new(0,0,0);
    visualizepart.Position=Vector3.new(0,0,0);
    visualizepart.Rotation=Vector3.new(0,0,0);
    visualizepart.Size=Vector3.new(2,2,1);
    visualizepart.Anchored=true;
    visualizepart.CanCollide=false;
    visualizepart.Parent=game:GetService("Workspace");
end;

getgenv().testcdesync=false;
wait(5);
getgenv().testcdesync=true;

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
function toTable(s)
	if not s:find '^%s*{' then return nil end
	if s:find '[^\'"%w_]function[^\'"%w_]' then
		return nil
	end
	s = 'return '..s
	local chunk = loadstring(s,'tbl','t',{})
	if not chunk then return nil end
	local ok,ret = pcall(chunk)
	if ok then return ret
	else
		return nil
	end
end

local closed=false;
spawn(function()
    while(getgenv().testcdesync==true)and(wait())do 
        xpcall(function()
            closed=false;
            socket=socker(getgenv().hosturl);
            socket.OnMessage:Connect(function(msg)
                local spi=msg:split("´");
                if(spi[1]=="cons")then 
                    currentUsers={};
                    for a,b in pairs(decode(((spi[2]~="")and(spi[2]))or("{}")))do 
                        print(a,b);
                        if(game:GetService("Players"):FindFirstChild(a)~=nil)and(a~=game:GetService("Players").Name)then 
                            table.insert(currentUsers,game:GetService("Players"):FindFirstChild(a));
                        end;
                    end;
                    print(((spi[2]~="")and(spi[2]))or("{}"));
                elseif(spi[1]=="data")and(spi[2]==game:GetService("Players").LocalPlayer.Name)and(spi[3]~=game:GetService("Players").LocalPlayer.Name)then 
                    local rdata=toTable(spi[4]); --decode(spi[4]);
                    local cf=rdata[1];
                    local sz=rdata[2];
                    getgenv().visualizepart.CFrame=cf;
                    getgenv().visualizepart.Size=sz;
                end;
            end);
            socket:Send("auth´"..game.Players.LocalPlayer.Name);
            local c;c=socket.OnClose:Connect(function()closed=true;end);
            while(getgenv().testcdesync==true)and(closed==false)do wait();end;
            pcall(function()c:Disconnect();socket:Close();end);
            socket=nil;
        end,print);
    end;
end);

if((getgenv().hostuser~=nil)and(getgenv().hostuser~=game:GetService("Players").LocalPlayer.Name))or(getgenv().hostuser==nil)then 
    spawn(function()
        while(getgenv().testcdesync==true)do 
            xpcall(function()
                if(socket~=nil)then 
                    for b,a in pairs(currentUsers)do 
                        if(a~=nil)and(a.Name~=game:GetService("Players").LocalPlayer.Name)then 
                            local cf=CFrame.new(0,0,0);
                            local sz=Vector3.new(2,2,1);pcall(function()cf=a.Character.HumanoidRootPart.CFrame;pos=cf.Position;rot=a.Character.HumanoidRootPart.Rotation;sz=a.Character.HumanoidRootPart.Size;end);
                            socket:Send("data´"..a.Name.."´"..game:GetService("Players").LocalPlayer.Name.."´{CFrame.new("..tostring(cf).."),Vector3.new("..tostring(sz)..")}");
                        elseif(a~=nil)and(a.Name~=game:GetService("Players").LocalPlayer.Name)then 
                            table.remove(currentUsers,b);
                        end;
                    end;
                end;
            end,print);
            wait(0.5);
        end;
    end);
end;
