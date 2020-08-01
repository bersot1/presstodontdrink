import 'package:TapDrink/pages/getPlayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/game15.dart';
import '../models/game.dart';
import '../theme.dart';

class GamesView extends StatefulWidget {
  final context;
  final GameModel game;
  GamesView({
    @required this.context,
    @required this.game,
  });

  @override
  _GamesViewState createState() => _GamesViewState();
}

class _GamesViewState extends State<GamesView> {
  
  @override
  Widget build(BuildContext context) {
    ImageProvider logo = AssetImage(widget.game.image);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:logo,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
            0.2,
            0.9
          ], colors: [
            Colors.black.withOpacity(.5),
            Colors.black.withOpacity(.5),
          ]),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              _content(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.game.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              color: lightColor,
              fontSize: 45,
              height: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.game.peopleRange,
            style: GoogleFonts.notoSans(
              color: lightColor.withOpacity(.8),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.game.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                color: lightColor,
                height: 1.9,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 20),
          _button(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return GetPlayersPage(context: context, gameChoosed: widget.game);
          },
        ));
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
