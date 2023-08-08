import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tic_tac_toe_new/online/game_screen.dart';
import 'firebase_options.dart';
import 'homepage.dart';
import 'online/create_room.dart';
import 'online/join_room.dart';
import 'online/room.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 6, 52, 70)),
    // home: HomePage(),
    initialRoute: "/",
    getPages: [
      GetPage(
        name: '/',
        page: ()=> HomePage(),
      ),
      GetPage(
          name: '/selectMode',
          page: ()=> Room(),
          binding:RoomDataBinding()
      ),
      GetPage(
        name: '/createRoom',
        page: ()=> CreateRoom(),
      ),
      GetPage(
        name: '/joinRoom',
        page: ()=> JoinRoom(),
      ),
      GetPage(name: "/onlineGameScreen", page:()=>GameScreen())
    ],
  ));
}

