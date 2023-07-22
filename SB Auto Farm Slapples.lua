if not game:IsLoaded() then 
	game.Loaded:Wait()
end

spawn(function()
	while wait() do 
		pcall(function()
			firetouchinterest(game:GetService("Workspace").Lobby.Teleport1,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,0);
			firetouchinterest(game:GetService("Workspace").Lobby.Teleport1,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,1);
			for _,slapple in pairs(game:GetService("Workspace").Arena.island5.Slapples:GetChildren())do 
				if(slapple:FindFirstChild("Glove")~=nil)and(slapple:FindFirstChild("Glove").Transparency<=0.2)and(slapple:FindFirstChild("Glove"):FindFirstChildWhichIsA("TouchTransmitter")~=nil)then 
					firetouchinterest(slapple:FindFirstChild("Glove"),game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,0);
					firetouchinterest(slapple:FindFirstChild("Glove"),game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,1);
				end;
			end;
		end);
	end;
end);

spawn(function()
	local url_data = {Url = fullurl}
	local servers = {}
	while wait() do 
		xpcall(function()
			local cursor = nil
            while wait() do
				table.clear(servers)
                local fullurl = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", game.PlaceId)
                if cursor then
                    fullurl = fullurl .."&cursor=".. cursor
                end
				url_data.Url = fullurl

                local req = httprequest(url_data)
                local body = game:GetService("HttpService"):JSONDecode(req.Body)
                cursor = body.nextPageCursor
				if not body or not body.data or not body.data[1] then
					cursor = nil
					table.clear(body)
					body = nil
					break
				end
                if body and body.data then
                    for i, v in next, body.data do
                        if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                            servers[#servers + 1] = v.id
                        end
						table.clear(v)
						v = nil
                    end
					table.clear(body)
					body = nil
                end
                print(#servers)
                if #servers >= 1 then
                    break
                end
				table.clear(servers)
            end
			if #servers >= 1 then
				local serverid = servers[math.random(1, #servers)]
				table.clear(servers)
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverid, game:GetService("Players").LocalPlayer)
				game:GetService("Players").LocalPlayer.OnTeleport:Wait()
			end
			table.clear(servers)
		end,warn);
	end;
end);

local queueteleport=((syn)and(syn.queue_on_teleport))or(queue_on_teleport)or((fluxus)and(fluxus.queue_on_teleport));
if(queueteleport~=nil)then 
	queueteleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/Bacon42069/My-Roblox-Scripts/main/SB%20Auto%20Farm%20Slapples.lua"))();]]);
end;
