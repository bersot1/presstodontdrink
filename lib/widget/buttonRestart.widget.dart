import 'package:flutter/material.dart';

class ButtonRestart extends StatelessWidget {
  var label = "";
  Function func;

  ButtonRestart({@required this.label, @required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(60),
      ),
      child: FlatButton(
        child: Text(
          label,
          style: TextStyle(
              color: Colors.orange,
              fontSize: 30,
              fontFamily: "Big Shoulders Display"),
        ),
        onPressed: func,
      ),
    );
  }
}
