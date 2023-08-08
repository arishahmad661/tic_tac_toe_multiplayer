import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tic_tac_toe_new/offline/enter_data.dart';
import 'package:tic_tac_toe_new/online/room.dart';

class SelectMode extends StatelessWidget {
  const SelectMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Select Mode",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 52, 70),
                      )),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 225,
                    height: 49,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnterData()))
                      },
                      child: const Text("Offline",
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
                        Get.toNamed("/selectMode");
                      },
                      child: const Text("Online",
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
        ),
      ),
    );
  }
}
