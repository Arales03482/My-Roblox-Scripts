local function getRealChar(n)
	n=(n)or(game:GetService("Players").LocalPlayer.Name);
	for _,a in pairs(game:GetService("Workspace").Characters:GetChildren())do
        if(a.Name==n)and(a:FindFirstChild("HumanoidRootPart")~=nil)and(a:FindFirstChild("Head")~=nil)and(a:FindFirstChild("Head"):FindFirstChild("GrabAttachment")==nil)then
			return(a);
        end;
    end;
end;

local function tpCups(a,p,goffset)
    for _,a in pairs(a:GetChildren())do 
        if(a.Name=="CupAttachment")and(a:FindFirstChild("ConnectedBall")~=nil)and(a:FindFirstChild("ConnectedBall").Value~=nil)then 
            local b=a:FindFirstChild("ConnectedBall").Value.Parent;
            if(b.Parent:IsA("Model"))then 
                b=b.Parent.PrimaryPart;
            end;
            b.CFrame=b.CFrame+(goffset-p);
            b.Velocity=Vector3.zero;
            if(b.Parent.Parent==game:GetService("Workspace").Characters)then 
                for _,a in pairs(b.Parent:GetChildren())do 
                    if(a:IsA("BasePart"))then 
                        is_not_close=false;
                        a.CFrame=a.CFrame+(goffset-p);
                        a.Velocity=Vector3.zero;
                    end;
                end;
            end;
            tpCups(a:FindFirstChild("ConnectedBall").Value.Parent,p,goffset);
        end;
    end;
end;

local function doTP(a,p,goffset,char)
    a.CFrame=a.CFrame+(goffset-p);
    a.Velocity=Vector3.zero;
    if(a.Name:sub(1,4)=="Hand")and(a:FindFirstChild("HoldAttachment")~=nil)and(a.HoldAttachment.Grab.Value~=nil)then 
        local b=a.HoldAttachment.Grab.Value.Parent;
        if(b.Parent:IsA("Model"))then 
            b=b.Parent.PrimaryPart;
        end;
        b.CFrame=b.CFrame+(goffset-p);
        b.Velocity=Vector3.zero;
		if(b.Parent.Parent==game:GetService("Workspace").Characters)then 
			for _,a in pairs(b.Parent:GetChildren())do 
				if(a:IsA("BasePart"))then 
					a.CFrame=a.CFrame+(goffset-p);
                    a.Velocity=Vector3.zero;
				end;
			end;
		end;
        tpCups(b,p,goffset);
    end;
end;

local function gotoP(p,char)
	local goffset=char:FindFirstChild("HumanoidRootPart").Position;
	for _,a in pairs(char:GetChildren())do 
		if(a:IsA("BasePart"))then 
            doTP(a,p,goffset,char);
		end;
	end;
end;

return({
    ["goto"]=gotoP;
    ["getCharacter"]=getRealChar;
});
