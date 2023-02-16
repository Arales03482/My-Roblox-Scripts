getgenv().hostuser="ARealPerson29"; -- username of the host account set this to "nil" or nil to set all accounts to display each others lag
getgenv().hosturl="ws://192.168.1.177:2344/"; -- host url obv
getgenv().vizfreq=0.1; -- how frequent changes should be sent to the server

loadstring(game:HttpGet("https://raw.githubusercontent.com/Bacon42069/My-Roblox-Scripts/main/LagVisualizer/src.lua",true))();
