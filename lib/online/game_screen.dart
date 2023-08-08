import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../GetX/room_data_getx.dart';
import '../resources/socket_methods.dart';

class GameScreen extends StatefulWidget {
  GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final roomData = Get.find<RoomDataGetX>();
  final SocketMethods _socketMethods = SocketMethods();

  void tapped(int index, String roomId, displayElement){
    _socketMethods.tapGrid(index, roomId, displayElement);
  }
  @override
  void initState() {
    // TODO: implement initState
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerStateListener(context);
    _socketMethods.tappedListener(context);
    _socketMethods.resettingListener(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(roomData.player1.value.nickname);
    print(roomData.player2.value.nickname);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: Obx(
          () => roomData.roomData.value["isJoin"]
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Waiting for a player to join.....",
                          style: TextStyle(
                              // shadows: [Shadow(blurRadius: 40, color: Colors.lightBlueAccent)],
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Room ID:",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SelectableText(
                          roomData.roomData.value["_id"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${roomData.player1.value.nickname} : ${roomData.player_one_win.value.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 28),
                                ),
                              ))),
                          SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Draw:0",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 28),
                                ),
                              ))),
                          SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${roomData.player2.value.nickname} : ${roomData.player_two_win.value.toString()} ",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 28),
                                ),
                              ))),
                          const SizedBox(height: 50),

                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                "${roomData.roomData.value["turn"]["nickname"]}\'s turn",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: MediaQuery.of(context).size.height-260-60-60,
                            width: 300,
                            child: AbsorbPointer(
                              absorbing:roomData.roomData.value['turn']['socketID'] !=_socketMethods.socketClient.id,
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                children: List.generate(
                                    9,
                                        (index) => Card(
                                        child: InkWell(
                                          splashColor: const Color.fromARGB(255, 6, 52, 70),
                                          onTap: () => tapped(index,roomData.roomData.value['_id'],roomData.displayElement),
                                          child: Center(
                                            child: AnimatedSize(
                                              duration: Duration(milliseconds: 200),
                                              child: Text(
                                                  roomData.displayElement.value[index],
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(255, 6, 52, 70),
                                                      fontSize: 50)),
                                            ),
                                          ),
                                        ))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
