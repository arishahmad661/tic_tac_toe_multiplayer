import 'package:flutter/material.dart';

class TwoPlayer extends StatefulWidget {
  TwoPlayer({Key? key,required this.player_one,required this.player_two,}) : super(key: key);
  @override
  State<TwoPlayer> createState() => _TwoPlayerState();
  String player_one,player_two;
}

class _TwoPlayerState extends State<TwoPlayer> {
  var currentPlayer = "X";
  int xwon = 0;
  int owon = 0;
  int draw = 0;
  List a = [];
  List grid = ["-", "-", "-", "-", "-", "-", "-", "-", "-"];
  bool checkMove(a, b, c, sign) {
    if (((grid[a] == grid[b]) && (grid[b] == grid[c]) && (grid[c] == sign))) {
      return true;
    } else {
      return false;
    }
  }

  void counter(sign) {
    if (sign == "X") {
      xwon++;
    } else {
      owon++;
    }
  }

  void reset() {
    grid = ["-", "-", "-", "-", "-", "-", "-", "-", "-"];
    a = [];
  }

  void findWinner(currentPlayer) {
    if (((checkMove(0, 1, 2, currentPlayer)) ||
        (checkMove(3, 4, 5, currentPlayer)) ||
        (checkMove(6, 7, 8, currentPlayer)) ||
        (checkMove(0, 3, 6, currentPlayer)) ||
        (checkMove(1, 4, 7, currentPlayer)) ||
        (checkMove(2, 5, 8, currentPlayer)) ||
        (checkMove(0, 4, 8, currentPlayer)) ||
        (checkMove(2, 4, 6, currentPlayer)))) {
      counter(currentPlayer);
      reset();
    }
  }

  void drawxo(i) {
    if (!a.contains(i)) {
      a.add(i);
      setState(() {
        grid[i] = currentPlayer;
        currentPlayer = currentPlayer == "X" ? "O" : "X";
      });
      findWinner(grid[i]);
    }
    if (a.length == 9) {
      draw++;
      reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  // height: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height:60,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                "${widget.player_one} : $xwon",
                                style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28),
                              ),
                                  ))),
                          Container(
                              height:60,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                "Draw: $draw",
                                style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28),
                              ),
                                  ))),
                          Container(
                              height:60,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                "${widget.player_two}: $owon",
                                style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28),
                              ),
                                  )))
                        ],
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height-260-60-60,
                  width: 300,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: List.generate(
                        grid.length,
                            (index) => Card(
                            child: InkWell(
                              splashColor: const Color.fromARGB(255, 6, 52, 70),
                              onTap: () {
                                drawxo(index);
                              },
                              child: Center(
                                child: Text(grid[index],
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 6, 52, 70),
                                        fontSize: 50)),
                              ),
                            ))),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
