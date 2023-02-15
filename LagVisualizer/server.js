const port=2344;
const maxCons=2;

const express=require("express");
const WebSocket=require("ws");
const SocketServer=require("ws").Server;

const server=express().listen(port);

const wss=new SocketServer({server});
const cons={};
const playersOnline={};
console.log("server ready")

wss.on('connection',(ws)=>{
    console.log('new connection')
    var player="";
    if(cons.length>maxCons){
        console.log("too many clients closing webhook connection");
        ws.close();
        return;
    };
    ws.on('close',()=>{
        cons[player]=null;
        playersOnline[player]=null;
        player=null;
        console.log('a connection has been closed',playersOnline)
        var clientss=wss.clients;
        clientss.forEach((client)=>{
            if(client.readyState==WebSocket.OPEN){
                ws.send("cons´"+JSON.stringify(playersOnline));
            };
        });
    });
    ws.on('message',(message)=>{
        console.log('%s',message);
        var spi=String(message).split("´");
        console.log("isAuth",spi[0]=="auth","isData",spi[0]=="data");
        if(spi[0]=="auth"){
            if(cons[spi[1]]!=null){
                console.log("duplicate client closing webhook connection");
                ws.close();
                return;
            };
            var vtbl="";
            //for(){

            //}
            cons[spi[1]]=[spi[1],ws];
            playersOnline[spi[1]]=true;
            player=spi[1];
            console.log(playersOnline);
            var clientss=wss.clients;
            clientss.forEach((client)=>{
                if(client.readyState==WebSocket.OPEN){
                    ws.send("cons´"+JSON.stringify(playersOnline));
                };
            });
        }else if(spi[0]=="data"){
            var p=cons[spi[1]];
            if(p!=null){
                p[1].send(message);
                console.log("forwarded msg");
            };
        };
    });
});
