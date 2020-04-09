import 'package:flutter/cupertino.dart';

class GameBloc extends ChangeNotifier {
  double progressBar = 0.5;

  tapButton(double tap) {
    this.progressBar += tap;
    notifyListeners();
  }
}
