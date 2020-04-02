import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  TextEditingController playerController = new TextEditingController();

  var label = "";
  var player = "";

  Input({@required this.label, @required this.player});

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
            child: TextFormField(
          keyboardType: TextInputType.text,
          controller: playerController,
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
