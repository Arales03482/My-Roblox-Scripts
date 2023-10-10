if(game:IsLoaded()==false)then 
	game.Loaded:Wait();
end;
if(game.PlaceId==0)then return;end;

spawn(function()
	while(game:GetService("RunService").Heartbeat:Wait())do 
		pcall(function()
			if(setfpscap~=nil)then 
				setfpscap(60);
			end;

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
	while(game:GetService("RunService").Heartbeat:Wait())do 
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
	local target_candy_corn=nil;
	local t=0;
	while(game:GetService("RunService").PostSimulation:Wait())do 
		xpcall(function()
			local ct=tick();
			for _,a in pairs(game:GetService("Workspace").CandyCorns:GetChildren())do 
				if(tonumber(a.Name)~=nil)and(a.Transparency==0)and(target_candy_corn==nil)then 
					target_candy_corn=a;
				end;
			end;
			if(target_candy_corn~=nil)and(t==0)then 
				t=ct;
			end;
			if((target_candy_corn==nil)or(target_candy_corn:IsDescendantOf(game)==false)or(target_candy_corn.Transparency~=0))and(t~=0)then 
				target_candy_corn=nil;
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-100000,80,-1500);
				t=0;
			end;
			if(target_candy_corn~=nil)and(ct-t>=0.5)then 
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=target_candy_corn.CFrame;
			end;
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.zero;
		end,warn);
	end;
end);
