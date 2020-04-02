import 'package:flutter/cupertino.dart';
import 'package:taptodontdrink/widget/progressbar.widget.dart';

import 'button.widget.dart';

class BlocGame extends StatelessWidget {
  var labelButtonA = "";
  Function funcButtonA;

  var labelButtonB = "";
  Function funcButtonB;

  var valueProgressBar;

  BlocGame({
    @required this.labelButtonA,
    @required this.funcButtonA,
    @required this.valueProgressBar,
    @required this.labelButtonB,
    @required this.funcButtonB,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonWidget(
          label: labelButtonA,
          func: funcButtonA,
        ),
        SizedBox(height: 80),
        ProgressBar(
          value: valueProgressBar,
        ),
        SizedBox(height: 80),
        ButtonWidget(label: labelButtonB, func: funcButtonB)
      ],
    );
  }
}
