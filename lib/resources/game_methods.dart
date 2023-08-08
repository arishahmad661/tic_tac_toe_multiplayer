import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tic_tac_toe_new/resources/socket_methods.dart';

import '../GetX/room_data_getx.dart';
import '../online/create_room.dart';


class GameMethods {
  void clearBoard(BuildContext context) {
    RoomDataGetX controller = Get.find();
    controller.displayElement.value = ["-","-","-","-","-","-","-","-","-",];
    controller.filledBoxes.value = 0;
  }

  void checkWinner(BuildContext context, Socket socketClient) {
    String winner = "-";
    final ctrl = Get.find<RoomDataGetX>();
    if (ctrl.displayElement.value[0] == ctrl.displayElement.value[1] &&
        ctrl.displayElement.value[0] == ctrl.displayElement.value[2] &&
        ctrl.displayElement.value[0] != "-") {
      winner = ctrl.displayElement.value[0];
    }
    if (ctrl.displayElement.value[3] == ctrl.displayElement.value[4] &&
        ctrl.displayElement.value[3] == ctrl.displayElement.value[5] &&
        ctrl.displayElement.value[3] != "-") {
      winner = ctrl.displayElement.value[3];
    }
    if (ctrl.displayElement.value[6] == ctrl.displayElement.value[7] &&
        ctrl.displayElement.value[6] == ctrl.displayElement.value[8] &&
        ctrl.displayElement.value[6] != "-") {
      winner = ctrl.displayElement.value[6];
    }
    if (ctrl.displayElement.value[0] == ctrl.displayElement.value[3] &&
        ctrl.displayElement.value[0] == ctrl.displayElement.value[6] &&
        ctrl.displayElement.value[0] != "-") {
      winner = ctrl.displayElement.value[0];
    }
    if (ctrl.displayElement.value[1] == ctrl.displayElement.value[4] &&
        ctrl.displayElement.value[1] == ctrl.displayElement.value[7] &&
        ctrl.displayElement.value[1] != "-") {
      winner = ctrl.displayElement.value[1];
    }
    if (ctrl.displayElement.value[2] == ctrl.displayElement.value[5] &&
        ctrl.displayElement.value[2] == ctrl.displayElement.value[8] &&
        ctrl.displayElement.value[2] != "-") {
      winner = ctrl.displayElement.value[2];
    }
    if (ctrl.displayElement.value[0] == ctrl.displayElement.value[4] &&
        ctrl.displayElement.value[0] == ctrl.displayElement.value[8] &&
        ctrl.displayElement.value[0] != "-") {
      winner = ctrl.displayElement.value[0];
    }
    if (ctrl.displayElement.value[2] == ctrl.displayElement.value[4] &&
        ctrl.displayElement.value[2] == ctrl.displayElement.value[6] &&
        ctrl.displayElement.value[2] != "-") {
      winner = ctrl.displayElement.value[2];
    } else if (ctrl.filledBoxes.value == 9 && winner=="-") {
      winner = '-';
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => AlertDialog(
                // title: Text("Match Draw!"),
                content: const Text("Match Draw!"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Play Again!")),
                ],
              ));
      ctrl.draw.value+=1;
      GameMethods().clearBoard(context);

    }

    if (winner != "-") {
      if (ctrl.player1.value.playerType == winner) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text("Winner!!"),
                  content:
                      Text('${ctrl.player1.value.nickname} wins the round'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Play Again!")),
                  ],
                ));
        GameMethods().clearBoard(context);
        ctrl.player_one_win.value+=1;

      } else {
        showDialog(
          barrierDismissible: false,
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text("Winner!!"),
                  content:  Text('${ctrl.player2.value.nickname} wins the round'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Play Again!")),
                  ],
                ));
        ctrl.player_two_win.value+=1;
        GameMethods().clearBoard(context);


      }
    }
  }
}
