import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var label = "";

  final TextEditingController namePlayer = new TextEditingController();

  String result = "";
  String player;

  Input({@required this.label, @required namePlayer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.orange,
                fontSize: 35,
                fontFamily: "Big Shoulders Display"),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: TextField(
          controller: namePlayer,
          onSubmitted: (player) {
            result = player;
          },
          keyboardType: TextInputType.text,
          style: TextStyle(
              color: Colors.orange,
              fontSize: 45,
              fontFamily: "Big Shoulders Display"),
          decoration: InputDecoration(border: InputBorder.none),
        ))
      ],
    );
  }
}
