import 'package:TapDrink/blocs/playersGameBloc.dart';
import 'package:TapDrink/models/game.dart';
import 'package:TapDrink/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'getPlayers.dart';

class TapGamePage extends StatefulWidget {
  final context;
  final GameModel game;
  TapGamePage({
    @required this.context,
    @required this.game,
  });

  @override
  _TapGamePageState createState() => _TapGamePageState();
}

class _TapGamePageState extends State<TapGamePage> {
  int couter1 = 0;
  int couter2 = 0;
  double countPlayerA = 0.05;
  double countPlayerB = 0.05;

  double resultLinearProgress = 0.5;

  tapButton(double tap) {
    this.resultLinearProgress += tap;
    print(this.resultLinearProgress);
  }

  @override
  Widget build(BuildContext context) {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    return Scaffold(
      backgroundColor: darkColor,
      body: bloc.winner ? _winnerMessage() : _gameProcess(),
    );
  }

  Widget _gameProcess() {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    final phoneSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(height: phoneSize.height / 8),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(20.0),
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: orangeColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(children: [
                    Text(
                      "Quickly click on your name to win the game, the loser drinks",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        fontSize: 18,
                        color: darkColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: LinearProgressIndicator(
                    value: bloc.progressBar,
                    backgroundColor: darkColor,
                    valueColor: new AlwaysStoppedAnimation<Color>(whiteColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => setState(() {
                  couter1++;
                  bloc.tapQuicklyButton(0.15);
                }),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: orangeColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bloc.player1 + " tapped",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                          letterSpacing: 2.0,
                          fontSize: 15,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$couter1",
                          style: GoogleFonts.notoSans(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                          ),
                        ),
                      ),
                      Text(
                        "times",
                        style: GoogleFonts.notoSans(
                          letterSpacing: 2.0,
                          fontSize: 15,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => setState(() {
                  couter2++;
                  bloc.tapQuicklyButton(-0.15);
                }),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: orangeColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bloc.player2 + " tapped",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                          letterSpacing: 2.0,
                          fontSize: 15,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$couter2",
                          style: GoogleFonts.notoSans(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                          ),
                        ),
                      ),
                      Text(
                        "times",
                        style: GoogleFonts.notoSans(
                          letterSpacing: 2.0,
                          fontSize: 15,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _winnerMessage() {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    final phoneSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(height: phoneSize.height / 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(children: [
            Text(
              "${bloc.whoWinner} won the game,\n${bloc.whoLose} drinks now",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 18,
                color: orangeDarkColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ]),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: orangeColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bloc.player1 + " tapped",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        letterSpacing: 2.0,
                        fontSize: 15,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$couter1",
                        style: GoogleFonts.notoSans(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                    Text(
                      "times",
                      style: GoogleFonts.notoSans(
                        letterSpacing: 2.0,
                        fontSize: 15,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: orangeColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bloc.player2 + " tapped",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        letterSpacing: 2.0,
                        fontSize: 15,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$couter2",
                        style: GoogleFonts.notoSans(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                    Text(
                      "times",
                      style: GoogleFonts.notoSans(
                        letterSpacing: 2.0,
                        fontSize: 15,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        _button("Change Players", true),
        SizedBox(height: 30),
        _button("Drink More", false),
      ],
    );
  }

  Widget _button(String title, bool type) {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    return GestureDetector(
      onTap: () {
        if (type == true) {
          bloc.changePlayers();
          Navigator.pop(context);
        } else {
          bloc.repeatRound();
          setState(() => couter1 = 0);
          setState(() => couter2 = 0);
        }
      },
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: orangeDarkColor,
              gradient: LinearGradient(
                colors: [orangeColor, orangeDarkColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 6),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Align(
              child: Text(
                title,
                style: GoogleFonts.notoSans(
                  fontSize: 15,
                  color: whiteColor.withOpacity(.8),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
