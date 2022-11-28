getgenv().baconUtils={};

function getgenv().baconUtils.getFirstModelOfPart(a)
    local b=a.Parent;
    if(b.Parent==game)and(b==game:GetService("Workspace"))then return(a);end;
    if(b.Parent==game:GetService("Workspace"))then 
        if(b:IsA("Model"))then return(b);end;
        return(b);
    end;
    while(b.Parent~=game:GetService("Workspace"))and(wait())do 
        if(b.Parent:IsA("Model"))then return(b.Parent);end;
        b=b.Parent;
    end;
    return(a);
end;

function getgenv().baconUtils.makeId(_,___,____,______)
    _=(_)or(5);
    __="";
    ___=(___)or{"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","9"};
    ____=(____)or(false);
    local _____=0;
    ______=(______)or(" ");
    while(__:len()<_)and(game:GetService("RunService")["Stepped"]:Wait())do 
        if(____~=false)and(tonumber(____)~=nil)then 
            if(_____==____)then 
                __=__..______..___[math["random"](1,#___)];
                _____=0;
            elseif(_____~=____)then 
                __=__..___[math["random"](1,#___)];
                _____+=1;
            end;
        elseif(____==nil)or(____==false)then 
            __=__..___[math["random"](1,#___)];
            _____+=1;
        end;
        print(_____);
    end;
    return(__);
end;

function getgenv().baconUtils.randVec3(min,max)
    return(Vector3.new(math.random(min,max),math.random(min,max),math.random(min,max)));
end;

function getgenv().baconUtils.tblRemoveFromIndx(_,__)
    for ___,____ in pairs(_)do 
        if(___>=__)or(____==nil)then 
            table.remove(_,___);
        end;
    end;
    return(_);
end;
