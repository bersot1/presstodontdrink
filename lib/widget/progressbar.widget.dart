import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  var value;

  ProgressBar({
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
    );
  }
}
