import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe_new/select_mode.dart';
import 'package:url_launcher/link.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
        floatingActionButton: Link(
            target: LinkTarget.blank,
            uri: Uri.parse(
              "https://arishahmad.com/",
            ),
            builder: (context, followLink) => InkWell(
                onTap: followLink,
                child: Text(
                  "Arish Ahmad",
                  style: TextStyle(color: Colors.white),
                ))),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Tic Toc Toe",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontStyle: FontStyle.normal)),
                  const SizedBox(height: 60),
                  Container(
                    alignment: Alignment.center,
                    height: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("START PLAYING !",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 6, 52, 70),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 215,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SelectMode()))
                                  },
                                  child: const Text("START",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                      )),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
