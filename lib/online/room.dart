import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tic_tac_toe_new/online/create_room.dart';

import '../GetX/room_data_getx.dart';
import 'join_room.dart';

class RoomDataBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<RoomDataGetX>(RoomDataGetX());
  }
}

class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 225,
                height: 49,
                child: ElevatedButton(
                  onPressed: (){
                    Get.toNamed("/createRoom");
                  },
                  child: const Text("Create Room",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      )),
                ),
              ),
              SizedBox(height: 16,),
              SizedBox(
                width: 225,
                height: 49,
                child: ElevatedButton(
                  onPressed: (){
                    Get.toNamed("/joinRoom");
                  },
                  child: const Text("Join Room",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
