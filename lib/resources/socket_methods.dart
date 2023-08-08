import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tic_tac_toe_new/GetX/room_data_getx.dart';
import 'package:tic_tac_toe_new/resources/game_methods.dart';

import 'socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;

  //EMITS
   void createRoom(String nickname){
    if(nickname.isNotEmpty){
      _socketClient.emit('createRoom',{
        'nickname':nickname
      });
    }
  }

  void joinRoom(String nickname, String roomID){
     if(nickname.isNotEmpty && roomID.isNotEmpty){
       _socketClient.emit('joinRoom',{
         'nickname':nickname,
         'roomID':roomID,
       });
     }
  }

  void tapGrid(int index, String roomId, List<String> displayElement){
    if(displayElement[index]=='-'){
       _socketClient.emit("tap",{
         'index':index,
         'roomId':roomId,
       });
     }

  }

  void reset(String roomId){
     _socketClient.emit("reset",{
       'roomId':roomId,
     });
  }


  //LISTENERS
  void createRoomSuccessListener(BuildContext context){
    RoomDataGetX controller = Get.find();
    _socketClient.on(
        "createRoomSuccess",
            (room) {
            controller.updateRoomData(room);
            Get.toNamed("/onlineGameScreen",);
        }
    );
  }

  void joinRoomSuccessListner(BuildContext context){
    RoomDataGetX controller = Get.find();

    _socketClient.on('joinRoomSuccess',(room){
      controller.updateRoomData(room);
      Get.toNamed("/onlineGameScreen",);
    });
  }

  void updatePlayerStateListener(BuildContext context){
    RoomDataGetX controller = Get.find();
    _socketClient.on('updatePlayers',(playerData){
    controller.updaterPlayer1(playerData[0]);
    controller.updaterPlayer2(playerData[1]);
    });
  }

  void errorOccurredListener(BuildContext context){
    _socketClient.on('errorOccurred',(data){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data.toString()),
          backgroundColor: (Colors.black12),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {
            },
          )));
    });
  }

  void updateRoomListener(BuildContext context){
    RoomDataGetX controller = Get.find();
    _socketClient.on("updateRoom",(room){
      controller.updateRoomData(room);
    });
  }

  void tappedListener(BuildContext context){
    RoomDataGetX controller = Get.find();
    _socketClient.on('tapped',(data){
      controller.updateDisplayElements(data['index'], data['choice']);
       controller.updateRoomData(data['room']);
      GameMethods().checkWinner(context,_socketClient);
    });
   }

   void resettingListener(BuildContext context){

     RoomDataGetX controller = Get.find();
     _socketClient.on("resetting",(data){
       controller.displayElement.value = ["-","-","-","-","-","-","-","-","-",];
     });
   }



   void endGameListener(BuildContext context){
     _socketClient.on("endGame",(playerData){
       showDialog(
           barrierDismissible: false,
           context: context,
           builder: (_) => AlertDialog(
             title: const Text("Match Ended!!"),
             content: Text(" ${playerData['nickname']} won the game!"),
             actions: [
               TextButton(
                   onPressed: () {
                     GameMethods().clearBoard(context);
                     Navigator.pop(context);
                   },
                   child: Text("Go Back")
               )
             ],
           ));
       Navigator.popUntil(context, (route) => false);
     });
   }
}