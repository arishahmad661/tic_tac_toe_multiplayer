import 'package:flutter/material.dart';
import '../resources/socket_methods.dart';



class JoinRoom extends StatefulWidget {
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {

  late TextEditingController nickName;
  late TextEditingController id;
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    // TODO: implement initState
    nickName = TextEditingController();
    id = TextEditingController();
    _socketMethods.joinRoomSuccessListner(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayerStateListener(context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nickName.dispose();
    id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(nickName.text.isEmpty || id.text.isEmpty){
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
            _socketMethods.joinRoom(nickName.text,id.text);
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Join Room",
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
                onChanged: (value){
                  nickName.text=value;
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
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
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value){
                  id.text=value;
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Enter game ID',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
