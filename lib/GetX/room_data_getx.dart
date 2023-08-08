import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_new/models/player.dart';

class RoomDataGetX extends GetxController{
  RxMap _roomData = {}.obs;
  RxList<String> _displayElement = [
    "-","-","-",
    "-","-","-",
    "-","-","-",
  ].obs;
  RxInt filledBoxes = 0.obs;
  RxInt player_one_win = 0.obs;
  RxInt player_two_win = 0.obs;
  RxInt draw = 0.obs;

  Rx<Player> _player1 = Player(nickname: "", socketID: "", points:0, playerType: "X").obs;
  Rx<Player> _player2 = Player(nickname: "", socketID: "", points:0, playerType: "O").obs;

  RxMap get roomData => _roomData;
  Rx<Player> get player1 => _player1;
  Rx<Player> get player2 => _player2;
  RxList<String> get displayElement => _displayElement;


  void updateRoomData(newRoomData){
    _roomData.value = newRoomData;
  }

  void updaterPlayer1(Map<String, dynamic> player1data){
    _player1.value = Player.fromMap(player1data);
  }

  void updaterPlayer2(Map<String, dynamic> player2data){
    _player2.value = Player.fromMap(player2data);
  }

  void updateDisplayElements(int index, String choice){
    _displayElement.value[index] = choice;
    filledBoxes.value+=1;
  }

}