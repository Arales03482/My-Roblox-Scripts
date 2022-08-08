b=((syn)and(syn.queue_on_teleport))or(queue_on_teleport)or((fluxus)and(fluxus.queue_on_teleport))
GamePlaceId=8888615802
LobbyPlaceId=7991339063

if(game.PlaceId==GamePlaceId)then
local Library=loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window=Library.CreateLib("Rainbow Friends", "BloodTheme")
local Tab=Window:NewTab("Main")
local Section=Tab:NewSection("ESP")

Section:NewButton("Monsters","Monsters ESP",function()
    -- Settings --
    local settings={
	    fillcolor=Color3.fromRGB(0, 255, 255),
	    filltransparency=0.75,
	    outlinecolor=Color3.fromRGB(0, 255, 255),
	    outlinetransparency=0,
    }

    -- Script --
    local highlights=Instance.new("Folder",game:service("CoreGui"))
    local function addhighlight(object)
	    local highlight=Instance.new("Highlight", highlights)
	    highlight.Adornee=object

	    highlight.FillColor=settings.fillcolor
	    highlight.FillTransparency=settings.filltransparency

	    highlight.OutlineColor=settings.outlinecolor
	    highlight.OutlineTransparency=settings.outlinetransparency

	    highlight.Adornee.Changed:Connect(function()
		    if not highlight.Adornee or not highlight.Adornee.Parent then
			    highlight:Destroy()
		    end
	    end)

	    return highlight
    end

    local function addto(object)
	    if object:IsA("Model") then
		    addhighlight(object)
	    end
    end

    for _, v in pairs(workspace.Monsters:GetDescendants()) do
	    addto(v)
    end

    workspace.Monsters.DescendantAdded:Connect(function(v)
	    addto(v)
    end)
end)

Section:NewButton("Items", "Item ESP", function()
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name=="Battery" or (v.Name:find("^Block") and v:IsA("Model")) or (v.Name:find("^Food") and v:IsA("Model")) or (v.Name:find("^Fuse") and v:IsA("Model")) then
            local a=Instance.new("Highlight")
            a.Parent=v
            a.Adornee=v
            a.FillColor=Color3.new(0, 255, 0)
            a.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
            a.FillTransparency=0.75
        end
    end
end)

Section:NewButton("Players","Player ESP",function()
    _G.FriendColor=Color3.fromRGB(0,0,255)
    _G.EnemyColor=Color3.fromRGB(255,0,0)
    _G.UseTeamColor=true

    --------------------------------------------------------------------
    local Holder=Instance.new("Folder", game.CoreGui)
    Holder.Name="ESP"

    local Box=Instance.new("BoxHandleAdornment")
    Box.Name="nilBox"
    Box.Size=Vector3.new(1, 2, 1)
    Box.Color3=Color3.new(100 / 255, 100 / 255, 100 / 255)
    Box.Transparency=0.7
    Box.ZIndex=0
    Box.AlwaysOnTop=false
    Box.Visible=false

    local NameTag=Instance.new("BillboardGui")
    NameTag.Name="nilNameTag"
    NameTag.Enabled=false
    NameTag.Size=UDim2.new(0, 200, 0, 50)
    NameTag.AlwaysOnTop=true
    NameTag.StudsOffset=Vector3.new(0, 1.8, 0)
    local Tag=Instance.new("TextLabel", NameTag)
    Tag.Name="Tag"
    Tag.BackgroundTransparency=1
    Tag.Position=UDim2.new(0, -50, 0, 0)
    Tag.Size=UDim2.new(0, 300, 0, 20)
    Tag.TextSize=15
    Tag.TextColor3=Color3.new(100 / 255, 100 / 255, 100 / 255)
    Tag.TextStrokeColor3=Color3.new(0 / 255, 0 / 255, 0 / 255)
    Tag.TextStrokeTransparency=0.4
    Tag.Text="nil"
    Tag.Font=Enum.Font.SourceSansBold
    Tag.TextScaled=false

    local LoadCharacter=function(v)
	    repeat wait()until v.Character~=nil

	    v.Character:WaitForChild("Humanoid")
	    local vHolder=Holder:FindFirstChild(v.Name)
	    vHolder:ClearAllChildren()
	    local b=Box:Clone()
	    b.Name=v.Name .. "Box"
	    b.Adornee=v.Character
	    b.Parent=vHolder
	    local t=NameTag:Clone()
	    t.Name=v.Name .. "NameTag"
	    t.Enabled=true
	    t.Parent=vHolder
	    t.Adornee=v.Character:WaitForChild("Head",5)
	    if not t.Adornee then
		    return UnloadCharacter(v)
	    end
	    t.Tag.Text=v.Name
	    b.Color3=Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	    t.Tag.TextColor3=Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	    local Update
	    local UpdateNameTag=function()
		    if not pcall(function()
			    v.Character.Humanoid.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None
			    local maxh=math.floor(v.Character.Humanoid.MaxHealth)
			    local h=math.floor(v.Character.Humanoid.Health)
		    end) then
			    Update:Disconnect()
		    end
	    end
	    UpdateNameTag()
	    Update=v.Character.Humanoid.Changed:Connect(UpdateNameTag)
    end

    local UnloadCharacter=function(v)
	    local vHolder=Holder:FindFirstChild(v.Name)
	    if vHolder and (vHolder:FindFirstChild(v.Name.."Box")~=nil or vHolder:FindFirstChild(v.Name.."NameTag")~=nil) then
		    vHolder:ClearAllChildren()
	    end
    end

    local LoadPlayer=function(v)
	    local vHolder=Instance.new("Folder",Holder)
	    vHolder.Name=v.Name
	    v.CharacterAdded:Connect(function()
		    pcall(LoadCharacter,v)
	    end)
	    v.CharacterRemoving:Connect(function()
		    pcall(UnloadCharacter,v)
	    end)
	    v.Changed:Connect(function(prop)
		    if prop=="TeamColor" then
			    UnloadCharacter(v)
			    wait()
			    LoadCharacter(v)
		    end
	    end)
	    LoadCharacter(v)
    end

    local UnloadPlayer=function(v)
	    UnloadCharacter(v)
	    local vHolder=Holder:FindFirstChild(v.Name)
	    if vHolder then
		    vHolder:Destroy()
	    end
    end

    for i,v in pairs(game:GetService("Players"):GetPlayers())do
	    spawn(function()pcall(LoadPlayer,v);end)
    end

    game:GetService("Players").PlayerAdded:Connect(function(v)
	    pcall(LoadPlayer,v)
    end)

    game:GetService("Players").PlayerRemoving:Connect(function(v)
	    pcall(UnloadPlayer,v)
    end)

    game:GetService("Players").LocalPlayer.NameDisplayDistance=0

    if _G.Reantheajfdfjdgs then
        return
    end

    _G.Reantheajfdfjdgs=":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

    function esp(target,color)
        if(target.Character)then
            if(target.Character:FindFirstChild("GetReal")==nil)then
                local highlight=Instance.new("Highlight")
                highlight.RobloxLocked=true
                highlight.Name="GetReal"
                highlight.Adornee=target.Character
                highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor=color
                highlight.Parent=target.Character
            else
                target.Character.GetReal.FillColor=color
            end
        end
    end

    while(wait())do
        for _,k in pairs(game.Players:GetPlayers())do
            if(k~=game:GetService("Players").LocalPlayer)then
                esp(k,(_G.UseTeamColor)and(k.TeamColor.Color)or((game:GetService("Players").LocalPlayer.TeamColor==k.TeamColor)and(_G.FriendColor)or(_G.EnemyColor)))
            end
        end
    end
end)

local Section=Tab:NewSection("Fullbright")
Section:NewButton("Toggle Fullbright","Toggles Fullbright",function()
    if not _G.FullBrightExecuted then

	    _G.FullBrightEnabled=false

	    _G.NormalLightingSettings={
		    Brightness=game:GetService("Lighting").Brightness,
		    ClockTime=game:GetService("Lighting").ClockTime,
		    FogEnd=game:GetService("Lighting").FogEnd,
		    GlobalShadows=game:GetService("Lighting").GlobalShadows,
		    Ambient=game:GetService("Lighting").Ambient
	    }

	    game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		    if game:GetService("Lighting").Brightness~=1 and game:GetService("Lighting").Brightness~=_G.NormalLightingSettings.Brightness then
			    _G.NormalLightingSettings.Brightness=game:GetService("Lighting").Brightness
			    if not _G.FullBrightEnabled then
				    repeat
					    wait()
				    until _G.FullBrightEnabled
			    end
			    game:GetService("Lighting").Brightness=1
		    end
	    end)

	    game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		    if game:GetService("Lighting").ClockTime~=12 and game:GetService("Lighting").ClockTime~=_G.NormalLightingSettings.ClockTime then
			    _G.NormalLightingSettings.ClockTime=game:GetService("Lighting").ClockTime
			    if not _G.FullBrightEnabled then
				    repeat
					    wait()
				    until _G.FullBrightEnabled
			    end
			    game:GetService("Lighting").ClockTime=12
		    end
	    end)

	    game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		    if game:GetService("Lighting").FogEnd~=786543 and game:GetService("Lighting").FogEnd~=_G.NormalLightingSettings.FogEnd then
			    _G.NormalLightingSettings.FogEnd=game:GetService("Lighting").FogEnd
			    if not _G.FullBrightEnabled then
				    repeat
					    wait()
				    until _G.FullBrightEnabled
			    end
			    game:GetService("Lighting").FogEnd=786543
		    end
	    end)

	    game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		    if game:GetService("Lighting").GlobalShadows~=false and game:GetService("Lighting").GlobalShadows~=_G.NormalLightingSettings.GlobalShadows then
			    _G.NormalLightingSettings.GlobalShadows=game:GetService("Lighting").GlobalShadows
			    if not _G.FullBrightEnabled then
				    repeat
					    wait()
				    until _G.FullBrightEnabled
			    end
			    game:GetService("Lighting").GlobalShadows=false
		    end
	    end)

	    game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		    if game:GetService("Lighting").Ambient~=Color3.fromRGB(178,178,178) and game:GetService("Lighting").Ambient~=_G.NormalLightingSettings.Ambient then
			    _G.NormalLightingSettings.Ambient=game:GetService("Lighting").Ambient
			    if not _G.FullBrightEnabled then
				    repeat
					    wait()
				    until _G.FullBrightEnabled
			    end
			    game:GetService("Lighting").Ambient=Color3.fromRGB(178,178,178)
		    end
	    end)

	    game:GetService("Lighting").Brightness=1
	    game:GetService("Lighting").ClockTime=12
	    game:GetService("Lighting").FogEnd=786543
	    game:GetService("Lighting").GlobalShadows=false
	    game:GetService("Lighting").Ambient=Color3.fromRGB(178,178,178)

	    local LatestValue=true
	    spawn(function()
		    repeat
			    wait()
		    until _G.FullBrightEnabled
		    while wait() do
			    if _G.FullBrightEnabled~=LatestValue then
				    if not _G.FullBrightEnabled then
					    game:GetService("Lighting").Brightness=_G.NormalLightingSettings.Brightness
					    game:GetService("Lighting").ClockTime=_G.NormalLightingSettings.ClockTime
					    game:GetService("Lighting").FogEnd=_G.NormalLightingSettings.FogEnd
					    game:GetService("Lighting").GlobalShadows=_G.NormalLightingSettings.GlobalShadows
					    game:GetService("Lighting").Ambient=_G.NormalLightingSettings.Ambient
				    else
					    game:GetService("Lighting").Brightness=1
					    game:GetService("Lighting").ClockTime=12
					    game:GetService("Lighting").FogEnd=786543
					    game:GetService("Lighting").GlobalShadows=false
					    game:GetService("Lighting").Ambient=Color3.fromRGB(178, 178, 178)
				    end
				    LatestValue=not LatestValue
			    end
		    end
	    end)
    end

    _G.FullBrightExecuted=true
    _G.FullBrightEnabled=not _G.FullBrightEnabled
end)

local Section=Tab:NewSection("Items")
Section:NewButton("Get Items","Gives you all items",function()
    for _,k in pairs(workspace:GetChildren())do
        if(k.Name=="Battery")or((k.Name:find("^Block"))and(k:IsA("Model")))or((k.Name:find("^Food"))and(k:IsA("Model")))or((k.Name:find("^Fuse"))and(k:IsA("Model")))then
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),k.TouchTrigger,0)
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),k.TouchTrigger,1)
        end
    end
end)

Section:NewButton("Give Items","Gives items to the item area",function()
	if(game:GetService("Workspace").GroupBuildStructures:GetChildren()[1]==nil)then
    	print("The collection area is not present")
	elseif(game:GetService("Workspace").GroupBuildStructures:GetChildren()[1]~=nil)then
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),game:GetService("Workspace").GroupBuildStructures:GetChildren()[1].Trigger,0)
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),game:GetService("Workspace").GroupBuildStructures:GetChildren()[1].Trigger,1)
	end
end)

Section:NewButton("Collect Ticket","Collects ticket",function()
	if(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("TicketMachine")==nil)then
    	print("The tickets are not present")
	elseif(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("TicketMachine")~=nil)then
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),game:GetService("Workspace").Ticket.TouchTrigger,0)
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),game:GetService("Workspace").Ticket.TouchTrigger,1)
		wait(0.1)
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),game:GetService("Workspace").GroupBuildStructures:FindFirstChild("TicketMachine").Trigger,0)
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),game:GetService("Workspace").GroupBuildStructures:FindFirstChild("TicketMachine").Trigger,1)
	end
end)

local Tab=Window:NewTab("Credit")
Tab:NewSection("Esps made by Tora Is Me")
Tab:NewSection("Item pickups without movement")
Tab:NewSection("aswell as description")
Tab:NewSection("and name edits by OggySpelar")
elseif(game.PlaceId==LobbyPlaceId)then
	while(game.PlaceId==LobbyPlaceId)and(wait())do
		game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame=CFrame.new(game:GetService("Workspace")["LobbySchool_C1"]["static_bus"].hitbox.CFrame)
	end
else
	game.Players.LocalPlayer:Kick("Wrong game Teleporting..")
	game:GetService("TeleportService"):Teleport(LobbyPlaceId)
end

game.Players.LocalPlayer.OnTeleport:Connect(function(a)
	if(a==Enum.TeleportState.Started)then
		if(b)then
			b("loadstring(game:HttpGet('https://raw.githubusercontent.com/OggySpelar/idk/master/scriptname.lua'))()")
		end
	end
end)
