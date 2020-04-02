import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  var label = "";
  Function func;

  ButtonWidget({@required this.label, @required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.all(30),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(80),
          ),
          child: FlatButton(
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 50, fontFamily: "Big Shoulders Display"),
            ),
            onPressed: func,
          ),
        ),
      ],
    );
  }
}
