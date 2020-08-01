import 'package:TapDrink/blocs/playersGameBloc.dart';
import 'package:TapDrink/models/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class FifteenGame extends StatefulWidget {
  final context;
  final GameModel game;
  FifteenGame({
    @required this.context,
    @required this.game,
  });

  @override
  _FifteenGameState createState() => _FifteenGameState();
}

class _FifteenGameState extends State<FifteenGame> {
  int couter1 = 0;
  int couter2 = 0;

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
        SizedBox(height: phoneSize.height / 6),
        Text(
          "Whoever drinks 5 times loses the round, whoever drinks less wins",
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
            fontSize: 18,
            color: orangeColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: phoneSize.height / 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10.0),
                // height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: orangeColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bloc.player1 + " drink",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () => setState(() {
                            if (couter1 != 5) {
                              couter1++;
                            }
                            bloc.tap15GameButton(couter1, couter2);
                          }),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: darkColor,
                            ),
                            child: Center(
                              child: Text(
                                "+",
                                style: GoogleFonts.notoSans(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10.0),
                // height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: orangeColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bloc.player2 + " drink",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () => setState(() {
                            if (couter2 != 5) {
                              couter2++;
                            }
                            bloc.tap15GameButton(couter1, couter2);
                          }),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: darkColor,
                            ),
                            child: Center(
                              child: Text(
                                "+",
                                style: GoogleFonts.notoSans(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
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
              "${bloc.whoWinner} won the game,\n${bloc.whoLose} drinks again",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 18,
                color: orangeDarkColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ]),
        ),
        SizedBox(height: phoneSize.height / 6),
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
          setState(() {
            couter1 = 0;
            couter2 = 0;
          });
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
