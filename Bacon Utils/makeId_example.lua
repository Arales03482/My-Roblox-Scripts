loadstring(game:HttpGet("https://raw.githubusercontent.com/Bacon42069/My-Roblox-Scripts/main/Bacon%20Utils/src.lua",true))();

local amount=1028;
local characters={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","9"};
local spereratorFreq=8;
local spererator="-";
local Password=getgenv().baconUtils.makeId(amount,characters,spereratorFreq,spererator);
print(Password);
