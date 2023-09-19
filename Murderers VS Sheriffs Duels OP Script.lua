local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("dotr");
local b=a:CreateFolder("Main");
local auto_equip_selected="Gun";
local auto_queue_gamemode="Classic";
local auto_queue_vs_mode=2;
getgenv().AutoKillGun=false;
getgenv().AutoKillKnife=false;
getgenv().AutoClassicSelect=false;
getgenv().AutoEquip=false;
getgenv().AutoQueue=false;

-- mysterious black box
local resolver,tags=(function(...)
    local a=tonumber;local b=string.byte;local c=string.char;local d=string.sub;local e=string.gsub;local f=string.rep;local g=table.concat;local h=table.insert;local i=math.ldexp;local j=getfenv or function()return _ENV end;local k=setmetatable;local l=pcall;local m=select;local n=unpack or table.unpack;local o=tonumber;local function p(q,r,...)local s=1;local t;q=e(d(q,5),"..",function(u)if b(u,2)==79 then t=a(d(u,1,1))return""else local v=c(a(u,16))if t then local w=f(v,t)t=nil;return w else return v end end end)local function x(y,z,A)if A then local B=y/2^(z-1)%2^(A-1-(z-1)+1)return B-B%1 else local C=2^(z-1)return y%(C+C)>=C and 1 or 0 end end;local function D()local v=b(q,s,s)s=s+1;return v end;local function E()local v,w=b(q,s,s+2)s=s+2;return w*256+v end;local function F()local v,w,G,H=b(q,s,s+3)s=s+4;return H*16777216+G*65536+w*256+v end;local function I()local J=F()local K=F()local L=1;local M=x(K,1,20)*2^32+J;local N=x(K,21,31)local O=x(K,32)==1 and-1 or 1;if N==0 then if M==0 then return O*0 else N=1;L=0 end elseif N==2047 then return M==0 and O*1/0 or O*NaN end;return i(O,N-1023)*(L+M/2^52)end;local function P(Q)local R;if not Q then Q=F()if Q==0 then return""end end;R=d(q,s,s+Q-1)s=s+Q;local S={}for T=1,#R do S[T]=c(b(d(R,T,T)))end;return g(S)end;local U=F;local function V(...)return{...},m("#",...)end;local function W()local X={}local Y={}local Z={}local _={X,Y,nil,Z}local a0=F()local a1={}for T=1,a0 do local a2=D()local a3;if a2==1 then a3=D()~=0 elseif a2==2 then a3=I()elseif a2==3 then a3=P()end;a1[T]=a3 end;_[3]=D()for T=1,F()do local a4=D()if x(a4,1,1)==0 then local a2=x(a4,2,3)local a5=x(a4,4,6)local a6={E(),E(),nil,nil}if a2==0 then a6[3]=E()a6[4]=E()elseif a2==1 then a6[3]=F()elseif a2==2 then a6[3]=F()-2^16 elseif a2==3 then a6[3]=F()-2^16;a6[4]=E()end;if x(a5,1,1)==1 then a6[2]=a1[a6[2]]end;if x(a5,2,2)==1 then a6[3]=a1[a6[3]]end;if x(a5,3,3)==1 then a6[4]=a1[a6[4]]end;X[T]=a6 end end;for T=1,F()do Y[T-1]=W()end;return _ end;local function a7(_,a8,a9)local aa=_[1]local ab=_[2]local ac=_[3]return function(...)local aa=aa;local ab=ab;local ac=ac;local V=V;local ad=1;local ae=-1;local af={}local ag={...}local ah=m("#",...)-1;local ai={}local aj={}for T=0,ah do if T>=ac then af[T-ac]=ag[T+1]else aj[T]=ag[T+1]end end;local ak=ah-ac+1;local a6;local al;while true do a6=aa[ad]al=a6[1]if al<=22 then if al<=10 then if al<=4 then if al<=1 then if al==0 then local am;aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,a6[3]))ad=ad+1;a6=aa[ad]if aj[a6[2]]~=aj[a6[4]]then ad=ad+1 else ad=a6[3]end else aj[a6[2]]=a6[3]~=0 end elseif al<=2 then local an=ab[a6[3]]local ao;local ap={}ao=k({},{__index=function(aq,ar)local as=ap[ar]return as[1][as[2]]end,__newindex=function(aq,ar,at)local as=ap[ar]as[1][as[2]]=at end})for T=1,a6[4]do ad=ad+1;local au=aa[ad]if au[1]==36 then ap[T-1]={aj,au[3]}else ap[T-1]={a8,au[3]}end;ai[#ai+1]=ap end;aj[a6[2]]=a7(an,ao,a9)elseif al==3 then local av;local aw,ax;local ay;local am;am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]if aj[a6[2]]~=a6[4]then ad=ad+1 else ad=a6[3]end else local am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))end elseif al<=7 then if al<=5 then local am=a6[2]do return n(aj,am,am+a6[3])end elseif al>6 then aj[a6[2]]=#aj[a6[3]]else aj[a6[2]]=a6[3]+aj[a6[4]]end elseif al<=8 then aj[a6[2]]={}elseif al>9 then if a6[2]<=aj[a6[4]]then ad=ad+1 else ad=a6[3]end else local av;local aw,ax;local ay;local am;am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]if aj[a6[2]]~=a6[4]then ad=ad+1 else ad=a6[3]end end elseif al<=16 then if al<=13 then if al<=11 then if aj[a6[2]]~=a6[4]then ad=ad+1 else ad=a6[3]end elseif al>12 then do return end else aj[a6[2]]=a8[a6[3]]end elseif al<=14 then aj[a6[2]]=a9[a6[3]]elseif al>15 then local am=a6[2]local ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]else local az;local aA;local am;aj[a6[2]]={}ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=#aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aA=aj[am]az=aj[am+2]if az>0 then if aA>aj[am+1]then ad=a6[3]else aj[am+3]=aA end elseif aA<aj[am+1]then ad=a6[3]else aj[am+3]=aA end end elseif al<=19 then if al<=17 then ad=a6[3]elseif al==18 then local av;local aw,ax;local ay;local am;aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]else local av;local aw,ax;local ay;local am;aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]if aj[a6[2]]~=aj[a6[4]]then ad=ad+1 else ad=a6[3]end end elseif al<=20 then local am=a6[2]local az=aj[am+2]local aA=aj[am]+az;aj[am]=aA;if az>0 then if aA<=aj[am+1]then ad=a6[3]aj[am+3]=aA end elseif aA>=aj[am+1]then ad=a6[3]aj[am+3]=aA end elseif al>21 then aj[a6[2]]=aj[a6[3]]%a6[4]else local am;aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,a6[3]))ad=ad+1;a6=aa[ad]if aj[a6[2]]~=aj[a6[4]]then ad=ad+1 else ad=a6[3]end end elseif al<=34 then if al<=28 then if al<=25 then if al<=23 then if not aj[a6[2]]then ad=ad+1 else ad=a6[3]end elseif al>24 then aj[a6[2]]=aj[a6[3]]+a6[4]else local av;local aw,ax;local ay;local am;am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]if a6[2]<=aj[a6[4]]then ad=ad+1 else ad=a6[3]end end elseif al<=26 then local am=a6[2]local aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;local av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end elseif al==27 then local av;local aw,ax;local ay;local am;am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]am=a6[2]ay=aj[a6[3]]aj[am+1]=ay;aj[am]=ay[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]if aj[a6[2]]~=a6[4]then ad=ad+1 else ad=a6[3]end else aj[a6[2]]=aj[a6[3]]%aj[a6[4]]end elseif al<=31 then if al<=29 then local am=a6[2]aj[am](n(aj,am+1,ae))elseif al==30 then local am=a6[2]local aw,ax=V(aj[am](n(aj,am+1,ae)))ae=ax+am-1;local av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end else local av;local aw,ax;local am;aj[a6[2]]=aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]+a6[4]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=#aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]%aj[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]+aj[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=#aj[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]%aj[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]+aj[a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]+a6[4]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,a6[3])))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](n(aj,am+1,ae)))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,ae))ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]]%a6[4]ad=ad+1;a6=aa[ad]am=a6[2]aw,ax=V(aj[am](aj[am+1]))ae=ax+am-1;av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end;ad=ad+1;a6=aa[ad]am=a6[2]aj[am](n(aj,am+1,ae))end elseif al<=32 then local am;aj[a6[2]]=a8[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]aj[a6[2]]=a6[3]ad=ad+1;a6=aa[ad]am=a6[2]aj[am]=aj[am](n(aj,am+1,a6[3]))ad=ad+1;a6=aa[ad]if aj[a6[2]]~=aj[a6[4]]then ad=ad+1 else ad=a6[3]end elseif al==33 then local am=a6[2]aj[am]=aj[am](aj[am+1])else local am=a6[2]local aA=aj[am]local az=aj[am+2]if az>0 then if aA>aj[am+1]then ad=a6[3]else aj[am+3]=aA end elseif aA<aj[am+1]then ad=a6[3]else aj[am+3]=aA end end elseif al<=40 then if al<=37 then if al<=35 then aj[a6[2]]=aj[a6[3]][a6[4]]elseif al>36 then local am=a6[2]do return n(aj,am,ae)end else aj[a6[2]]=aj[a6[3]]end elseif al<=38 then local am=a6[2]do return aj[am],aj[am+1]end elseif al>39 then if aj[a6[2]]==a6[4]then ad=ad+1 else ad=a6[3]end else local am=a6[2]aj[am]=aj[am](n(aj,am+1,a6[3]))end elseif al<=43 then if al<=41 then aj[a6[2]]=a6[3]elseif al>42 then do return aj[a6[2]]end else local am=a6[2]do return aj[am](n(aj,am+1,a6[3]))end end elseif al<=44 then if aj[a6[2]]~=aj[a6[4]]then ad=ad+1 else ad=a6[3]end elseif al==45 then local am=a6[2]local aw,ax=V(aj[am](aj[am+1]))ae=ax+am-1;local av=0;for T=am,ae do av=av+1;aj[T]=aw[av]end else aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]aj[a6[2]]=aj[a6[3]][a6[4]]ad=ad+1;a6=aa[ad]aj[a6[2]]=a9[a6[3]]ad=ad+1;a6=aa[ad]if not aj[a6[2]]then ad=ad+1 else ad=a6[3]end end;ad=ad+1 end end end;return a7(W(),{},r)(...)end;return p("LOL!113O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E7365727403073O007265717569726503043O0067616D65030A3O004765745365727669636503113O00E3C6CB29EFB8C60AD4C7E831E9A9C619D403083O007EB1A3BB4586DBA703073O004D6F64756C657303043O005461677300273O00122E3O00013O00206O000200122O000100013O00202O00010001000300122O000200013O00202O00020002000400122O000300053O00062O0003000A000100010004113O000A000100120E000300063O00202300040003000700120E000500083O00202300050005000900120E000600083O00202300060006000A00060200073O000100062O00243O00064O00248O00243O00044O00243O00014O00243O00024O00243O00053O002O120008000B3O00122O0009000C3O00202O00090009000D4O000B00073O00122O000C000E3O00122O000D000F6O000B000D6O00093O000200202O00090009001000202O0009000900112O002100080002000200060200090001000100022O00243O00074O00243O00084O0024000A00084O0026000900034O000D3O00013O00023O00023O00026O00F03F026O00704002264O000F00025O00122O000300016O00045O00122O000500013O00042O0003002100012O000C00076O001F000800026O000900016O000A00026O000B00036O000C00046O000D8O000E00063O00202O000F000600014O000C000F6O000B3O00024O000C00036O000D00046O000E00016O000F00016O000F0006000F00102O000F0001000F4O001000016O00100006001000102O00100001001000202O0010001000014O000D00106O000C8O000A3O000200202O000A000A00024O0009000A6O00073O00010004140003000500012O000C000300054O0024000400024O002A000300044O002500036O000D3O00017O00243O0003043O004E616D6503133O0002FF2FC4F013C838D6F32D9F73E8F321C426C003053O009C43AD4AA5030D3O0015854C17B0164326A44618EE7F03073O002654D72976DC46030D3O0071242713F260133001F15E447703053O009E3076427203093O0043686172616374657200030E3O00497344657363656E64616E744F6603043O0067616D652O0103163O0046696E6446697273744368696C64576869636849734103083O0083311D377DAAF2AF03073O009BCB44705613C503083O006EC83BFD4E77ECFC03083O009826BD569C20188503063O004865616C7468026O00F03F03043O005465616D030A3O004765745365727669636503073O00CC5BA65FF945B403043O00269C37C7030B3O004C6F63616C506C6179657203073O0098717D311666E903083O0023C81D1C4873149A03043O002DB0DED303073O005479DFB1BFED4C03113O009859C5AC3F5324C8B458FAA5284639C2BE03083O00A1DB36A9C05A305003063O0048617354616703073O00794E013C4C501303043O004529226003043O0088CCD80603063O004BDCA3B76A6203063O0072617767657402713O00201500023O00014O00035O00122O000400023O00122O000500036O00030005000200062O0002006E000100030004113O006E000100202300023O00012O002000035O00122O000400043O00122O000500056O00030005000200062O0002006E000100030004113O006E000100202300023O00012O002000035O00122O000400063O00122O000500076O00030005000200062O0002006E000100030004113O006E000100202300023O000800260B0002006E000100090004113O006E000100202300023O000800201000020002000A00120E0004000B4O00270002000400020026280002006E0001000C0004113O006E000100202300023O000800200300020002000D4O00045O00122O0005000E3O00122O0006000F6O000400066O00023O000200262O0002006E000100090004113O006E000100202300023O000800201800020002000D4O00045O00122O000500103O00122O000600116O000400066O00023O000200202O000200020012000E2O0013006E000100020004113O006E000100202300023O00140012130003000B3O00202O0003000300154O00055O00122O000600163O00122O000700176O000500076O00033O000200202O00030003001800202O00030003001400062O0002006E000100030004113O006E000100120E0002000B3O00201B0002000200154O00045O00122O000500193O00122O0006001A6O000400066O00023O000200202O00020002001800202O00020002000800202O00020002000D4O00045O00122O0005001B3O00122O0006001C6O000400066O00023O000200262O0002006E000100090004113O006E000100120E0002000B3O0020090002000200154O00045O00122O0005001D3O00122O0006001E6O000400066O00023O000200202O00020002001F00122O0004000B3O00202O0004000400154O00065O00122O000700203O00122O000800216O000600086O00043O000200202O00040004001800202O00040004000800202O00040004000D4O00065O00122O000700223O00122O000800236O000600086O00043O000200122O000500246O000600016O000700016O000500076O00023O000200262O0002006E000100090004113O006E00012O0001000200014O002B000200024O000100026O002B000200024O000D3O00017O00",j(),...)
end)(...);

local stands={};
for _,a in pairs(game:GetService("Workspace"):GetChildren())do 
    if(a:IsA("Folder"))and(a.Name=="Folder")then 
        for _,a in pairs(a:GetChildren())do 
            local container=a:FindFirstChild("MatchContainer");
            if(a:IsA("Folder"))and(a.Name=="Folder")and(container~=nil)then 
                for _,stand in pairs(container:GetChildren())do 
                    if(stand:IsA("BasePart"))and(stand.Name=="Stand")then 
                        for _,a in pairs(stand:GetChildren())do 
                            if(a:IsA("ObjectValue"))and(a.Name=="StandCharacter")then 
                                local p_count=container:GetAttribute("MinPlayerCount");
                                stands[#stands+1]={
                                    ["Gamemode"]=container:GetAttribute("Gamemode");
                                    ["MinPlayerCount"]=((p_count==nil)and(1))or(p_count/2);
                                    ["CharacterStand"]=a;
                                    ["Stand"]=stand;
                                    ["Ring"]=stand:FindFirstChild("Ring");
                                };
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

--anti afk
if(getgenv().kuefg834rjiy983450~=nil)then getgenv().kuefg834rjiy983450:Disconnect();end;getgenv().kuefg834rjiy983450=game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);wait(1);game:service("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame);end);

b:Toggle("Auto Kill Gun",function(a)
    getgenv().AutoKillGun=a;
    spawn(function()
        while(getgenv().AutoKillGun==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                    if(resolver(a,"GUN_TOOL")==true)then 
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Shoot"):FireServer(a.Character.HumanoidRootPart.Part.Position,a.Character.HumanoidRootPart.Part.Position,a.Character.HumanoidRootPart.Part,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position);
                    end;
                end;
            end);
        end;
    end);
end);

b:Toggle("Auto Kill Knife",function(a)
    getgenv().AutoKillKnife=a;
    spawn(function()
        while(getgenv().AutoKillKnife==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players"):GetPlayers())do 
                    if(resolver(a,"KNIFE_TOOL")==true)then 
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Stab"):FireServer(a.Character.HumanoidRootPart);
                    end;
                end;
            end);
        end;
    end);
end);

local maping={
    ["Gun"]="GUN_TOOL",
    ["Knife"]="KNIFE_TOOL",
};
local maping2={
    ["GUN_TOOL"]="Sheriff",
    ["KNIFE_TOOL"]="Murderer",
};
b:Toggle("Auto Classic Select",function(a)
    getgenv().AutoClassicSelect=a;
    spawn(function()
        while(getgenv().AutoClassicSelect==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                if(game:GetService("Players").LocalPlayer.Team~=nil)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")==nil)then 
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("OnRoleSelection"):FireServer(maping2[auto_equip_selected]);
                    game:GetService("Players").LocalPlayer.PlayerGui.RoleSelection.Enabled=false;
                end;
            end);
        end;
    end);
end);
b:Toggle("Auto Equip",function(a)
    getgenv().AutoEquip=a;
    spawn(function()
        while(getgenv().AutoEquip==true)and(game:GetService("RunService").Stepped:Wait())do 
            pcall(function()
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren())do 
                    if(game:GetService("CollectionService"):HasTag(a,rawget(tags,auto_equip_selected))~=nil)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")~=a)then 
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(a);
                        wait();
                    end;
                end;
            end);
        end;
    end);
end);
b:Dropdown("Auto Equip Selected",{"Gun","Knife"},true,function(a)
    auto_equip_selected=maping[a];
end);

b:Toggle("Auto Queue",function(a)
    getgenv().AutoQueue=a;
    spawn(function()
        while(getgenv().AutoQueue==true)and(game:GetService("RunService").Stepped:Wait())do 
            xpcall(function()
                if(game:GetService("Players").LocalPlayer.Team==nil)then 
                    for _,data in pairs(stands)do 
                        if(data.Gamemode==auto_queue_gamemode)and(data.MinPlayerCount==auto_queue_vs_mode)then 
                            if(data.CharacterStand.Value==nil)or(data.CharacterStand.Value.Name==game:GetService("Players").LocalPlayer.Name)then 
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(data.Ring.Position+Vector3.new(0,2.5,0));
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity=Vector3.zero;
                                return;
                            end;
                        end;
                    end;
                end;
            end,warn);
        end;
    end);
end);
b:Dropdown("Auto Queue Mode",{"Classic","Duality"},true,function(a)
    auto_queue_gamemode=a;
end);
b:Dropdown("Auto Queue VS Mode",{"1","2","4"},true,function(a)
    auto_queue_vs_mode=tonumber(a);
end);
