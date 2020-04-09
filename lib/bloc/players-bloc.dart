import 'package:flutter/cupertino.dart';

class PlayersGameBloc extends ChangeNotifier {
  String playerA;
  String playerB;
  double progressBar = 0.5;
  bool winner = false;
  String whoWinner;
  String whoLose;

  setUpPlayers(String namePlayerA, String namePlayerB) {
    this.playerA = namePlayerA;
    this.playerB = namePlayerB;
    notifyListeners();
  }

  tapButton(double tap) {
    this.progressBar += tap;
    notifyListeners();

    print(this.progressBar);

    if (this.progressBar >= 1.0) {
      this.whoWinner = this.playerA;
      this.whoLose = this.playerB;
      this.winner = true;
    }

    if (this.progressBar <= 0) {
      this.whoWinner = this.playerB;
      this.whoLose = this.playerA;
      this.winner = true;
    }
  }

  drinkMore() {
    this.winner = false;
    this.progressBar = 0.5;
    notifyListeners();
  }

  changeWarrios() {
    this.winner = false;
    this.playerA = "";
    this.playerB = "";
    this.progressBar = 0.5;
    notifyListeners();
  }
}
