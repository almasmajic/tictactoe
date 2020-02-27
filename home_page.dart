import 'package:flutter/material.dart';
import 'package:tic_tac_toe/custom_dialog.dart';
import 'package:tic_tac_toe/game_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1= new List();
    player2= new List();
    activePlayer=1;
    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb){
  setState(() {
    if(activePlayer==1){
      gb.text="X";
      gb.bg= Colors.indigoAccent;
      activePlayer=2;
      player1.add(gb.id);
    }
    else{
      gb.text="O";
      gb.bg=Colors.black;
      activePlayer=1;
      player2.add(gb.id);
    }
    gb.enabled=false;
    checkWinner();
  });
  }

  void checkWinner(){
    var winner=-1;
    if(player1.contains(1)&&player1.contains(2)&&player1.contains(3)){
      winner=1;
    }if(player2.contains(1)&&player2.contains(2)&&player2.contains(3)){
      winner=2;
    }

    if(player1.contains(1)&&player1.contains(4)&&player1.contains(7)){
      winner=1;
    }if(player2.contains(1)&&player2.contains(4)&&player2.contains(7)){
      winner=2;
    }

    if(player1.contains(1)&&player1.contains(5)&&player1.contains(9)){
      winner=1;
    }if(player2.contains(1)&&player2.contains(5)&&player2.contains(9)){
      winner=2;
    }

    if(player1.contains(2)&&player1.contains(5)&&player1.contains(8)){
      winner=1;
    }if(player2.contains(2)&&player2.contains(5)&&player2.contains(8)){
      winner=2;
    }

    if(player1.contains(3)&&player1.contains(5)&&player1.contains(7)){
      winner=1;
    }if(player2.contains(3)&&player2.contains(5)&&player2.contains(7)){
      winner=2;

    }if(player1.contains(3)&&player1.contains(6)&&player1.contains(8)){
      winner=1;
    }if(player2.contains(3)&&player2.contains(6)&&player2.contains(8)){
      winner=2;
    }

    if(winner != -1){
      if(winner==1){
        showDialog(
          context: context,
          builder: (_) => new CustomDialog("Igrac1 je pobjedio!",
              "Za ponovni pokusaj pritisni crvenu tipku.",resetGame));

      }else{
        showDialog(
            context: context,
            builder: (_) => new CustomDialog("Igrac2 je pobjedio!",
            "Za ponovni pokusaj pritisni tipku Reset.",resetGame));
      }
    }
  }

  void resetGame(){
    if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList=doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Tic Tac Toe"),
        ),
        body: new GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount (
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 9.0,
            mainAxisSpacing: 9.0
          ),
          itemCount: buttonsList.length,
          itemBuilder: (context,i)=> new SizedBox(
            width: 100.0,
            height: 100.0,
            child: new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              onPressed: buttonsList[i].enabled
                  ?()=> playGame(buttonsList[i])
                  :null,
              child: new Text(
                buttonsList[i].text,
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: buttonsList[i].bg,
              disabledColor: buttonsList[i].bg,
            ),
          ),
        ));
  }
}
