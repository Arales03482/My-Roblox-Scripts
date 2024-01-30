local tools={};
local cache={math=math,Vector3=Vector3,Vector2=Vector2,UDim=UDim,UDim2=UDim2,IsA=IsA,len=("1").len,tick=tick,tonumber=tonumber,pairs=pairs,table=table,game=game,print=print,warn=warn,error=error,spawn=spawn,pcall=pcall,xpcall=xpcall,ypcall=ypcall,assert=assert,getgenv=getgenv,typeof=typeof,type=type,wspace=game:GetService("Workspace"),players=game:GetService("Players"),rservice=game:GetService("RunService"),hbeat=game:GetService("RunService")["Heartbeat"],rstep=game:GetService("RunService")["RenderStepped"],step=game:GetService("RunService")["Stepped"],player=game:GetService("Players")["LocalPlayer"]};
if(getgenv()["shaLib"]==nil)then getgenv()["shaLib"]={["Lib"]=loadstring(game:HttpGet("https://raw.githubusercontent.com/Egor-Skriptunoff/pure_lua_SHA/master/sha2.lua",true))(),["README"]="THIS LIBRARY IS NOT MADE BY ME CREDITS GO TO 'Egor-Skriptunoff' ON GITHUB WITH 'pure_lua_SHA'"};end;

cache["mrandomb"]=function(a,b)cache["math"]["randomseed"](cache["math"]["random"](1,cache["math"]["random"](1,cache["tick"]())));return(cache["math"]["random"](a,b));end;
tools["GetFirstModelOfInstance"]=function(a)
    if(a==nil)or(a["Parent"]==nil)then return(a);end;
    local b=a["Parent"];
    if(b==cache["game"])or(b["Parent"]==cache["game"])or(b==cache["wspace"])or(b["Parent"]==cache["wspace"])then return(a);end;
    while(b["Parent"]~=cache["wspace"])and(cache["hbeat"]:Wait())do 
        if(b==nil)or(b["Parent"]==nil)then return(b);end;
        if(cache["IsA"](b["Parent"],"Model"))then return(b["Parent"]);end;
        b=b["Parent"];
    end;
    return(a);
end;

tools["makeId"]=function(_,____,______,___)
    _=(_)or(5);
	__="";
	___=(___)or{"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","9"};
	____=(____)or(false);
	local _____=0;
	______=(______)or(" ");
	while(cache["len"](__)<_)and(cache["hbeat"]:Wait())do 
		if(____~=false)and(cache["tonumber"](____)~=nil)then 
			if(_____>=____)then 
				__=__..______..___[cache["mrandomb"](1,#___)];
				_____=0;
			elseif(_____~=____)then 
				__=__..___[cache["mrandomb"](1,#___)];
				_____=_____+1;
			end;
		elseif(____==nil)or(____==false)then 
			__=__..___[cache["mrandomb"](1,#___)];
			_____=_____+1;
		end;
	end;
	return(__);
end;

tools["RndVec3"]=function(min,max)
    return(cache["Vector3"]["new"](cache["mrandomb"](min,max),cache["mrandomb"](min,max),cache["mrandomb"](min,max)));
end;

tools["TableRemoveFromIdx"]=function(_,__)
    for ___,____ in cache["pairs"](_)do 
        if(___>=__)or(____==nil)then 
            cache["table"]["remove"](_,___);
        end;
    end;
    return(_);
end;

tools["SearchTable"]=function(tbl)
    cache["pcall"](function()
        cache["warn"]("Found Table");
        for idx,arg in cache["pairs"](tbl)do 
            if(cache["typeof"](arg)=="table")then 
                tools["SearchTable"](arg);
            else 
                cache["warn"]("Found:\""..tostring(arg).."\" idx:\""..tostring(idx).."\"");
            end;
        end;
    end);
end;

tools["CopyTable"]=function(tbl)
    cache["assert"](cache["type"](tbl)=="table","Expected argument 1 as a table.");
    local c={};
    for n,b in pairs(tbl)do 
        c[n]=b;
    end;
    return(c);
end;

tools["GetCache"]=function(min,max)
    return(tools["CopyTable"](cache));
end;

tools["shaLib"]=getgenv()["shaLib"];

_G["shaLib"]=tools["shaLib"];
getgenv()["baconUtils"]=tools;
getgenv()["baconUtilsCache"]=tools["CopyTable"](cache);
return tools,getgenv()["baconUtilsCache"];
