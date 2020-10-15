import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: link up image

  AssetImage Cross = AssetImage("images/Cross.jpg");
  AssetImage Zero = AssetImage("images/Zero.jpg");
  AssetImage Empty = AssetImage("images/Empty.jpg");

  bool isCross = true;
  String message;
  List<String> gameState = [
    "Empty",
    "Empty",
    "Empty",
    "Empty",
    "Empty",
    "Empty",
    "Empty",
    "Empty",
    "Empty",
  ];

  @override
  void initState() {
    super.initState();
    this.message = "";
  }

  //TODO: playGame method

  playGame(int index) {
    print("this.gameState[index]: ${this.gameState[index]}");
    if (this.gameState[index] == "Empty") {
      setState(() {
        if (this.isCross) {
          print('True');
          this.gameState[index] = "Cross";
        } else {
          print('False');
          this.gameState[index] = "Zero";
        }
        this.isCross = !this.isCross;
        checkWin();
      });
    }
  }

  //TODO: Reset game method

  resetGame() {
    setState(() {
      this.gameState = [
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
      ];
      this.message = "";
    });
  }

//TODO: get image method

  AssetImage getImage(String value) {
    print('Image Value: $value');
    switch (value) {
      case ('Empty'):
        return Empty;
        break;
      case ('Cross'):
        return Cross;
        break;
      case ('Zero'):
        return Zero;
        break;
    }
  }

//TODO:check for win logic

  checkWin() {
    if ((gameState[0] != 'Empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2]))
      setState(() {
        this.message = '${this.gameState[0]} Won';
      });
    else if ((gameState[3] != 'Empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5]))
      setState(() {
        this.message = '${this.gameState[3]} Won';
      });
    else if ((gameState[6] != 'Empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8]))
      setState(() {
        this.message = '${this.gameState[6]} Won';
      });
    else if ((gameState[0] != 'Empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6]))
      setState(() {
        this.message = '${this.gameState[0]} Won';
      });
    else if ((gameState[1] != 'Empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7]))
      setState(() {
        this.message = '${this.gameState[1]} Won';
      });
    else if ((gameState[2] != 'Empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8]))
      setState(() {
        this.message = '${this.gameState[2]} Won';
      });
    else if ((gameState[0] != 'Empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8]))
      setState(() {
        this.message = '${this.gameState[0]} Won';
      });
    else if ((gameState[2] != 'Empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6]))
      setState(() {
        this.message = '${this.gameState[2]} Won';
      });
    else if (!gameState.contains('Empty')) {
      setState(() {
        this.message = 'Game Draw';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top:25.0,left: 25,right: 25) ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //number of grids in a row
                childAspectRatio: 1.0,
                crossAxisSpacing: 5.0, //space between 3 grids in a row
                mainAxisSpacing: 5.0, //space from top to bottom between grids
              ),
              itemCount: gameState.length,
              itemBuilder: (context, i) => Container(
                color: Colors.black,
               // height: 0.0,
               // width: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: getImage(gameState[i]),
                   // fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.only(top:10.0),
            child: Text(
              this.message,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10,bottom: 50),),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.green,
            minWidth: 100.0,
            height: 50.0,
            child: Text(
              "Reset Game",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              this.resetGame();
            },
          ),
        ],
      ),
    );
  }
}
