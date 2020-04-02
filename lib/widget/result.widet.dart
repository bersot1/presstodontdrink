import 'package:flutter/material.dart';

import 'buttonRestart.widget.dart';

class Result extends StatelessWidget {
  var result = "";

  Function func;

  Result({@required this.result, @required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              result,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 40,
                fontFamily: "Big Shoulders Display",
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonRestart(
              label: "Jogar Novamente",
              func: func,
            )
          ],
        ));
  }
}
