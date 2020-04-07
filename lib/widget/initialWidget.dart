import 'package:flutter/material.dart';

import 'button.widget.dart';
import 'input.widget.dart';

class Initial extends StatelessWidget {
  var playerACtrl = TextEditingController();
  var playerBCtrl = TextEditingController();

  String pA;
  String pB;

  Function func;

  Initial({@required this.pA, @required this.pB, @required this.func});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cadastre os Jogadores",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 40,
                      fontFamily: "Big Shoulders Display",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Input(
                    label: "Jogador A: ",
                    namePlayer: pA,
                  ),
                  Input(
                    label: "Jogador B: ",
                    namePlayer: pB,
                  ),
                  ButtonWidget(
                    label: "Começar",
                    func: func,
                  )
                ],
              ))
        ],
      ),

      //
    );
  }
}
