import 'package:flutter/material.dart';
import 'package:taptodontdrink/widget/blocGame.widget.dart';
import 'package:taptodontdrink/widget/initialWidget.dart';
import 'package:taptodontdrink/widget/result.widet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double valueProgressBar = 0.5;
  var winner = true;
  var whoWinner = "";
  var initial = true;

  var _playerA = new TextEditingController();
  var _playerB = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return initial
        ? Initial(
            func: startGame,
            playerA: _playerA.text,
            playerB: _playerB.text,
          )
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Column(
              children: <Widget>[
                winner
                    ? BlocGame(
                        labelButtonA: ">",
                        labelButtonB: "<",
                        funcButtonA: () => calculateButton(0.1),
                        funcButtonB: () => calculateButton(-0.1),
                        valueProgressBar: valueProgressBar,
                      )
                    : Result(
                        result: whoWinner,
                        func: restart,
                      )
              ],
            ),
          );
  }

  calculateButton(double i) {
    print(i);
    double aux = valueProgressBar + i;
    if (aux >= 0.9) {
      setState(() {
        winner = !winner;
        whoWinner = "Jogador A GANHOU";
      });
    } else if (aux <= 0.1) {
      setState(() {
        winner = !winner;
        whoWinner = "Jogador B GANHOU";
      });
    }
    setState(() {
      valueProgressBar = aux;
      print(valueProgressBar);
    });
  }

  restart() {
    setState(() {
      winner = !winner;
      valueProgressBar = 0.5;
    });
  }

  startGame() {
    setState(() {
      initial = !initial;
      print(_playerA.text);
    });
  }
}
