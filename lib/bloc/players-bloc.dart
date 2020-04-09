import 'package:flutter/cupertino.dart';

class PlayersGameBloc extends ChangeNotifier {
  var playerA = "";
  var playerB = "";

  setUpPlayers(String namePlayerA, String namePlayerB) {
    this.playerA = namePlayerA;
    this.playerB = namePlayerB;
    notifyListeners();
  }
}
