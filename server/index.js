///io not workinh ??
///run on port 3000 and check ipv4

const express = require('express');
const http = require('http');
const mongoose = require("mongoose");
const playerSchema = require("./models/players");
//const playerSchema = require("./players");

const app = express();
const port = process.env.Port || 3000;
var server = http.createServer(app);
const Room = require("./models/room")
var io = require('socket.io')(server);
app.use(express.json());


const DB = "ADD_YOUR_MONGODB_SERVER_HERE";
let room = new Room(); //instance of room class

io.on("connection", (socket) => {
    console.log("Connected");
    socket.on('createRoom',async ({ nickname }) => {
    console.log("rea");
    try{
    //room is being created
        let player = {
            socketID : socket.id,
            nickname : nickname,
            playerType: 'X',
            points:0,

        };//creates player
        room.players.push(player); //pushing player value in schema
        room.turn = player; //whenever user creates a room

    // saving in mongodb
        room = await room.save();
        //it will return a room id and it created my mongodb itself

        const roomID = room._id.toString();
        socket.join(roomID)//joining to particular roomID

        //let client room is created go to next page

        //io --> send data to everyone
        //socket --> sending data to yourself

        //io.emit() --> send data to everyone all the game presnt
        //socket.emit() --> only send data to our client

        io.to(roomID).emit("createRoomSuccess",room); //send everyone in the room
    }
    catch(e){
    console.log(e);}
    });

    socket.on('joinRoom', async ({nickname,roomID})=>{

        try{
            if(!roomID.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit('errorOccurred',"Please enter valid room ID.");
                return;
            }
            else{
                let room = await Room.findById(roomID);
                if(room.isJoin){
                    let player = {
                        nickname:nickname,
                        socketID: socket.id,
                        playerType:"O",
                        points:0,
                    };
                    socket.join(roomID);
                    room.players.push(player);
                    room.isJoin = false;
                    room = await room.save();
                    io.to(roomID).emit("updatePlayers",room.players);
                    io.to(roomID).emit("joinRoomSuccess",room);
                    io.to(roomID).emit("updateRoom",room);

                }
                else{
                    socket.emit('errorOccurred',"The game is in process try again later.")
                }
            }
        }
        catch(e){
            console.log(e);
        }
    });



    socket.on("tap",async({index,roomId})=> {
    try{

        let room = await Room.findById(roomId);
        let choice = room.turn.playerType;
        if(room.turnIndex == 0){

            room.turn = room.players[1];
            room.turnIndex = 1;
        }
        else{

            room.turn = room.players[0];
            room.turnIndex = 0
        }
        room = await room.save();
        io.to(roomId).emit('tapped',{
            index,
            choice,
            room,
        });
    }
    catch(e){
    console.log(e);}
    });

        socket.on("reset", async({roomId})=>{
            io.to(roomId).emit("resetting",{roomId});
        });


});
mongoose.connect(DB).then(() => { console.log("connection successfull"); }).catch((e) => { console.log(e); });


server.listen(port, '0.0.0.0', () => { console.log(`Server started running on port ${port}`) })
