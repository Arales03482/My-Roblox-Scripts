local player=game:GetService("Players").LocalPlayer;
local character=(player.Character)or(player.CharacterAdded:Wait());
local hum=character:WaitForChild("Humanoid");
local hrp=character:WaitForChild("HumanoidRootPart");

if(getgenv().kuefg834rjiy9s83450~=nil)then getgenv().kuefg834rjiy9s83450:Disconnect();end;getgenv().kuefg834rjiy9s83450=game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);wait(1);game:service("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);end);

local autofarm=loadstring([[local a=Instance.new"Folder"a.Name="Autofarm"local b=Instance.new"Part"b.Name="AFK"b.Anchored=true;b.BottomSurface=0;b.TopSurface=0;b.Size=Vector3.new(300,5,300)b.CanTouch=false;b.CFrame=CFrame.new(-203.82254028320312,1720.190185546875,-377.2499694824219)b.CastShadow=false;b.Parent=a;local c=Instance.new"Folder"c.Name="Points"c.Parent=a;local d=Instance.new"Part"d.Name="Point1"d.Anchored=true;d.BottomSurface=0;d.CanCollide=false;d.TopSurface=0;d.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)d.CanTouch=false;d.CFrame=CFrame.new(-205.5153045654297,1727.190185546875,-514.5572509765625)d.CastShadow=false;d.Parent=c;local e=Instance.new"Part"e.Name="Point10"e.Anchored=true;e.BottomSurface=0;e.CanCollide=false;e.TopSurface=0;e.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)e.CanTouch=false;e.CFrame=CFrame.new(-63.32252502441406,1727.190185546875,-372.3644714355469)e.CastShadow=false;e.Parent=c;local f=Instance.new"Part"f.Name="Point11"f.Anchored=true;f.BottomSurface=0;f.CanCollide=false;f.TopSurface=0;f.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)f.CanTouch=false;f.CFrame=CFrame.new(-87.02132415771484,1727.190185546875,-436.68975830078125)f.CastShadow=false;f.Parent=c;local g=Instance.new"Part"g.Name="Point12"g.Anchored=true;g.BottomSurface=0;g.CanCollide=false;g.TopSurface=0;g.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)g.CanTouch=false;g.CFrame=CFrame.new(-127.64783477783203,1727.190185546875,-490.85845947265625)g.CastShadow=false;g.Parent=c;local h=Instance.new"Part"h.Name="Point2"h.Anchored=true;h.BottomSurface=0;h.CanCollide=false;h.TopSurface=0;h.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)h.CanTouch=false;h.CFrame=CFrame.new(-279.99725341796875,1727.190185546875,-497.6295166015625)h.CastShadow=false;h.Parent=c;local i=Instance.new"Part"i.Name="Point3"i.Anchored=true;i.BottomSurface=0;i.CanCollide=false;i.TopSurface=0;i.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)i.CanTouch=false;i.CFrame=CFrame.new(-330.7803955078125,1727.190185546875,-446.84637451171875)i.CastShadow=false;i.Parent=c;local j=Instance.new"Part"j.Name="Point4"j.Anchored=true;j.BottomSurface=0;j.CanCollide=false;j.TopSurface=0;j.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)j.CanTouch=false;j.CFrame=CFrame.new(-344.32257080078125,1727.190185546875,-372.3644714355469)j.CastShadow=false;j.Parent=c;local k=Instance.new"Part"k.Name="Point5"k.Anchored=true;k.BottomSurface=0;k.CanCollide=false;k.TopSurface=0;k.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)k.CanTouch=false;k.CFrame=CFrame.new(-330.7803955078125,1727.190185546875,-311.4246826171875)k.CastShadow=false;k.Parent=c;local l=Instance.new"Part"l.Name="Point6"l.Anchored=true;l.BottomSurface=0;l.CanCollide=false;l.TopSurface=0;l.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)l.CanTouch=false;l.CFrame=CFrame.new(-279.99725341796875,1727.190185546875,-264.027099609375)l.CastShadow=false;l.Parent=c;local m=Instance.new"Part"m.Name="Point7"m.Anchored=true;m.BottomSurface=0;m.CanCollide=false;m.TopSurface=0;m.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)m.CanTouch=false;m.CFrame=CFrame.new(-205.5153045654297,1727.190185546875,-236.94276428222656)m.CastShadow=false;m.Parent=c;local n=Instance.new"Part"n.Name="Point8"n.Anchored=true;n.BottomSurface=0;n.CanCollide=false;n.TopSurface=0;n.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)n.CanTouch=false;n.CFrame=CFrame.new(-131.03338623046875,1727.190185546875,-253.8704833984375)n.CastShadow=false;n.Parent=c;local o=Instance.new"Part"o.Name="Point9"o.Anchored=true;o.BottomSurface=0;o.CanCollide=false;o.TopSurface=0;o.Size=Vector3.new(3.385542392730713,3.385542392730713,3.385542392730713)o.CanTouch=false;o.CFrame=CFrame.new(-80.250244140625,1727.190185546875,-304.65362548828125)o.CastShadow=false;o.Parent=c;return a;]])();
local platform=autofarm:WaitForChild("AFK");
local points=autofarm:WaitForChild("Points");
local points_list={unpack(points:GetChildren())};

table.sort(points_list,function(i1,i2)
	return(tonumber(i1.Name:sub(6))<tonumber(i2.Name:sub(6)));
end);

autofarm.Parent=game:GetService("Workspace");

spawn(function()
	while(game:GetService("RunService").Heartbeat:Wait())do 
		pcall(function()
			game:GetService("GuiService"):ClearError();
			if(setfpscap~=nil)then 
				setfpscap(35);
			end;
			--game:GetService("RunService"):Set3dRenderingEnabled(false);

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

local next_point=2;
local current_point=1;
game:GetService("RunService"):BindToRenderStep("idksad21ewsq1s",Enum.RenderPriority.Character.Value+1,function()
	local camera=game:GetService("Workspace").CurrentCamera;
	character=player.Character;
	hum=character:FindFirstChild("Humanoid");
	hrp=character:FindFirstChild("HumanoidRootPart");

	local gui=(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("hud")~=nil)and(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("hud"):FindFirstChild("gameover")~=nil)and(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("hud"):FindFirstChild("gameover"):FindFirstChild("Frame")~=nil)and(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("hud"):FindFirstChild("gameover"):FindFirstChild("Frame"):FindFirstChild("deathbuttonsFrame"));
	if(gui~=nil)and(gui~=false)and(gui:FindFirstChild("deathButtons")~=nil)and(gui:FindFirstChild("deathButtons"):FindFirstChild("respawn")~=nil)and(gui.Visible==true)and(hum:GetState()==num.HumanoidStateType.Dead)then 
		player:SetAttribute("TryingToRespawn",time());
		game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("player"):WaitForChild("char"):WaitForChild("respawnchar"):FireServer();
	end;
    if(game:GetService("ReplicatedStorage").values.rounds.roundstatus.Value~="GAME")and(game:GetService("ReplicatedStorage").values.rounds.roundstatus.Value~="PREPARE")then return;end;
    for _,a in pairs(game:GetService("Players").LocalPlayer.PlayerGui.bonuspoints.defaultList:GetChildren())do 
        if(a.Name=="bonusgui")and(a:FindFirstChild("Frame")~=nil)and(a:FindFirstChild("Frame"):FindFirstChild("name")~=nil)and(a:FindFirstChild("Frame"):FindFirstChild("name").Text:sub(1,6)=="BHOP #")then 
            hrp.Velocity=Vector3.zero;
            return;
        end;
    end;
	if(hum~=nil)and(hrp~=nil)then 
		hum.Jump=true;
		hum.JumpHeight=4.5;
		hum.JumpPower=28.302;

		hum.WalkSpeed=50;

		if(camera~=nil)then 
			if(points:FindFirstChild("Point"..next_point)==nil)then 
				next_point=1;
			end;
			current_point=next_point-1;
			if(current_point<=0)then 
				current_point=#points_list;
			end;
			local point_pos=points_list[next_point].Position;
			local direction=hrp.Position-point_pos;
			camera.CFrame=CFrame.lookAt(camera.CFrame.Position,Vector3.new(point_pos.X,0,point_pos.Z))*CFrame.Angles(math.rad(90),0,0);
			player:Move(-direction.Unit,false);
			if(direction.Magnitude<=10)then 
				next_point=next_point+1;
			end;if(direction.Magnitude>=90)then 
				hrp.CFrame=points_list[current_point].CFrame;
			end;
            hrp.Velocity=Vector3.new(math.clamp((-direction.Unit).X*60,-200,200),hrp.Velocity.Y,math.clamp((-direction.Unit).Z*60,-200,200));
		end;
	end;
end);

hrp.CFrame=points_list[1].CFrame;
