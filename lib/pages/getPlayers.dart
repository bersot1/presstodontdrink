import 'package:TapDrink/pages/game15.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/game.dart';
import '../theme.dart';
import '../blocs/playersGameBloc.dart';
import 'gameQuickly.dart';

class GetPlayersPage extends StatefulWidget {
  final context;
  final GameModel gameChoosed;
  GetPlayersPage({
    @required this.context,
    @required this.gameChoosed,
  });

  @override
  _GetPlayersPageState createState() => _GetPlayersPageState();
}

class _GetPlayersPageState extends State<GetPlayersPage> {
  String _player1;
  String _player2;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              _introduction(),
              SizedBox(height: 5),
              _fieldPlayer1(),
              SizedBox(height: 5),
              _fieldPlayer2(),
              SizedBox(height: 10),
              _button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldPlayer1() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return "it's required to have player number 1";
          }
          return null;
        },
        onSaved: (input) => _player1 = input,
        onChanged: (text) {},
        cursorColor: orangeColor,
        style: GoogleFonts.notoSans(
          color: orangeColor.withOpacity(.5),
          fontSize: 21,
        ),
        decoration: InputDecoration(
          counterText: "",
          labelStyle: GoogleFonts.notoSans(
            color: lightColor,
            fontSize: 18,
          ),
          hintText: "Player's Name 1",
          hintStyle: GoogleFonts.notoSans(
            color: lightColor.withOpacity(.5),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _fieldPlayer2() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return "it's required to have player number 2";
          }
          return null;
        },
        onSaved: (input) => _player2 = input,
        onChanged: (text) {},
        cursorColor: lightColor,
        style: GoogleFonts.notoSans(
          color: orangeColor.withOpacity(.5),
          fontSize: 21,
        ),
        decoration: InputDecoration(
          counterText: "",
          labelStyle: GoogleFonts.notoSans(
            color: lightColor,
            fontSize: 18,
          ),
          hintText: "Player's Name 2",
          hintStyle: GoogleFonts.notoSans(
            color: lightColor.withOpacity(.5),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _introduction() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: [
        Text(
          "What are the player's names ?",
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
            fontSize: 25,
            color: orangeDarkColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          widget.gameChoosed.peopleRange,
          textAlign: TextAlign.start,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: orangeColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ]),
    );
  }

  Widget _button() {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          bloc.setUpPlayers(_player1, _player2);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            if (widget.gameChoosed.id == 1) {
              return TapGamePage(game: widget.gameChoosed, context: context);
            } else {
              return FifteenGame(game: widget.gameChoosed, context: context);
            }
          }));
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
                "Let's Play",
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
