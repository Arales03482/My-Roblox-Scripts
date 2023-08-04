if(game:IsLoaded()==false)then 
	game.Loaded:Wait();
end;
if(game.PlaceId==0)then return;end;

if(getgenv().last_servers~=nil)then 
	getgenv().last_servers[#getgenv().last_servers+1]=game.JobId;
elseif(getgenv().last_servers==nil)then 
	getgenv().last_servers={game.JobId};
end;

if(getgenv().last_servers~=nil)and(#getgenv().last_servers>10)then 
	table.remove(getgenv().last_servers,1);
end;

if(getgenv().total_slaps==nil)then 
	getgenv().total_slaps=0;
end;

local total_gained=getgenv().total_slaps;
local queue_teleport=((syn)and(syn.queue_on_teleport))or(queue_on_teleport)or((fluxus)and(fluxus.queue_on_teleport));
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(status)
	if(status==Enum.TeleportState.InProgress)and(queue_teleport~=nil)then 
		queue_teleport("getgenv().total_slaps="..total_gained..";getgenv().last_servers={\""..table.concat(getgenv().last_servers,"\",\"").."\"};loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Bacon42069/My-Roblox-Scripts/main/SB%20Auto%20Farm%20Slapples.lua\"))();");
	end;
end);
wait(0.75);

local slaps_inst=game:GetService("Players").LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Slaps");
local slaps_start=slaps_inst.Value;

local slaps_gained=0;

local slaps_gained_msg=Instance.new("Message");
slaps_gained_msg.Parent=game:GetService("CoreGui");

spawn(function()
	while(wait())do 
		pcall(function()
			firetouchinterest(game:GetService("Workspace").Lobby.Teleport1,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,0);
			firetouchinterest(game:GetService("Workspace").Lobby.Teleport1,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,1);
			for _,slapple in pairs(game:GetService("Workspace").Arena.island5.Slapples:GetChildren())do 
				if(slapple:FindFirstChild("Glove")~=nil)and(slapple:FindFirstChild("Glove").Transparency<=0.2)and(slapple:FindFirstChild("Glove"):FindFirstChildWhichIsA("TouchTransmitter")~=nil)then 
					firetouchinterest(slapple:FindFirstChild("Glove"),game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,0);
					firetouchinterest(slapple:FindFirstChild("Glove"),game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,1);
				end;
			end;
			slaps_gained=slaps_inst.Value-slaps_start;
			slaps_gained_msg.Text="Slaps Gained: "..tostring(slaps_gained).." Total Slaps Gained: "..tostring(total_gained);
			total_gained=getgenv().total_slaps+slaps_gained;
			game:GetService("GuiService"):ClearError();
			if(setfpscap~=nil)then 
				setfpscap(15);
			end;
			game:GetService("RunService"):Set3dRenderingEnabled(false);
		end);
	end;
end);

spawn(function()
	local url_data={Url=fullurl};
	local servers={};
	while(wait())do 
		xpcall(function()
			local cursor=nil;
            while(wait())do 
				table.clear(servers);
                local fullurl=string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100",game.PlaceId);
                if(cursor~=nil)then 
                    fullurl=fullurl.."&cursor="..cursor;
                end;
				url_data.Url=fullurl;

                local req=httprequest(url_data);
                local body=game:GetService("HttpService"):JSONDecode(req.Body);
                cursor=body.nextPageCursor;
				if(body==nil)or(body.data==nil)or(body.data[1]==nil)then 
					cursor=nil;
					table.clear(body);
					body=nil;
					break;
				end;
                if(body~=nil)and(body.data~=nil)then 
                    for _,server_data in next,body.data do 
                        if(type(server_data)=="table")and(tonumber(server_data.playing)~=nil)and(tonumber(server_data.maxPlayers)~=nil)and(server_data.playing<server_data.maxPlayers)and(server_data.id~=game.JobId)and(table.find(getgenv().last_servers,server_data.id)==nil)then 
                            servers[#servers+1]=server_data.id;
                        end;
						table.clear(server_data);
						server_data=nil;
                    end;
					table.clear(body);
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
