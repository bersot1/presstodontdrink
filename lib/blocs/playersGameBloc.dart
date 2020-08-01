import 'package:flutter/cupertino.dart';

class PlayersGameBloc extends ChangeNotifier {
  String player1;
  String player2;
  double progressBar = 0.5;
  bool winner = false;
  String whoWinner;
  String whoLose;

  changePlayers() {
    this.winner = false;
    this.player1 = "";
    this.player2 = "";
    this.progressBar = 0.5;
    notifyListeners();
  }

  setUpPlayers(String namePlayer1, String namePlayer2) {
    this.player1 = namePlayer1;
    this.player2 = namePlayer2;
    notifyListeners();
  }

  tapQuicklyButton(double tap) {
    this.progressBar += tap;
    notifyListeners();

    print(this.progressBar);

    if (this.progressBar >= 1.0) {
      this.whoWinner = this.player1;
      this.whoLose = this.player2;
      this.winner = true;
    }

    if (this.progressBar <= 0) {
      this.whoWinner = this.player1;
      this.whoLose = this.player2;
      this.winner = true;
    }
  }

  tap15GameButton(int c1, int c2) {
    if (c1 == 5) {
      this.whoWinner = this.player2;
      this.whoLose = this.player1;
      this.winner = true;
    } else if (c2 == 5) {
      this.whoWinner = this.player1;
      this.whoLose = this.player2;
      this.winner = true;
    }
    notifyListeners();
  }

  repeatRound() {
    this.winner = false;
    this.progressBar = 0.5;
    notifyListeners();
  }
}
