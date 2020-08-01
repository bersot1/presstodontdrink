import '../pages/home.dart';
import '../theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  ImageProvider logo = AssetImage("assets/icon/TapDrink.png");
  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "TapDrink",
                style: GoogleFonts.notoSans(
                  fontSize: 26.0,
                  color: orangeDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "Your Drink Games App",
            style: GoogleFonts.notoSans(
              fontSize: 18.0,
              color: orangeColor.withOpacity(.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: phoneSize.height / 8),
          Image(
            image: logo,
            height: 202,
          ),
          SizedBox(height: phoneSize.height / 8),
          _button(phoneSize)
        ],
      ),
    );
  }

  Widget _button(phoneSize) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
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
                "Let's Choose a Game",
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
