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
	local cursor=Drawing.new("Triangle");
	cursor.Thickness=1;
	cursor.Color=Color3.fromRGB(0,85,255);
	cursor.Filled=true;
	while(game:GetService("RunService").Heartbeat:Wait())do 
		pcall(function()
			local pos=game:GetService("UserInputService"):GetMouseLocation();
			cursor.Visible=true;
			cursor.PointA=Vector2.new(pos.X,pos.Y-0.5);
			cursor.PointB=Vector2.new(pos.X+12.5,pos.Y+12);
			cursor.PointC=Vector2.new(pos.X,pos.Y+17);
			
			game:GetService("GuiService"):ClearError();
			if(setfpscap~=nil)then 
				setfpscap(10);
			end;
			game:GetService("RunService"):Set3dRenderingEnabled(false);

			game:GetService("Workspace").Terrain.WaterWaveSize=0;
			game:GetService("Workspace").Terrain.WaterWaveSpeed=0;
			game:GetService("Workspace").Terrain.WaterReflectance=0;
			game:GetService("Workspace").Terrain.WaterTransparency=0;
			game:GetService("Lighting").GlobalShadows=false;
			game:GetService("Lighting").FogEnd=9e9;
			game:GetService("Lighting").Brightness=0;

			settings().Rendering.QualityLevel="Level01";

			for _,a in pairs(game:GetService("Lighting"):GetDescendants())do 
				if(a:IsA("BlurEffect"))or(a:IsA("SunRaysEffect"))or(a:IsA("ColorCorrectionEffect"))or(a:IsA("BloomEffect"))or(a:IsA("DepthOfFieldEffect"))then 
					a.Enabled=false;
				end;
			end;

			sethiddenproperty(game:GetService("Lighting"),"Technology","Compatibility");
		end);
	end;
end);

spawn(function()
	local nr=NumberRange.new(0);
	while(wait(0.3))do 
		pcall(function()
			table.foreach(game:GetService("Workspace"):GetDescendants(),function(a)
				if(a:IsA("Part"))or(a:IsA("Union"))or(a:IsA("CornerWedgePart"))or(a:IsA("TrussPart"))then 
					a.Material="Plastic";
					a.Reflectance=0;
				elseif(a:IsA("Decal"))or(a:IsA("Texture"))then 
					a.Transparency=0;
				elseif(a:IsA("ParticleEmitter"))or(a:IsA("Trail"))then 
					a.Lifetime=nr;
				elseif(a:IsA("Explosion"))then 
					a.BlastPressure=0;
					a.BlastRadius=0;
				elseif(a:IsA("Fire"))or(a:IsA("SpotLight"))or(a:IsA("Smoke"))or(a:IsA("Sparkles"))then 
					a.Enabled=false;
				elseif(a:IsA("MeshPart"))then 
					a.Material="Plastic";
					a.Reflectance=0;
					a.TextureID=0;
				end;
			end);
		end);
	end;
end);

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
		end);
	end;
end);

spawn(function()
	local url_data={Url=fullurl};
	local servers={};
	while(wait())do 
		xpcall(function()
			local cursor=nil;
			local fullurl=string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100",game.PlaceId);
            while(wait())do 
				table.clear(servers);
				url_data.Url=((cursor~=nil)and(fullurl.."&cursor="..cursor))or(fullurl);

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
