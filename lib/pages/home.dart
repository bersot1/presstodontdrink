import 'package:TapDrink/models/game.dart';
import 'package:TapDrink/theme.dart';
import 'package:TapDrink/widgets/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _currentIndex = 0;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBody: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              GamesView(context: context, game: gameslist[0]),
              GamesView(context: context, game: gameslist[1]),
            ],
          ),
          _sections(MediaQuery.of(context).size.height),
        ],
      ),
    );
  }

  Widget _sections(_height) {
    var _i = _currentIndex + 1;
    return AnimatedPositioned(
      top: _height * 0.10,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      child: Column(
        children: <Widget>[
          Text(
            "Choose a game",
            style: GoogleFonts.notoSans(
              color: lightColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                "Game " + _i.toString(),
                style: GoogleFonts.notoSans(
                  color: lightColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '/2',
                style: GoogleFonts.notoSans(color: lightColor, fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: _currentIndex == 0
                        ? orangeColor
                        : orangeColor.withOpacity(0.5),
                    shape: BoxShape.circle),
              ),
              SizedBox(width: 5),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: _currentIndex == 1
                        ? orangeColor
                        : orangeColor.withOpacity(0.5),
                    shape: BoxShape.circle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
