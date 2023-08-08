import 'package:flutter/material.dart';
import 'package:tic_tac_toe_new/offline/twoplayer.dart';

class EnterData extends StatefulWidget {
  EnterData({super.key});
  @override
  State<EnterData> createState() => _EnterDataState();
}

class _EnterDataState extends State<EnterData> {
  late final person_one;

  late final person_second;

  @override
  void initState() {
    // TODO: implement initState
    person_one = TextEditingController();
    person_second = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    person_one.dispose();
    person_second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(person_one.text=="" || person_second.text ==""){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Fill all the fields'),
              backgroundColor: (Colors.black12),
              action: SnackBarAction(
                label: 'dismiss',
                onPressed: () {
                },
          )));
          }
          else{
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder:(context)=>TwoPlayer(player_one:person_one.text,player_two:person_second.text)));
          }
        },
        child: const Icon(Icons.arrow_forward,color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Enter nickname",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    )),
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      labelText: 'First Player',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.white),),
                  onChanged: (value){
                    person_one.text=value;
                  },
                ),
                const SizedBox(height: 30,),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Second Player',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (value){
                    person_second.text=value;
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