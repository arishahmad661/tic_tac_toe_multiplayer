import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:tic_tac_toe_new/resources/socket_methods.dart';

import '../GetX/room_data_getx.dart';


class CreateRoom extends StatefulWidget {
  CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  late final controller;
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    _socketMethods.createRoomSuccessListener(context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(controller.text==""){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Fill the fields'),
                backgroundColor: (Colors.black12),
                action: SnackBarAction(
                  label: 'dismiss',
                  onPressed: () {
                  },
                )));
          }
          else{
            _socketMethods.createRoom(controller.text);
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create Room",
                  style: TextStyle(
                      // shadows: [Shadow(blurRadius: 40, color: Colors.lightBlueAccent)],
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Enter your nickname',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.white),

                  ),
                  onChanged: (value){
                    controller.text=value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
